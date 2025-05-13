import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:fuck_unipus/fuck_unipus.dart';
import 'package:fuck_unipus/src/utils/random.dart';
import 'package:html/parser.dart';
import 'package:pure_dart_extensions/pure_dart_extensions.dart';

import 'html_parser/exam_blocking_html.dart';

class Itest extends BaseClient {
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  late String loggerOpenId;

  String get itestsService =>
      "https://itestcloud.unipus.cn/utest/itest/login?_rp=/itest?x=$timestamp";

  static Future<Itest> newInstance({
    required String cookieDir,
    String cookieSubDir = "default",
    String? loggerOpenId,
  }) async {
    final itest = Itest._();
    itest.loggerOpenId = loggerOpenId ?? generateRandomMd5();
    print("loggerOpenId: ${itest.loggerOpenId}");
    await itest._init(cookieDir: cookieDir, cookieSubDir: cookieSubDir);
    return itest;
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

  /// Next step is to call judgeEntry(examId: response.rs.data[i].ksdId)
  Future<ItestExamListResponse> getExamList({
    int curPage = 1,
    int pageSize = 20,
  }) async {
    final url = 'utest/itest-mobile-api/student/exam/list';
    final response = await dio.post(
      url,
      data: {"curPage": curPage, "pageSize": pageSize},
    );
    final data = ItestExamListResponse.fromJson(response.data);
    return data;
  }

  /// examId: ksdId , call getExamList() to get it
  /// if success, next step is to call confirmExam(url: response.data.url);
  Future<ItestExamJudgeEntryResponse> judgeEntry({
    required String examId,
    String examCode = "",
  }) async {
    final url = 'utest/itest/s/clsanswer/judgeEntry';
    final response = await dio.post(
      url,
      data: {"examId": examId, "examCode": examCode},
      options: Options(
        headers: {"content-type": Headers.formUrlEncodedContentType},
      ),
    );
    final data = ItestExamJudgeEntryResponse.fromJson(response.data);
    return data;
  }

  /// next: examPaperResourceInfo()
  Future<ItestExamInfoResponse> examInfo({required String token}) async {
    final response = await dio.get(
      'itest-api/itest/s/answer/ksInfo',
      queryParameters: {"token": token},
      options: Options(responseType: ResponseType.plain),
    );
    final data = ItestExamInfoResponse.fromJson(jsonDecode(response.data));
    return data;
  }

  // return: html string
  Future<String> getAnswerSheets({required String token}) async {
    final url =
        "https://itestcloud.unipus.cn/itest-api/itest/s/answer/index?returnUrl=https://itestcloud.unipus.cn/utest/itest/s/exam&skipEnvTest=true";
    final response = await dio.get(url, queryParameters: {"token": token});
    return response.data;
  }

  // 必须先调用 getAnswerSheets 获取答题卡，不然 404
  Future<(ItestExamQuestionsWrapResponse, ItestExamQuestions?)>
  getExamQuestions({required ItestConfirmExamData confirmExamData}) async {
    //https://itestcloud.unipus.cn/itest-api/itest/s/answer/index?token=.---.&returnUrl=https://itestcloud.unipus.cn/utest/itest/s/exam&skipEnvTest=true
    final url = "itest-api/itest/s/answer/load";
    final form = {
      "dataid": confirmExamData.sppid,
      "examId": "",
      "dataType": confirmExamData.dataType,
      "dataSource": confirmExamData.dataSource,
      "dataUser": confirmExamData.dataUser,
      "openId": confirmExamData.openId,
    };
    final t = Random().nextDouble();
    final response = await dio.post(
      url,
      data: form,
      queryParameters: {"t": t},
      options: Options(
        headers: {"content-type": Headers.formUrlEncodedContentType},
        responseType: ResponseType.plain,
      ),
    );
    final data = ItestExamQuestionsWrapResponse.fromJson(
      jsonDecode(response.data),
    );
    final questions = parseExamQuestions(data.data.cHTML);
    return (data, questions);
  }

  Future<Map<String, dynamic>> buildAnswer({
    required ItestConfirmExamData confirmExamData,
    required String uik,
    required ItestExamQuestions questions,
    required Future<List<int>> Function(
      int index,
      ItestExamQuestionsQuestionsItem question,
    )
    getAnswer,
  }) async {
    final answer = <Map<String, dynamic>>[];

    for (final (_, question) in questions.questions.indexed) {
      answer.add({
        "q": question.id, // qid
        "d": [
          [""],
        ],
        "o": [
          // option order
          [question.optionsOrder],
        ],
        "role": "",
        "rnp": "-1",
        "rl": -1,
      });
    }
    final watch = Stopwatch();
    watch.start();

    final timer = Timer.periodic(Duration(minutes: 1), (timer) async {
      final usageTime = watch.elapsed.inSeconds;
      final data = {
        "al": answer,
        "sl": [
          {"sid": questions.sectionId, "rnp": "-1"},
        ],
        "ut": usageTime,
      };
      await log(
        confirmExamData: confirmExamData,
        action: ExamLoggerAction.ansSnapSubmit,
        answers: data,
      );
      await _submit(answers: data, confirmExamData: confirmExamData, uik: uik, action: ExamSubmitAction.cache);
    });

    for (final (i, question) in questions.questions.indexed) {
      final answerOptions = await getAnswer(i, question);
      print("第${i+1}题答案：$answerOptions");
      answer[i]['d'] = [answerOptions];
      final sleep = Random().nextInt(5) + 5;
      await Future.delayed(Duration(seconds: sleep));
      await log(
        confirmExamData: confirmExamData,
        action: ExamLoggerAction.nextQuestionClick,
      );
    }
    final usageTime = watch.elapsed.inSeconds;
    final data = {
      "al": answer,
      "sl": [
        {"sid": questions.sectionId, "rnp": "-1"},
      ],
      "ut": usageTime,
    };
    await log(
      confirmExamData: confirmExamData,
      action: ExamLoggerAction.ansSnapSubmit,
      answers: data,
    );
    timer.cancel();
    return data;
  }

  /// uik: ItestExamQuestionsWrapData.uIK
  Future<ItestExamSubmitResponse> submit({
    required Map<String, dynamic> answers,
    required ItestConfirmExamData confirmExamData,
    required String uik,
  }) async {
    try {
      await log(
            confirmExamData: confirmExamData,
            action: ExamLoggerAction.ansSnapSubmit,
            answers: answers,
          );
      final resp1 = await _submit(
            answers: answers,
            confirmExamData: confirmExamData,
            uik: uik,
            action: ExamSubmitAction.cache,
          );
    } catch (e) {
      print(e);
    }
    final resp2 = await _submit(
      answers: answers,
      confirmExamData: confirmExamData,
      uik: uik,
      action: ExamSubmitAction.save,
    );
    await log(
      confirmExamData: confirmExamData,
      action: ExamLoggerAction.examEnd,
    );
    return resp2;
  }

  Future<ItestExamSubmitResponse> _submit({
    required Map<String, dynamic> answers,
    required ItestConfirmExamData confirmExamData,
    required String uik,
    required String action,
  }) async {
    final url = "itest-api/itest/s/answer/submit";
    final t = Random().nextDouble();
    final clearUik = action == "save";
    final exitFlag = action == "save" ? "1" : "";

    final form = {
      "ansData": jsonEncode(answers),
      "act": action,
      "sppid": confirmExamData.sppid,
      "uik": uik,
      "clearUik": clearUik,
      "dataType": confirmExamData.dataType,
      "dataSource": confirmExamData.dataSource,
      "dataUser": confirmExamData.dataUser,
      "openId": confirmExamData.openId,
      "exitFlag": exitFlag,
      "__t": t,
    };

    final response = await dio.post(
      url,
      data: form,
      options: Options(
        responseType: ResponseType.plain,
        headers: {"content-type": Headers.formUrlEncodedContentType},
      ),
    );
    final data = ItestExamSubmitResponse.fromJson(jsonDecode(response.data));
    return data;
  }

  /// action: pre_ques_click, next_ques_click, exam_end, ans_snap_submit, use ExamLoggerAction
  Future<dynamic> log({
    required ItestConfirmExamData confirmExamData,
    required String action,
    Map<String, dynamic>? answers,
  }) async {
    final url = "itest/log";

    if (action == ExamLoggerAction.ansSnapSubmit && answers == null) {
      throw Exception("Action is 'ans_snap_submit', but answers is null");
    }

    final msgMap = {
      ExamLoggerAction.preQuestionClick: "进入上一题",
      ExamLoggerAction.nextQuestionClick: "进入下一题",
      ExamLoggerAction.examEnd: "考试结束",
      ExamLoggerAction.ansSnapSubmit: jsonEncode(answers),
    };

    final msg = msgMap[action];

    if (msg == null) {
      throw Exception("Unknown action: $action");
    }

    final dataType = confirmExamData.dataType.toIntOrNull();
    int examType = 1;
    // 5模考；6 班级测试  7 是测试 8是学校考试 9班级训练
    if (dataType == 6) {
      examType = 1;
    } else if (dataType == 8) {
      examType = 0;
    } else if (dataType == 9) {
      examType = 4;
    } else {
      throw Exception("ItestConfirmExamData dataType error");
    }

    final cookies = await cookieJar.loadForRequest(
      Uri.parse("https://itestcloud.unipus.cn/itest/log"),
    );
    final schoolCode =
        cookies.firstOrNullWhere((e) => e.name == "p_schoolcode")?.value;

    final form = {
      "host": "https://itestcloud.unipus.cn",
      "level": "info", // 等级 info\error\warn
      "msg": msg,
      "action": action,
      "client": "WEB",
      "schoolcode": schoolCode,
      "uid": confirmExamData.dataUser,
      "logtime": DateTime.now().millisecondsSinceEpoch,
      "examid": confirmExamData.sppid,
      "examtype": examType,
      "openid": loggerOpenId, // window.__finger, //浏览器唯一标识
      "lanip": "",
    };

    if(form['action'] != ExamLoggerAction.ansSnapSubmit) {
      final body = Map.from(form)..['msg'] = "";
      print("sent log: $body");
    }

    final response = await dio.post(url, data: [form]);
    final data = response.data;
    return data;
  }

  Future<ItestExamRenewTokenResponse> renewToken({
    required String token,
  }) async {
    final response = await dio.post(
      'utest/itest-mobile-api/student/exam/examToken',
      options: Options(headers: {"token": token}),
    );
    final data = ItestExamRenewTokenResponse.fromJson(response.data);
    return data;
  }

  /// next: examWait
  Future<ItestExamPaperResourceInfoResponse> examPaperResourceInfo({
    required String token,
  }) async {
    final response = await dio.get(
      'itest-api/api/mobile/paper/paper/resource/info',
      queryParameters: {"token": token},
    );
    final data = ItestExamPaperResourceInfoResponse.fromJson(response.data);
    return data;
  }

  Future<ItestExamWaitResponse> examWait({required String token}) async {
    final response = await dio.post(
      '/itest-api/itest/s/answer/exam/wait',
      data: {"token": token},
      options: Options(
        headers: {"content-type": Headers.formUrlEncodedContentType},
      ),
    );
    final data = ItestExamWaitResponse.fromJson(response.data);
    return data;
  }

  /// returnUrl: https://itestcloud.unipus.cn/utest/itest/s/exam
  /// next: examInfo()
  Future<ItestConfirmExamData> confirmExam({
    required String token,
    String returnUrl = "https://itestcloud.unipus.cn/utest/itest/s/exam",
  }) async {
    final response = await dio.get<String>(
      "itest-api/itest/s/answer/index?",
      queryParameters: {"token": token, "returnUrl": returnUrl},
    );
    final url = "/itest-api/itest/s/answer/closeReferNotify";
    if (response.data?.contains(url) == true) {
      final data = parseCloseReferNotifyData(response.data!);
      if (data == null) {
        throw Exception("parseCloseReferNotifyData fielded: ${response.data}");
      }
      final resp = await dio.post(
        url,
        data: data,
        options: Options(responseType: ResponseType.plain),
      );
      final json = jsonDecode(resp.data);
      if (resp.statusCode == 200 && json['code'] == 0) {
        return confirmExam(token: token, returnUrl: returnUrl);
      }
    }
    final data = parseConfirmExamData(response.data!);
    return data;
  }

  Future<Map<String, dynamic>> loadExam() async {
    final url = 'itest-api/itest/s/answer/load?t=0.016521961806345242';
    final response = await dio.get(url);
    final data = response.data;
    return data;
  }
}

class ExamLoggerAction {
  static const String preQuestionClick = 'pre_ques_click';
  static const String nextQuestionClick = 'next_ques_click';
  static const String examEnd = 'exam_end';
  static const String ansSnapSubmit = 'ans_snap_submit';
}

class ExamSubmitAction {
  static const String cache = 'cache';
  static const String save = 'save';
}
