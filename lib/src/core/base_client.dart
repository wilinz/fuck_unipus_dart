import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_redirect_interceptor/dio_redirect_interceptor.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import '../../fuck_unipus.dart';
import '../http/proxy/setup_http_proxy.dart';
import '../http/referer_interceptor.dart';
import 'crypto/encrypt.dart';

const _kIsWeb =
    bool.hasEnvironment('dart.library.js_util')
        ? bool.fromEnvironment('dart.library.js_util')
        : identical(0, 0.0);

typedef CaptchaHandler =
    Future<String> Function(CaptchaResponse captchaResponse);

abstract class BaseClient {
  late Dio dio;
  late CookieJar cookieJar;

  String get baseUrl;

  String get service;

  bool get loginUrlWithSchoolId;

  Future<void> initDio({
    required CookieJar cookieJar,
    bool useProxy = false,
    String? proxyUrl,
    bool allowBadCertificate = false,
    String? userAgent,
    Dio? dio,
  }) async {
    dio ??= Dio(BaseOptions(baseUrl: baseUrl));
    dio.options = dio.options.copyWith(
      headers: buildDefaultHeaders(userAgent),
      validateStatus: (status) => status != null,
      followRedirects: false,
    );

    this.cookieJar = cookieJar;

    // 配置 HTTP 代理（仅在非 Web 平台有效）
    if (useProxy && proxyUrl != null) {
      configureHttpProxy(
        dio,
        proxyUrl: proxyUrl,
        allowBadCertificate: allowBadCertificate,
      );
    }

    if (!_kIsWeb) {
      dio.interceptors.addAll([
        CookieManager(cookieJar),
        RefererInterceptor(defaultReferer: baseUrl),
        RedirectInterceptor(() => dio!),
      ]);
    }
    dio.interceptors.addAll([RetryInterceptor(dio: dio)]);
    this.dio = dio;
  }

  Map<String, String> buildDefaultHeaders(String? userAgent) {
    return {
      'User-Agent':
          userAgent ??
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36',
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
      'https://sso.unipus.cn/sso/0.1/sso/cip/login',
      data: {
        'service': service,
        'username': encryptLoginUser(username),
        'password': encryptLoginUser(password),
        'captcha': captcha ?? '',
        'rememberMe': 'on',
        'captchaCode': captcha ?? '',
        if (encodeCaptcha != null) 'encodeCaptha': encodeCaptcha ?? '',
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
    } else if (ssoResponse.code == '1502') {
      throw Exception(ssoResponse.msg);
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
      // 修复登录问题
      queryParameters: {
        if (loginUrlWithSchoolId) 'school_id': '',
        'ticket': ticket,
      },
    );
    return response.statusCode == 200;
  }

  Future<bool> checkLoginAndSetupSession();
}
