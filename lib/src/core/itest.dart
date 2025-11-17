import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:fuck_unipus/fuck_unipus.dart';
import 'package:fuck_unipus/src/utils/list.dart';
import 'package:fuck_unipus/src/utils/random.dart';
import 'package:html/parser.dart';
import 'package:pure_dart_extensions/pure_dart_extensions.dart';

enum ItestPlatformType { itestcloud, uexercise }

class Itest extends BaseClient {
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  late String loggerOpenId;

  String get itestsService =>
      "https://itestcloud.unipus.cn/utest/itest/login?_rp=/itest?x=$timestamp";

  static Future<Itest> newInstance({
    required CookieJar cookieJar,
    String? loggerOpenId,
    String? userAgent,
    Dio? dio,
  }) async {
    final itest = Itest._();
    itest.loggerOpenId = loggerOpenId ?? generateRandomMd5();
    print("loggerOpenId: ${itest.loggerOpenId}");
    await itest._init(cookieJar: cookieJar, userAgent: userAgent, dio: dio);
    return itest;
  }

  Itest._();

  Future<void> _init({
    required CookieJar cookieJar,
    String? userAgent,
    Dio? dio,
  }) async {
    await super.initDio(cookieJar: cookieJar, userAgent: userAgent, dio: dio);
    this.dio.interceptors.add(UnipusDecryptInterceptor());
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
    required String examTypeEnum,
  }) async {
    final url = 'utest/itest/s/clsanswer/judgeEntry';
    final url2 = 'utest/itest/s/exam/judgeEntry';

    // SCHOOL or CLS
    final u = examTypeEnum.toUpperCase() == "SCHOOL" ? url2 : url;
    final response = await dio.post(
      u,
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
        "itest-api/itest/s/answer/index?returnUrl=https://itestcloud.unipus.cn/utest/itest/s/exam&skipEnvTest=true";
    final response = await dio.get(url, queryParameters: {"token": token});
    return response.data;
  }

  // 必须先调用 getAnswerSheets 获取答题卡，不然 404
  Future<(ItestExamQuestionsWrapResponse, List<ItestExamQuestions>?)>
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
    final questions = itestExamQuestionsListFormJson(
      parseExamQuestionsMap(data.data.cHTML),
    );
    return (data, questions);
  }

  static Future<Map<String, dynamic>> buildAnswer({
    required ItestConfirmExamData? confirmExamData,
    required String? uik,
    required List<ItestExamQuestions> sections,
    required ExamLogFunction? logFunction,
    required ExamSubmitFunction submit,
    required Future<List<List<int>>> Function(
      List<int> indexList,
      ItestExamQuestionsQuestionGroupItem question,
    )
    getChooseAnswer,
    required Future<List<List<String>>> Function(
      List<int> indexList,
      ItestExamQuestionsQuestion question,
    )
    getArticleFillBlankAnswer,
    required Future<String> Function(
      int index,
      ItestExamQuestionsWriteQuestion question,
    )
    getWritingAnswer,
    required Future<ItestExamQuestionsAudio> Function(ItestExamQuestionsAudio audio) audioToText,
    void Function(int index)? progressCallback,
    void Function(int index, int total)? writingProgressCallback,
    void Function(dynamic text)? logger,
    bool notSleep = false,
    required ItestPlatformType itestPlatformType,
  }) async {

    if (itestPlatformType == ItestPlatformType.itestcloud && (confirmExamData == null || uik == null || logFunction == null)) {
      throw Exception("confirmExamData, uik, logFunction is required when itestPlatformType is itestcloud");
    }
    
    // throw Exception();
    final answers = <Map<String, dynamic>>[];
    final sectionList = <Map<String, dynamic>>[];

    // 内部辅助函数
    void addPlatformSpecificFields(Map<String, dynamic> answer, String? rl) {
      if (itestPlatformType == ItestPlatformType.itestcloud) {
        answer['rl'] = rl;
        answer['role'] = "";
      } else if (itestPlatformType == ItestPlatformType.uexercise) {
        answer['f'] = "";
        answer['vl'] = "";
      }
    }

    for (final section in sections) {
      sectionList.add({"sid": section.sectionId, "rnp": section.resNeedPlay});
      if (["listening", "read_article", "choose"].contains(section.type)) {
        for (final group in section.questionGroup!) {
          final answer = {
            "q": group.id, // qid
            "d": group.questions.map((e) => <dynamic>[""]).toList(),
            "o": group.questions.map((e) => [e.optionsOrder]).toList(),
            "rnp": group.resNeedPlay,
          };
          addPlatformSpecificFields(answer, group.rl);
          answers.add(answer);
        }
      } else if (section.type == "article_fill_blank") {
        final q = section.question!;
        final inputs = q.content.where((e) => e.type == "input").toList();
        final answer = {
          "q": inputs.first.qid, // qid
          "d": inputs.map((e) => <dynamic>[""]).toList(),
          "o": inputs.map((e) => [[]]).toList(),
          "rnp": q.resNeedPlay,
        };
        addPlatformSpecificFields(answer, q.rl);
        answers.add(answer);
      } else if (section.type == "write") {
        final q = section.writeQuestion!;
        final answer = {
          "q": q.id, // qid
          "d": [
            <dynamic>[""],
          ],
          "o": [
            [[]],
          ],
          "rnp": q.resNeedPlay,
        };
        addPlatformSpecificFields(answer, q.rl);
        answers.add(answer);
      }
    }

    final watch = Stopwatch();
    watch.start();

    Future<void> sleepRandomSecond(
      int i,
      ItestConfirmExamData? confirmExamData,
      int sleepSeconds,
    ) async {
      await logFunction?.call(
        confirmExamData: confirmExamData,
        action: ExamLoggerAction.nextQuestionClick,
      );
      await Future.delayed(Duration(seconds: sleepSeconds));
    }

    final timer = Timer.periodic(Duration(minutes: 1), (timer) async {
      final usageTime = watch.elapsed.inSeconds;

      final data = {"al": answers, "sl": sectionList, "ut": usageTime};
      await logFunction?.call(
        confirmExamData: confirmExamData,
        action: ExamLoggerAction.ansSnapSubmit,
        answers: data,
      );
      await submit(
        answers: data,
        confirmExamData: confirmExamData,
        uik: uik,
        action: ExamSubmitAction.cache,
      );
    });

    for (final section in sections) {
      if (["listening", "read_article", "choose"].contains(section.type)) {
        for (final (i, group) in section.questionGroup!.indexed) {
          final qid = group.id;

          ItestExamQuestionsQuestionGroupItem newGroup = group;

          if (group.audios != null) {
            final audioToTextResult = <ItestExamQuestionsAudio>[];
            for (final audio in group.audios!) {
              audioToTextResult.add(await audioToText(audio));
            }

            newGroup = group.copyWith(
              audios: audioToTextResult,
              questions:
                  group.questions.indexed.map((e) {
                    ItestExamQuestionsAudio? audio;
                    if (audioToTextResult.length > 1) {
                      audio = audioToTextResult[e.$1 + 1];
                    }
                    return e.$2.copyWith(audios: audio);
                  }).toList(),
            );
          }

          final indexList = group.questions.map((e) => e.index).toList();
          final d = await getChooseAnswer(indexList, newGroup);

          final qd = answers.firstWhere((a) => a['q'] == qid)['d'];

          List<int>? audioSleep;
          try {
            audioSleep =
                newGroup.audios
                    ?.map((e) => e.seconds ?? 30)
                    .toList();
          } catch (e) {
            logger?.call(e);
          }

          if (!newGroup.article.isEmptyOrNull) {
            final readTime = notSleep ? 0 : Random().nextIntInRange(120, 180);
            logger?.call("正在阅读文章：$readTime s");
            await Future.delayed(Duration(seconds: readTime));
          }

          for (final (i, index) in indexList.indexed) {
            var readTime = audioSleep?.getOrNull(i);
            if (readTime != null) {
              readTime += Random().nextIntInRange(5, 10);
              logger?.call("正在等待音频时长：$readTime s");
              await Future.delayed(Duration(seconds: notSleep ? 0 : readTime));
            }
            progressCallback?.call(index);
            qd[i] = d[i];

            final sleepTime =
                readTime != null
                    ? Random().nextIntInRange(2, 5)
                    : Random().nextIntInRange(10, 20);
            await sleepRandomSecond(
              index,
              confirmExamData,
              notSleep ? 0 : sleepTime,
            );
          }
        }
      } else if (section.type == "article_fill_blank") {
        var q = section.question!;

        if (q.audios != null){
          final audios = <ItestExamQuestionsAudio>[];
          for (final audio in q.audios!) {
            audios.add(await audioToText(audio));
          }
          q = q.copyWith(audios: audios);
        }

        List<int>? audioSleep;
        try {
          audioSleep =
              q.audios
                  ?.map((e) => e.seconds ?? 30)
                  .toList();
        } catch (e) {
          logger?.call(e);
        }

        final indexList =
            q.content
                .where((e) => e.type == "input")
                .map((e) => e.index!)
                .toList();
        final qid =
            q.content.firstWhere((e) => e.type == "input").qid;
        final d = await getArticleFillBlankAnswer(indexList, q);

        final qd = answers.firstWhere((a) => a['q'] == qid)['d'];

        final readTime = notSleep ? 0 : Random().nextIntInRange(30, 60);
        logger?.call("正在阅读短文填空文章：$readTime s");
        await Future.delayed(Duration(seconds: readTime));

        if(audioSleep != null) {
          for (var readTime in audioSleep) {
              readTime += Random().nextIntInRange(1, 3);
              logger?.call("正在等待复合式听写音频时长：$readTime s");
              await Future.delayed(Duration(seconds: notSleep ? 0 : readTime));
          }
        }

        for (final (i, index) in indexList.indexed) {
          progressCallback?.call(index);
          qd[i] = d[i];
          final sleepTime = notSleep ? 0 : Random().nextIntInRange(10, 20);
          await sleepRandomSecond(index, confirmExamData, sleepTime);
        }
      } else if (section.type == "write") {
        final q = section.writeQuestion!;
        final index = q.index;
        progressCallback?.call(index);
        final d = await getWritingAnswer(index, q);
        final qd = answers.firstWhere((a) => a['q'].toString() == q.id.toString())['d'];

        final codeUnits = d.codeUnits;
        for (final (i, char) in codeUnits.indexed) {
          writingProgressCallback?.call(i + 1, codeUnits.length);
          qd[0][0] += String.fromCharCode(char);

          final isChinese = char >= 0x4E00 && char <= 0x9FFF;

          final sleepTime =
              isChinese
                  ? Random().nextIntInRange(300, 600) // 汉字延迟 300~600ms
                  : Random().nextIntInRange(100, 200); // 字母延迟 100~200ms

          await Future.delayed(
            Duration(milliseconds: notSleep ? 0 : sleepTime),
          );
        }

        final sleepTime = Random().nextIntInRange(5, 10);
        await sleepRandomSecond(
          index,
          confirmExamData,
          notSleep ? 0 : sleepTime,
        );
      }
    }

    final usageTime = watch.elapsed.inSeconds;
    final data = {"al": answers, "sl": sectionList, "ut": usageTime};
    await logFunction?.call(
      confirmExamData: confirmExamData,
      action: ExamLoggerAction.ansSnapSubmit,
      answers: data,
    );
    timer.cancel();
    return data;
  }

  /// uik: ItestExamQuestionsWrapData.uIK
  Future<ItestExamSubmitResponse> submitFinal({
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
      final resp1 = await submit(
        answers: answers,
        confirmExamData: confirmExamData,
        uik: uik,
        action: ExamSubmitAction.cache,
      );
    } catch (e) {
      print(e);
    }
    final resp2 = await submit(
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

  Future<ItestExamSubmitResponse> submit({
    required Map<String, dynamic> answers,
    required ItestConfirmExamData? confirmExamData,
    required String? uik,
    required String action,
  }) async {
    final url = "itest-api/itest/s/answer/submit";
    final t = Random().nextDouble();
    final clearUik = action == "save";
    final exitFlag = action == "save" ? "1" : "";

    final form = {
      "ansData": jsonEncode(answers),
      "act": action,
      "sppid": confirmExamData!.sppid,
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
    required ItestConfirmExamData? confirmExamData,
    required String action,
    Map<String, dynamic>? answers,
  }) async {
    try {
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

      final dataType = confirmExamData!.dataType.toIntOrNull();
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

      if (form['action'] != ExamLoggerAction.ansSnapSubmit) {
        final body = Map.from(form)..['msg'] = "";
        print("sent log: $body");
      }

      final response = await dio.post(url, data: [form]);
      final data = response.data;
      return data;
    } catch (e) {
      print(e);
    }
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
    final data = parseConfirmExamData(response.data!);
    return data;
  }

  Future<Map<String, dynamic>> loadExam() async {
    final url = 'itest-api/itest/s/answer/load?t=0.016521961806345242';
    final response = await dio.get(url);
    final data = response.data;
    return data;
  }

  @override
  bool get loginUrlWithSchoolId => true;
}

// 定义函数类型
typedef ExamLogFunction =
    Future<dynamic> Function({
      required ItestConfirmExamData? confirmExamData,
      required String action,
      Map<String, dynamic>? answers,
    });

typedef ExamSubmitFunction =
    Future<ItestExamSubmitResponse> Function({
      required Map<String, dynamic> answers,
      required ItestConfirmExamData? confirmExamData,
      required String? uik,
      required String action,
    });

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
