import 'dart:async';
import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:fuck_unipus/src/core/base_client.dart';
import 'package:fuck_unipus/src/core/mobile_app_config.dart';
import 'package:fuck_unipus/src/model/unipus_mobile/mobile_sso_login_result/mobile_sso_login_result.dart';
import 'package:fuck_unipus/src/model/unipus_mobile/mobile_login_result/mobile_login_result.dart';
import 'package:fuck_unipus/src/model/unipus_mobile/mobile_course_class_list/mobile_course_class_list.dart';

class UnipusMobile extends BaseClient {
  static const String unipusService = "https://ucamapi.unipus.cn";

  UnipusMobileSessionInfo? sessionInfo;

  // Mobile app configuration
  late MobileAppConfig _appConfig;

  static Future<UnipusMobile> newInstance({
    required CookieJar cookieJar,
    MobileAppConfig? appConfig,
  }) async {
    final mobile = UnipusMobile._();
    await mobile._init(
      cookieJar: cookieJar,
      appConfig: appConfig,
    );
    return mobile;
  }

  UnipusMobile._();

  Future<void> _init({
    required CookieJar cookieJar,
    MobileAppConfig? appConfig,
  }) async {
    _appConfig = appConfig ?? MobileAppConfig.defaultAndroid();

    await super.initDio(cookieJar: cookieJar, userAgent: _appConfig.userAgent);

    // Add mobile-specific headers interceptor
    final mobileHeadersInterceptor = InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Add common mobile headers if not SSO endpoint
        if (!options.path.contains('sso.unipus.cn')) {
          options.headers.addAll(_buildMobileHeaders());
        }
        return handler.next(options);
      },
    );

    dio.interceptors.add(mobileHeadersInterceptor);
  }

  Map<String, String> _buildMobileHeaders() {
    final headers = _appConfig.toHeaders();

    // Add session-specific headers if available
    if (sessionInfo != null) {
      headers['uni-ticket'] = sessionInfo!.serviceTicket;
      headers['uni-openid-hash'] = sessionInfo!.openidHash;
    }

    return headers;
  }

  /// Get current app configuration
  MobileAppConfig get appConfig => _appConfig;

  /// Update app configuration
  ///
  /// This allows updating device tokens or other configuration at runtime
  void updateAppConfig(MobileAppConfig newConfig) {
    _appConfig = newConfig;
  }

  /// Override parent login method to use mobile-specific login flow
  ///
  /// This method implements the mobile app login flow which includes:
  /// 1. SSO login to get service ticket
  /// 2. Mobile login with the service ticket
  /// 3. Setup session information
  @override
  Future<void> login({
    required String username,
    required String password,
    String? service,
    String? captcha,
    String? encodeCaptcha,
    required CaptchaHandler captchaHandler,
  }) async {
    service ??= this.service;

    try {
      // Step 1: SSO Login
      final ssoResult = await ssoLogin(
        username: username,
        password: password,
        service: service,
        captchaCode: captcha ?? "",
        encodeCaptha: encodeCaptcha ?? "",
      );

      // Handle captcha requirement
      if (ssoResult.code == '1506') {
        final captchaRes = await getCaptcha();
        final newCaptcha = await captchaHandler(captchaRes);
        return login(
          username: username,
          password: password,
          service: service,
          captcha: newCaptcha,
          encodeCaptcha: captchaRes.rs.encodeCaptha,
          captchaHandler: captchaHandler,
        );
      } else if (ssoResult.code != '0') {
        throw Exception('SSO login failed: ${ssoResult.msg}');
      }

      // Step 2: Mobile Login with service ticket
      final mobileResult = await mobileLogin(
        serviceTicket: ssoResult.rs.serviceTicket,
        openidHash: ssoResult.rs.openidHash,
      );

      if (!mobileResult.success) {
        throw Exception('Mobile login failed: ${mobileResult.msg}');
      }

      // Step 3: Verify session
      await checkLoginAndSetupSession();
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  /// SSO Login - Mobile version
  ///
  /// POST /sso/4.0/sso/login
  ///
  /// Parameters:
  /// - [username]: User's username or phone number
  /// - [password]: User's password
  /// - [service]: Service URL (default: "https://ucamapi.unipus.cn")
  /// - [captchaCode]: Captcha code if required
  /// - [encodeCaptha]: Encoded captcha if required
  Future<MobileSsoLoginResult> ssoLogin({
    required String username,
    required String password,
    String? service,
    String captchaCode = "",
    String encodeCaptha = "",
  }) async {
    service ??= "https://ucamapi.unipus.cn";

    final payload = {
      'username': username,
      'password': password,
      'service': service,
      'captchaCode': captchaCode,
      'encodeCaptha': encodeCaptha,
    };

    final response = await dio.post(
      'https://sso.unipus.cn/sso/4.0/sso/login',
      data: jsonEncode(payload),
      options: Options(
        headers: {
          'Content-Type': 'text/plain;charset=utf-8',
          'Host': 'sso.unipus.cn',
          'Connection': 'Keep-Alive',
          'Accept-Encoding': 'gzip',
          'User-Agent': 'okhttp/3.14.9',
        },
      ),
    );

    return MobileSsoLoginResult.fromJson(response.data);
  }

  /// Mobile Login - Authenticate with service ticket
  ///
  /// POST /api/account/unipus/login
  ///
  /// This should be called after ssoLogin with the obtained service ticket
  Future<MobileLoginResult> mobileLogin({
    required String serviceTicket,
    required String openidHash,
  }) async {
    // Update session info with ticket and openid hash
    _updateSessionTicket(serviceTicket, openidHash);

    final response = await dio.post(
      'https://ucamapi.unipus.cn/api/account/unipus/login',
      data: jsonEncode({}),
      options: Options(
        headers: _buildMobileHeaders(),
      ),
    );

    final loginResult = MobileLoginResult.fromJson(response.data);

    // Update session info with full user info
    if (loginResult.success) {
      sessionInfo = UnipusMobileSessionInfo(
        serviceTicket: serviceTicket,
        openidHash: openidHash,
        userInfo: loginResult.rs.userInfo,
      );
    }

    return loginResult;
  }

  /// Complete login flow - SSO login followed by mobile login
  ///
  /// Combines ssoLogin and mobileLogin for convenience
  Future<MobileLoginResult> loginMobile({
    required String username,
    required String password,
    String? service,
  }) async {
    // Step 1: SSO Login
    final ssoResult = await ssoLogin(
      username: username,
      password: password,
      service: service,
    );

    if (ssoResult.code != "0") {
      throw Exception('SSO login failed: ${ssoResult.msg}');
    }

    // Step 2: Mobile Login with service ticket
    final mobileResult = await mobileLogin(
      serviceTicket: ssoResult.rs.serviceTicket,
      openidHash: ssoResult.rs.openidHash,
    );

    return mobileResult;
  }

  /// Get Course Class List
  ///
  /// POST /api/stu/index
  ///
  /// Returns the list of courses and classes for the current student
  Future<MobileCourseClassList> getCourseClassList() async {
    if (sessionInfo == null) {
      throw Exception('Not logged in. Please call loginMobile first.');
    }

    final response = await dio.post(
      'https://ucamapi.unipus.cn/api/stu/index',
      data: jsonEncode({}),
      options: Options(
        headers: _buildMobileHeaders(),
      ),
    );

    return MobileCourseClassList.fromJson(response.data);
  }

  void _updateSessionTicket(String serviceTicket, String openidHash) {
    if (sessionInfo == null) {
      sessionInfo = UnipusMobileSessionInfo(
        serviceTicket: serviceTicket,
        openidHash: openidHash,
        userInfo: null,
      );
    } else {
      sessionInfo = sessionInfo!.copyWith(
        serviceTicket: serviceTicket,
        openidHash: openidHash,
      );
    }
  }

  @override
  String get baseUrl => "https://ucamapi.unipus.cn";

  @override
  String get service => unipusService;

  @override
  bool get loginUrlWithSchoolId => false;

  @override
  Future<bool> checkLoginAndSetupSession() async {
    if (sessionInfo == null) {
      return false;
    }

    try {
      final courseList = await getCourseClassList();
      return courseList.success;
    } catch (e) {
      return false;
    }
  }
}

/// Mobile Session Information
class UnipusMobileSessionInfo {
  final String serviceTicket;
  final String openidHash;
  final MobileLoginResultUserInfo? userInfo;

  UnipusMobileSessionInfo({
    required this.serviceTicket,
    required this.openidHash,
    required this.userInfo,
  });

  UnipusMobileSessionInfo copyWith({
    String? serviceTicket,
    String? openidHash,
    MobileLoginResultUserInfo? userInfo,
  }) {
    return UnipusMobileSessionInfo(
      serviceTicket: serviceTicket ?? this.serviceTicket,
      openidHash: openidHash ?? this.openidHash,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  String? get openid => userInfo?.openid;
  String? get token => userInfo?.token;
  String? get username => userInfo?.username;
  String? get nickname => userInfo?.nickname;
  int? get uid => userInfo?.uid;
  int? get schoolId => userInfo?.schoolId;
  String? get schoolName => userInfo?.schoolName;
}