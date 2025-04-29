import 'dart:async';
import 'dart:convert';
import 'package:fuck_unipus/src/core/base_client.dart';
import 'package:html/parser.dart';

import '../http/decrypt_interceptor.dart';
import '../model/captcha_response/captcha_response.dart';
import '../model/class_block/class_block.dart';
import '../model/session_info/session_info.dart';
import 'html_parser.dart';

class Itests extends BaseClient {
  static const String unipusService = "https://u.unipus.cn/user/comm/login";

  static Future<Itests> newInstance({
    required String cookieDir,
    String cookieSubDir = "default",
  }) async {
    final unipus = Itests._();
    await unipus._init(cookieDir: cookieDir, cookieSubDir: cookieSubDir);
    return unipus;
  }

  Itests._();

  Future<void> _init({
    required String cookieDir,
    required String cookieSubDir,
  }) async {
    await super.initDio(cookieDir: cookieDir, cookieSubDir: cookieSubDir);
    dio.interceptors.add(UnipusDecryptInterceptor());
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

}
