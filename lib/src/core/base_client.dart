import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_redirect_interceptor/dio_redirect_interceptor.dart';
import 'package:path/path.dart';

import '../../fuck_unipus.dart';
import '../http/referer_interceptor.dart';

typedef CaptchaHandler =
Future<String> Function(CaptchaResponse captchaResponse);

abstract class BaseClient {
  late Dio dio;
  late CookieJar cookieJar;
  String get baseUrl;
  String get service;

  Future<void> initDio({
    required String cookieDir,
    required String cookieSubDir,
    bool useProxy = false,
  }) async {
    final directory = join(cookieDir, cookieSubDir);
    if (!await Directory(directory).exists()) {
      await Directory(directory).create(recursive: true);
    }

    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: buildDefaultHeaders(),
        validateStatus: (status) => status! < 500,
        followRedirects: false,
      ),
    );

    cookieJar = PersistCookieJar(storage: FileStorage(directory));

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
      CookieManager(cookieJar),
      RefererInterceptor(),
      RedirectInterceptor(() => dio),
    ]);
  }

  Map<String, String> buildDefaultHeaders() {
    return {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36',
      'Connection': 'keep-alive',
    };
  }

  String extractJsVariable(String html, String variable) {
    final regex = RegExp('$variable:.*?"(.+?)"');
    return regex.firstMatch(html)?.group(1) ?? '';
  }

  void addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
  }

  Future<void> login({
    required String username,
    required String password,
    String? service,
    String? captcha,
    String? encodeCaptcha,
    required CaptchaHandler captchaHandler,
  }) async {
    service ??= this.service;
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

  Future<bool> checkLoginAndSetupSession();
}
