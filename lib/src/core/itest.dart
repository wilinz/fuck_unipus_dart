import 'dart:async';
import 'package:fuck_unipus/fuck_unipus.dart';
import 'package:html/parser.dart';


class Itest extends BaseClient {
  final timestamp = DateTime.now().millisecondsSinceEpoch;

  String get itestsService =>
      "https://itestcloud.unipus.cn/utest/itest/login?_rp=/itest?x=$timestamp";

  static Future<Itest> newInstance({
    required String cookieDir,
    String cookieSubDir = "default",
  }) async {
    final unipus = Itest._();
    await unipus._init(cookieDir: cookieDir, cookieSubDir: cookieSubDir);
    return unipus;
  }

  Itest._();

  Future<void> _init({
    required String cookieDir,
    required String cookieSubDir,
  }) async {
    await super.initDio(cookieDir: cookieDir, cookieSubDir: cookieSubDir);
    dio.interceptors.add(UnipusDecryptInterceptor());
  }

  @override
  String get baseUrl => "https://itestcloud.unipus.cn/";

  @override
  String get service => itestsService;

  @override
  Future<bool> checkLoginAndSetupSession() async {
    final response = await dio.get('/utest/itest/s/exam');
    final isAuthorized = response.data.contains('我的班级');

    if (isAuthorized) {
      _extractSessionInfo(response.data);
    }
    return isAuthorized;
  }

  _extractSessionInfo(String html) {
    final document = parse(html);
    final name =
        document
            .querySelector('div.content_left_top_info_welcome label')
            ?.text
            .trim() ??
        '';


  }

  String _extractJsVariable(String html, String variable) {
    final regex = RegExp('$variable:.*?"(.+?)"');
    return regex.firstMatch(html)?.group(1) ?? '';
  }

  Future<ItestExamListResponse> getExamList(
    String tutorialId,
    String leaf,
  ) async {
    final url = 'utest/itest-mobile-api/student/exam/list';
    final response = await dio.get(url);
    final data = ItestExamListResponse.fromJson(response.data);
    return data;
  }
}
