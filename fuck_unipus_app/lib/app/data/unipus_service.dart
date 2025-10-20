import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:fuck_unipus/fuck_unipus.dart';

class UnipusService extends GetxService {
  Unipus? _client;
  PersistCookieJar? _cookieJar;
  String? _username;
  Directory? _cookiesRoot;

  Future<UnipusService> init() async {
    if (kIsWeb) {
      throw UnsupportedError('Web is not supported for this workflow');
    }

    _cookiesRoot ??= await _resolveCookiesDirectory();
    return this;
  }

  Future<bool> prepareClient(String username) async {
    final trimmed = username.trim();
    if (trimmed.isEmpty) {
      throw ArgumentError('用户名不能为空');
    }

    await init();

    if (_client != null && _username == trimmed) {
      return _client!.checkLoginAndSetupSession();
    }

    _username = trimmed;

    final userDir = Directory(p.join(_cookiesRoot!.path, trimmed));
    if (!await userDir.exists()) {
      await userDir.create(recursive: true);
    }

    _cookieJar = PersistCookieJar(storage: FileStorage(userDir.path));
    _client = await Unipus.newInstance(cookieJar: _cookieJar!);
    return _client!.checkLoginAndSetupSession();
  }

  Future<void> login({required String password}) async {
    final client = _ensureClient();
    final username = _username;
    if (username == null) {
      throw StateError('请先输入用户名');
    }

    await client.login(
      username: username,
      password: password,
      captchaHandler: (captchaResponse) async {
        throw UnimplementedError('暂不支持验证码登录');
      },
    );
  }

  UnipusSessionInfo? get sessionInfo => _client?.sessionInfo;

  String? get username => _username;

  Future<List<UnipusClassBlock>> fetchCourses() async {
    final client = _ensureClient();
    return client.getCourses();
  }

  Future<Map<String, dynamic>> fetchCourseProgress(String tutorialId) async {
    final client = _ensureClient();
    return client.getCourseProgress(tutorialId);
  }

  Future<Map<String, dynamic>> fetchCourseProgressLeaf(
    String tutorialId,
    String leaf,
  ) async {
    final client = _ensureClient();
    return client.getCourseProgressLeaf(tutorialId, leaf);
  }

  Future<(Map<String, dynamic>, Map<String, dynamic>)> fetchCourseDetail(
    String tutorialId,
  ) async {
    final client = _ensureClient();
    return client.getCourseDetail(tutorialId);
  }

  Future<Map<String, dynamic>> fetchLeafContent(
    String tutorialId,
    String url,
  ) async {
    final client = _ensureClient();
    return client.getCourseLeafContent(tutorialId, url);
  }

  Future<Map<String, dynamic>> fetchLeafSummary(
    String tutorialId,
    String url,
  ) async {
    final client = _ensureClient();
    return client.getCourseSummary(tutorialId, url);
  }

  Future<Map<String, dynamic>> fetchLeafQuestions(
    String tutorialId,
    String url,
  ) async {
    final client = _ensureClient();
    return client.getCourseLeafQuestions(tutorialId, url);
  }

  Unipus _ensureClient() {
    final client = _client;
    if (client == null) {
      throw StateError('Unipus client 未初始化');
    }
    return client;
  }

  Future<Directory> _resolveCookiesDirectory() async {
    Directory baseDir;
    if (Platform.isAndroid || Platform.isIOS) {
      baseDir = await getApplicationSupportDirectory();
    } else {
      baseDir = await getApplicationDocumentsDirectory();
    }
    final target = Directory(p.join(baseDir.path, 'unipus_cookies'));
    if (!await target.exists()) {
      await target.create(recursive: true);
    }
    return target;
  }
}
