import 'dart:async';
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:fuck_unipus/fuck_unipus.dart';
import 'package:html/parser.dart';


class Unipus extends BaseClient {
  static const String unipusService = "https://u.unipus.cn/user/comm/login";
  UnipusSessionInfo? sessionInfo;

  static Future<Unipus> newInstance({
    required CookieJar cookieJar,
    String? userAgent,
  }) async {
    final unipus = Unipus._();
    await unipus._init(cookieJar: cookieJar, userAgent: userAgent);
    return unipus;
  }

  Unipus._();

  Future<void> _init({
    required CookieJar cookieJar,
    String? userAgent,
  }) async {
    await super.initDio(cookieJar: cookieJar, userAgent: userAgent);
    final tokenInterceptor = InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (sessionInfo?.token != null) {
          options.headers['x-annotator-auth-token'] = sessionInfo!.token;
        }
        return handler.next(options);
      },
    );

    dio.interceptors.addAll([tokenInterceptor, UnipusDecryptInterceptor()]);
  }

  Future<List<UnipusClassBlock>> getCourses() async {
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

  Future<Map<String, dynamic>> getCourseProgressLeaf(
    String tutorialId,
    String leaf,
  ) async {
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

  Future<(Map<String, dynamic>, Map<String, dynamic>)> getCourseDetail(
    String tutorialId,
  ) async {
    final url =
        'https://ucontent.unipus.cn/course/api/course/$tutorialId/default/';

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

  Future<Map<String, dynamic>> getCourseLeafContent(
    String tutorialId,
    String leaf,
  ) async {
    final url =
        'https://ucontent.unipus.cn/course/api/v3/content/$tutorialId/$leaf/default/';

    try {
      final response = await dio.get(url);
      final data = response.data;
      return data;
    } catch (e) {
      throw Exception('Failed to fetch course leaf content: $e');
    }
  }

  Future<Map<String, dynamic>> getCourseSummary(
    String tutorialId,
    String leaf,
  ) async {
    final url =
        'https://ucontent.unipus.cn/course/api/pc/summary/$tutorialId/$leaf/default/';

    try {
      final response = await dio.get(url);
      final data = response.data;

      return data;
    } catch (e) {
      throw Exception('Failed to fetch course summary: $e');
    }
  }

  Future<Map<String, dynamic>> getCourseLeafQuestions(
    String tutorialId,
    String leaf,
  ) async {
    final url =
        'https://ucontent.unipus.cn/course/api/pc/group/$tutorialId/$leaf/default/';

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

  @override
  String baseUrl = "https://u.unipus.cn";

  @override
  String service = unipusService;

  @override
  Future<bool> checkLoginAndSetupSession() async {
    final response = await dio.get('/user/student');
    final isAuthorized = response.data.contains('我的班课');

    if (isAuthorized) {
      sessionInfo = _extractSessionInfo(response.data);
    }
    return isAuthorized;
  }

  UnipusSessionInfo _extractSessionInfo(String html) {
    final document = parse(html);
    final name =
        document
            .querySelector('div.content_left_top_info_welcome label')
            ?.text
            .trim() ??
        '';

    return UnipusSessionInfo(
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
}
