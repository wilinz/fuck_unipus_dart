import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:fuck_unipus/src/model/unipus/user_info/user_info.dart';
import 'package:fuck_unipus/fuck_unipus.dart';
import 'package:fuck_unipus/src/core/study_duration_tracker.dart';
import 'package:html/parser.dart';

import 'html_parser/unipus_class_block_parse.dart';

class Unipus extends BaseClient {
  static const String unipusService = "https://u.unipus.cn/user/comm/login?school_id=";
  UnipusSessionInfo? sessionInfo;
  StudyDurationTracker? studyDurationTracker;

  static Future<Unipus> newInstance({
    required CookieJar cookieJar,
    String? userAgent,
  }) async {
    final unipus = Unipus._();
    await unipus._init(cookieJar: cookieJar, userAgent: userAgent);
    return unipus;
  }

  Unipus._();

  Future<void> _init({required CookieJar cookieJar, String? userAgent}) async {
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

  Future<UserInfo> getUserInfo({required String openId}) async {
    final random = Random();
    final callback =
        'jsonp_${DateTime.timestamp().millisecondsSinceEpoch}_${10000 + random.nextInt(90000)}';

    final response = await dio.get(
      'https://ucamapi.unipus.cn/rpc/api/user-info',
      queryParameters: {'openId': openId, 'source': 0, 'callback': callback},
    );

    return UserInfo.fromJson(response.data);
  }

  Future<List<UnipusClassBlock>> getCourses() async {
    final response = await dio.get('/user/student');
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

  Future<Map<String, dynamic>> submitAnswer({
    required String tutorialId,
    required String leaf,
    required Map<String, dynamic> answer,
  }) async {
    final response = await dio.post(
      'https://ucontent.unipus.cn/course/api/v3/submit/$tutorialId/$leaf/',
      data: answer,
      options: Options(responseType: ResponseType.plain),
    );

    return jsonDecode(response.data);
  }

  /// 进入单元测试
  ///
  /// 参数:
  /// - [exerciseId]: 练习ID
  /// - [tutorialId]: 课程ID (例如: "course-v1:Unipus+nhce_3_vls_2+2018_03")
  /// - [leaf]: 单元标识符 (例如: "u3g199")
  /// - [exerciseType]: 练习类型 (默认: 3)
  /// - [forwardUrl]: 转发URL (默认: "//ucontent.unipus.cn/_pc_default/UTCallback.html")
  /// - [ntc]: ntc(need_two_confirmation)参数 (默认: 1)
  /// - [nad]: nad(need_all_done)参数 (默认: 1)
  /// - [sms]: sms(show_modal_stratege)参数 (默认: 1)
  /// - [lcs]: lcs参数 (默认: 1)
  /// - [schema]: schema(strategy_schema)参数 (默认: 0)
  /// - [plf]: plf参数 (默认: 0)，平台类型标识：判断是否为UTalk平台环境，"&plf=" + (t.env.IS_UTALK ? 1 : 0)
  /// - [sf]: sf参数 (默认: 1)，开始时间校验标识：检查课程是否已到开放时间，"&sf=" + n.checkStartTime()
  /// - [sign]: 签名
  Future<(Response, String)> enterUnitTest({
    required String exerciseId,
    required String tutorialId,
    required String leaf,
    Map<String, dynamic>? courseProgressResult,
    String forwardUrl = '//ucontent.unipus.cn/_pc_default/UTCallback.html',
    int exerciseType = 3,
    int plf = 0,
    int sf = 1,
  }) async {
    final openId = sessionInfo?.openid;
    if (openId == null) {
      throw Exception('Session openid is not available');
    }

    int ntc = courseProgressResult?['ntc'] ?? 1;
    int nad = courseProgressResult?['nad'] ?? 1;
    int sms = courseProgressResult?['sms'] ?? 1;
    int lcs = courseProgressResult?['lcs'] ?? 1;
    int schema = courseProgressResult?['strategy_schema'] ?? 1;

    // 构建 callbackUrl
    final callbackUrl =
        'http://ucontent.unipus.cn/course/api/utscore/$tutorialId/$leaf/default/';

    String sign =
        md5.convert(utf8.encode("$openId#$exerciseId#3#16fltrp!")).toString();

    // 构建查询参数
    final queryParameters = <String, dynamic>{
      'exerciseId': exerciseId,
      'forwardUrl': forwardUrl,
      'openId': openId,
      'callbackUrl': callbackUrl,
      'ntc': ntc,
      'nad': nad,
      'sms': sms,
      'lcs': lcs,
      'schema': schema,
      'plf': plf,
      'sf': sf,
      'sign': sign,
      'exerciseType': exerciseType,
      'alertFlag': 0, // 禁止弹窗确认是否从客户端切换过来
    };

    try {
      final response = await dio.get(
        'https://uexercise.unipus.cn/uexercise/api/v2/enter_unit_test',
        queryParameters: queryParameters,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => status! < 400,
        ),
      );

      // return response;
      // 从HTML响应中提取sppid
      final html = response.data as String;
      final sppidRegex = RegExp(r'<input\s+id="sppid"[^>]*value="(\d+)"');
      final match = sppidRegex.firstMatch(html);

      if (match != null && match.groupCount >= 1) {
        return (response, match.group(1)!);
      }

      throw Exception('Failed to extract sppid from response');
    } catch (e) {
      throw Exception('Failed to enter unit test: $e');
    }
  }

  /// 加载单元测试数据
  ///
  /// 参数:
  /// - [dataId]: 数据ID，通常是从 enterUnitTest 返回的 sppid
  ///
  /// 返回:
  /// - 单元测试的题目数据
  Future<(ItestExamQuestionsWrapResponse, List<ItestExamQuestions>?)> loadUT({
    required String dataId,
  }) async {
    try {
      final response = await dio.post(
        'https://uexercise.unipus.cn/itest/s/clsanswer/loadUT',
        data: {'dataid': dataId},
        options: Options(
          contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
          responseType: ResponseType.plain
        ),
      );

      final data = ItestExamQuestionsWrapResponse.fromJson(
        jsonDecode(response.data),
      );
      final questions = itestExamQuestionsListFormJson(
        parseExamQuestionsMap(data.data.cHTML),
      );
      return (data, questions);
    } catch (e) {
      throw Exception('Failed to load unit test: $e');
    }
  }

  /// 提交单元测试答案
  ///
  /// 参数:
  /// - [ansData]: 答案数据，包含答案列表(al)、section列表(sl)和使用时间(ut)
  /// - [sppid]: 从 enterUnitTest 或 loadUT 返回的 sppid
  /// - [exerciseId]: 练习ID
  /// - [action]: 提交动作类型，'cache' 表示缓存，'save' 表示保存 (默认: 'cache')
  /// - [plf]: 平台标识 (默认: 0)
  /// - [answerNumber]: 答案数量 (默认: 0)
  ///
  /// 返回:
  /// - 提交结果
  Future<ItestExamSubmitResponse> submitUT({
    required Map<String, dynamic> ansData,
    required String sppid,
    required String exerciseId,
    required String action,
    int plf = 0,
  }) async {
    int answerNumber = 0;
    // final answerList = (ansData['al'] as List).map((e)=>e as Map<String, dynamic>).toList();
    final List<Map<String, dynamic>> answerList = ansData['al'];

    for (final item in answerList) {
      final dItem = item['d'] as List<List>;
      for (final d in dItem) {
        if (d.isNotEmpty && d.any((option) => option != "")) {
          answerNumber++;
        }
      }
    }

    parse("answerNumber: $answerNumber");

    try {
      // 获取当前时间
      final now = DateTime.now();
      final nowString =
          '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} '
          '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

      // 生成随机时间戳
      final t = Random().nextDouble();

      final formData = {
        'ansData': jsonEncode(ansData),
        'act': action,
        'sppid': sppid,
        'plf': plf,
        'exerciseId': exerciseId,
        'now': nowString,
        'answerNumber': answerNumber,
        '__t': t,
      };

      print(formData);

      final response = await dio.post(
        'https://uexercise.unipus.cn/itest/s/clsanswer/submitUT',
        data: formData,
        options: Options(
          contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
          headers: {
            'X-Requested-With': 'XMLHttpRequest',
            'Accept': 'application/json, text/javascript, */*; q=0.01',
          },
        ),
      );

      return ItestExamSubmitResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to submit unit test: $e');
    }
  }

  /// 最终提交单元测试答案
  ///
  /// 此方法会先尝试缓存提交，然后进行正式保存提交
  ///
  /// 参数:
  /// - [ansData]: 答案数据，包含答案列表(al)、section列表(sl)和使用时间(ut)
  /// - [sppid]: 从 enterUnitTest 或 loadUT 返回的 sppid
  /// - [exerciseId]: 练习ID
  /// - [plf]: 平台标识 (默认: 0)
  ///
  /// 返回:
  /// - 最终保存的提交结果
  Future<ItestExamSubmitResponse> submitFinalUT({
    required Map<String, dynamic> ansData,
    required String sppid,
    required String exerciseId,
    int plf = 0,
  }) async {
    try {
      // 先尝试缓存提交
      await submitUT(
        ansData: ansData,
        sppid: sppid,
        exerciseId: exerciseId,
        action: 'cache',
        plf: plf,
      );
    } catch (e) {
      print(e);
    }

    // 正式保存提交
    final resp = await submitUT(
      ansData: ansData,
      sppid: sppid,
      exerciseId: exerciseId,
      action: 'save',
      plf: plf,
    );

    return resp;
  }

  static Map<String, dynamic> genAnswerBySummary(Map<String, dynamic> summary) {
    // 从输入中提取 summary 数据
    final summaryData = summary['summary'] as Map<String, dynamic>;
    final questionsList = summaryData['questionsList'] as List<dynamic>;

    // 构造 answers 对象
    final answers = <String, dynamic>{};

    for (int i = 0; i < questionsList.length; i++) {
      answers[i.toString()] = {
        // 'student_answer': null,
        'isDone': true,
        'version': 'v2',
        // 'rule': null,
        // 'user_answer': null,
        'score': 1,
      };
    }

    // 构造 specific_scores 数组
    final specificScores = List<dynamic>.filled(questionsList.length, null);

    // 构造输出对象
    return {
      'enable_mistake': false,
      'version': 'default',
      'record_version': '1761423350',
      'state': '',
      'specific_scores': specificScores,
      'answers': answers,
    };
  }

  // @visibleForTesting
  // static Map<String, dynamic> buildStateFromSummary({
  //   required Map<String, dynamic> summary,
  //   required String studentAnswer,
  //   double? score,
  // }) {
  //   final rawSummary = summary['summary'] as Map<String, dynamic>? ?? {};
  //   final indexMap = rawSummary['indexMap'] as Map<String, dynamic>? ?? {};
  //   final version = rawSummary['version']?.toString() ?? 'default';
  //
  //   final state = <String, dynamic>{'version': version};
  //
  //   indexMap.forEach((pageKey, pageNodes) {
  //     if (pageNodes is Map) {
  //       final pageState = <String, dynamic>{};
  //       pageNodes.forEach((componentKey, componentValue) {
  //         if (componentValue is Map) {
  //           final offset = 0;
  //           final mappedKey = '${componentKey}_$offset';
  //           pageState[mappedKey] = {
  //             'student_answers': {
  //               '0': studentAnswer,
  //             },
  //           };
  //         }
  //       });
  //       if (pageState.isNotEmpty) {
  //         state[pageKey] = pageState;
  //       }
  //     }
  //   });
  //
  //   state['__EXTEND_DATA__'] = {
  //     '__SUMMARY__': {
  //       'answerList': {
  //         '0': {
  //           'student_answer': studentAnswer,
  //           'isDone': true,
  //           'version': 'v2',
  //           'isRight': true,
  //           'score': score ?? 0,
  //           'signature': '',
  //           'rule': 'subjective',
  //           'pct': 1,
  //         },
  //       },
  //     },
  //   };
  //
  //   return state;
  // }
  //
  // @visibleForTesting
  // static Map<String, dynamic> buildAnswersFromState(Map<String, dynamic> state) {
  //   final extend = state['__EXTEND_DATA__'] as Map<String, dynamic>?;
  //   final summary = extend?['__SUMMARY__'] as Map<String, dynamic>?;
  //   final answerList = summary?['answerList'] as Map<String, dynamic>? ?? {};
  //   return answerList.map((key, value) => MapEntry(key, value));
  // }

  // purecontent
  Future<String> postProgress({
    required String tutorialId,
    required String leaf,
    String version = 'default',
  }) async {
    final payload = {
      'status': 1,
      'rid': 'flowengine:studyStatus:1:$leaf',
      'groupId': leaf,
      'version': version,
    };
    final response = await dio.post(
      'https://ucontent.unipus.cn/api/mobile/user_group/$tutorialId/$leaf/progress/',
      data: payload,
      options: Options(responseType: ResponseType.plain),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getCourseLeafQuestions(
    String tutorialId,
    String leaf,
  ) async {
    final url =
        'https://ucontent.unipus.cn/course/api/pc/group/$tutorialId/$leaf/default/';

    dynamic data;
    try {
      final response = await dio.get(url);
      data = response.data;

      // 获取 "group" 字段，如果存在则返回解析后的数据
      if (data['group'] != null) {
        return jsonDecode(data['group']);
      }

      return data;
    } catch (e) {
      print(data);
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

    // final client = _extractJsVariable(html, 'client');
    return UnipusSessionInfo(
      name: name,
      token: _extractJsVariable(html, 'token'),
      openid: _extractJsVariable(html, 'openId'),
      websocketUrl: _extractJsVariable(
        html,
        'wsURL',
      ), // wsURL:"https://ucontent.unipus.cn",
    );
  }

  String _extractJsVariable(String html, String variable) {
    final regex = RegExp('$variable:.*?"(.+?)"');
    return regex.firstMatch(html)?.group(1) ?? '';
  }

  /// 连接到学习时长追踪 WebSocket
  ///
  /// 参数:
  /// - [leaf]: 模块标识符 (例如: "u1g2")
  /// - [tutorialId]: 模块组标识符 (例如: "course-v1:Unipus+nhce_3_rw_2+2018_09")
  /// - [url]: 当前学习页面的 URL (会自动从中提取 tag1 和 tag2)
  /// - [client]: 客户端标识符 (默认: "U校园pc")
  /// - [onMessage]: 接收消息时的回调函数
  /// - [onError]: 发生错误时的回调函数
  /// - [onDone]: 连接关闭时的回调函数
  Future<StudyDurationTracker> connectStudyDurationTracker({
    required String leaf,
    required String tutorialId,
    required String pageUrl,
    String client = "U校园pc",
    void Function(String message)? onMessage,
    void Function(dynamic error)? onError,
    void Function()? onDone,
  }) async {
    if (sessionInfo == null) {
      throw Exception('Session info is not available. Please login first.');
    }

    // 获取 User-Agent
    final userAgent = dio.options.headers['User-Agent'] as String?;

    // 获取 Cookie
    var wsUri = Uri.parse('wss://ucontent.unipus.cn/unipusio/');

    Map<String, dynamic>? queryParameters = Map.of(wsUri.queryParameters);
    queryParameters['uuid'] = sessionInfo!.openid;
    queryParameters['token'] = sessionInfo!.token;
    queryParameters['transport'] = 'websocket';
    queryParameters['EIO'] = '3';

    wsUri = wsUri.replace(scheme: "wss", queryParameters: queryParameters);

    final cookies = await cookieJar.loadForRequest(wsUri);
    final cookieHeader = cookies.map((c) => '${c.name}=${c.value}').join('; ');

    final tracker = StudyDurationTracker(
      websocketUrl: wsUri.toString(),
      leaf: leaf,
      tutorialId: tutorialId,
      url: pageUrl,
      userAgent: userAgent,
      cookie: cookieHeader,
      onMessage: onMessage,
      onError: onError,
      onDone: onDone,
      enableLogging: true,
    );

    studyDurationTracker = tracker;

    await tracker.connect();
    return tracker;
  }

  static String buildStudyPageUrl({
    // required String classId,
    // required String schoolId,
    required String tutorialId,
    required String leafPath,
  }) {
    final url =
        // "https://ucontent.unipus.cn/_pc_default/pc.html?cid=$classId&appid=5&schId=$schoolId#/$tutorialId/courseware$leafPath/__main";
        "https://ucontent.unipus.cn/_pc_default/pc.html#/$tutorialId/courseware$leafPath/p_1";
    return url;
  }

  @override
  bool get loginUrlWithSchoolId => false;

}
