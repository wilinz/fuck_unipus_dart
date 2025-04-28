import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_redirect_interceptor/dio_redirect_interceptor.dart';
import 'package:html/parser.dart';
import 'package:path/path.dart';

import '../http/decrypt_interceptor.dart';
import '../model/captcha_response/captcha_response.dart';
import '../model/class_block/class_block.dart';
import '../model/session_info/session_info.dart';
import '../model/sso_login_response/sso_login_response.dart';
import 'html_parser.dart';

typedef CaptchaHandler =
    Future<String> Function(CaptchaResponse captchaResponse);

class Unipus {
  late Dio dio;
  SessionInfo? sessionInfo;
  late CookieJar _cookieJar;
  static const String unipusService = "https://u.unipus.cn/user/comm/login";

  static Future<Unipus> newInstance({
    required String cookieDir,
    String cookieSubDir = "default",
  }) async {
    final unipus = Unipus._();
    await unipus._init(cookieDir: cookieDir, cookieSubDir: cookieSubDir);
    return unipus;
  }

  Unipus._();

  Future<void> _init({
    required String cookieDir,
    required String cookieSubDir,
  }) async {
    final directory = join(cookieDir, cookieSubDir);
    if (!await Directory(directory).exists()) {
      await Directory(directory).create(recursive: true);
    }

    dio = Dio(
      BaseOptions(
        baseUrl: 'https://u.unipus.cn',
        headers: _buildDefaultHeaders(),
        validateStatus: (status) => status! < 500,
        followRedirects: false,
      ),
    );

    _cookieJar = PersistCookieJar(storage: FileStorage(directory));

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.findProxy = (uri) {
        return "PROXY 127.0.0.1:9000";
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.interceptors.addAll([
      CookieManager(_cookieJar),
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (sessionInfo?.token != null) {
            options.headers['x-annotator-auth-token'] = sessionInfo!.token;
          }
          return handler.next(options);
        },
      ),
      DecryptInterceptor(),
      RedirectInterceptor(() => dio),
    ]);
  }

  Map<String, String> _buildDefaultHeaders() {
    return {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
      'Connection': 'keep-alive',
    };
  }

  Future<bool> checkLoginAndSetupSession() async {
    final response = await dio.get('/user/student');
    final isAuthorized = response.data.contains('我的班课');

    if (isAuthorized) {
      sessionInfo = _extractSessionInfo(response.data);
    }
    return isAuthorized;
  }

  SessionInfo _extractSessionInfo(String html) {
    final document = parse(html);
    final name =
        document
            .querySelector('div.content_left_top_info_welcome label')
            ?.text
            .trim() ??
        '';

    return SessionInfo(
      name: name,
      token: _extractJsVariable(html, 'token'),
      openid: _extractJsVariable(html, 'openId'),
      websocketUrl: _extractJsVariable(html, 'wsURL'),
    );
  }

  String _extractJsVariable(String html, String variable) {
    final regex = RegExp('$variable:.*?"(.+?)"');
    return regex.firstMatch(html)?.group(1) ?? '';
  }

  Future<void> login({
    required String username,
    required String password,
    required String service,
    String? captcha,
    String? encodeCaptcha,
    required CaptchaHandler captchaHandler,
  }) async {
    await dio.get(
      'https://sso.unipus.cn/sso/login',
      queryParameters: {"service": service},
    );
    await dio.post('https://sso.unipus.cn/sso/3.0/sso/server_time');

    final response = await dio.post(
      'https://sso.unipus.cn/sso/0.1/sso/login',
      data: {
        'service': service,
        'username': username,
        'password': password,
        'captcha': captcha ?? '',
        'rememberMe': 'on',
        'captchaCode': captcha ?? '',
        'encodeCaptha': encodeCaptcha ?? '',
      },
    );

    final ssoResponse = SsoLoginResponse.fromJson(response.data);

    if (ssoResponse.code == '1506') {
      final captchaRes = await getCaptcha();
      // 显示验证码逻辑
      final newCaptcha = await captchaHandler(captchaRes);
      return login(
        username: username,
        password: password,
        service: service,
        captcha: newCaptcha,
        encodeCaptcha: captchaRes.rs.encodeCaptha,
        captchaHandler: captchaHandler,
      );
    }

    await loginWithTicket(service, ssoResponse.rs.serviceTicket);
    await checkLoginAndSetupSession();
  }

  Future<CaptchaResponse> getCaptcha() async {
    final response = await dio.post(
      'https://sso.unipus.cn/sso/4.0/sso/image_captcha2',
    );
    return CaptchaResponse.fromJson(response.data);
  }

  Future<bool> loginWithTicket(String service, String ticket) async {
    final response = await dio.get(
      service,
      queryParameters: {'school_id': '', 'ticket': ticket},
    );
    return response.statusCode == 200;
  }

  Future<List<ClassBlock>> getCourses() async {
    final response = await dio.get('/user/student?school_id=10196');
    return parseCoursesToJson(response.data);
  }

  Future<Map<String, dynamic>> getCourseProgress(String tutorialId) async {
    final openid = sessionInfo?.openid;
    if (openid == null) {
      throw Exception('Session openid is not available');
    }

    final url =
        'https://ucontent.unipus.cn/course/api/v2/course_progress/$tutorialId/$openid/default/';

    try {
      final response = await dio.get(url);
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch course progress: $e');
    }
  }

  Future<Map<String, dynamic>> getCourseProgressLeaf(String tutorialId, String leaf) async {
    final openid = sessionInfo?.openid;
    if (openid == null) {
      throw Exception('Session openid is not available');
    }

    final url =
        'https://ucontent.unipus.cn/course/api/v2/course_progress/$tutorialId/$leaf/$openid/default/';

    try {
      final response = await dio.get(url);

      // 解析 JSON 数据
      final data = response.data;
      return data;
    } catch (e) {
      throw Exception('Failed to fetch course progress leaf: $e');
    }
  }

  Future<(Map<String, dynamic>, Map<String, dynamic>)> getCourseDetail(String tutorialId) async {
    final url = 'https://ucontent.unipus.cn/course/api/course/$tutorialId/default/';

    try {
      final response = await dio.get(url);

      // 解析 JSON 数据
      final data = response.data as Map<String, dynamic>;

      // 获取 "course" 字段
      final course = jsonDecode(data['course']) as Map<String, dynamic>;

      return (data, course);
    } catch (e) {
      throw Exception('Failed to fetch course detail: $e');
    }
  }

  Future<Map<String, dynamic>> getCourseLeafContent(String tutorialId, String leaf) async {
    final url = 'https://ucontent.unipus.cn/course/api/v3/content/$tutorialId/$leaf/default/';

    try {
      final response = await dio.get(url);
      final data = response.data;
      return data;
    } catch (e) {
      throw Exception('Failed to fetch course leaf content: $e');
    }
  }

  Future<Map<String, dynamic>> getCourseSummary(String tutorialId, String leaf) async {
    final url = 'https://ucontent.unipus.cn/course/api/pc/summary/$tutorialId/$leaf/default/';

    try {
      final response = await dio.get(url);
      final data = response.data;

      return data;
    } catch (e) {
      throw Exception('Failed to fetch course summary: $e');
    }
  }

  Future<Map<String, dynamic>> getCourseLeafQuestions(String tutorialId, String leaf) async {
    final url = 'https://ucontent.unipus.cn/course/api/pc/group/$tutorialId/$leaf/default/';

    try {
      final response = await dio.get(url);
      final data = response.data;

      // 获取 "group" 字段，如果存在则返回解析后的数据
      if (data['group'] != null) {
        return jsonDecode(data['group']);
      }

      return data;
    } catch (e) {
      throw Exception('Failed to fetch course leaf questions: $e');
    }
  }

}
