import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:example/utils/input.dart';
import 'package:fuck_unipus/fuck_unipus.dart';
import 'package:openai_dart_dio/openai_dart_dio.dart';

void main() async {
  final cookieDir = "./cookies";
  final username = inputTrim("请输入用户名：");
  print("如需输入上次浏览器 openid 请修改 example/bin/example.dart");
  String? openId = '';
  itestMain(cookieDir: cookieDir, username: username, loggerOpenId: openId);
  // unipusMain(cookieDir: cookieDir, username: username);
}

Future<void> itestMain({
  required String cookieDir,
  required String username,
  String? loggerOpenId,
}) async {
  final itest = await Itest.newInstance(
    cookieDir: cookieDir,
    cookieSubDir: username,
    loggerOpenId: loggerOpenId,
  );
  final isLogin = await itest.checkLoginAndSetupSession();
  if (!isLogin) {
    final password = inputTrim("请输入密码：");
    await itest.login(
      username: username,
      password: password,
      service: Unipus.unipusService,
      captchaHandler: (captchaResponse) async {
        throw "";
      },
    );
  } else {
    print("已登录：");
  }

  final examList = await itest.getExamList();
  for (final exam in examList.rs.data) {
    print(exam.ksName);
    print("ksd id: ${exam.ksdId}");
    print(exam.examEnrollInfo);
    print(exam.restrictBeginTimeStr);
    print(exam.restrictEndTimeStr);
    print(exam.canViewKaojuanJudgeBean.scoreReason);
    print(exam.ksText);
    print("-" * 150);
  }

  final examId = inputTrim("请输入 ksdId: ");
  final judgeEntry = await itest.judgeEntry(examId: examId);
  print(judgeEntry.msg);
  inputTrim("回车进入考试？");
  final confirmExam = await itest.confirmExam(token: judgeEntry.data.token);
  print(confirmExam);
  inputTrim("请确认考试信息，回车确认");
  final examInfo = await itest.examInfo(token: judgeEntry.data.token);
  print("examInfo：$examInfo");
  final examPaperResourceInfo = await itest.examPaperResourceInfo(
    token: judgeEntry.data.token,
  );
  print("examPaperResourceInfo：$examPaperResourceInfo");
  final examWait = await itest.examWait(token: judgeEntry.data.token);
  print("examWait：$examWait");

  await itest.getAnswerSheets(token: judgeEntry.data.token);

  final (questionsWarp, sections!) = await itest.getExamQuestions(
    confirmExamData: confirmExam,
  );
  print("questionsWarp：$questionsWarp");
  print("questions：$sections");

  final key = inputTrim("请输入 openai api key: ");
  var baseurl = inputTrim("请输入 openai api base url，如果是官方可直接回车: ");
  if (baseurl.isEmpty) baseurl = OpenAiClient.defaultBaseUrl;

  final dio = Dio();
  dio.options = BaseOptions(validateStatus: (s) => s != null);
  // (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
  //   final client = HttpClient();
  //   client.findProxy = (uri) {
  //     return "PROXY 127.0.0.1:9000";
  //   };
  //   client.badCertificateCallback =
  //       (X509Certificate cert, String host, int port) => true;
  //   return client;
  // };

  final openai = OpenAiClient(apiKey: key, baseUrl: baseurl, dio: dio);
  await testOpenai(openai);

  final answers = await itest.buildAnswer(
    uik: questionsWarp.data.uIK.toString(),
    confirmExamData: confirmExam,
    sections: sections,
    getChooseAnswer: (
      List<int> indexList,
      ItestExamQuestionsQuestionGroupItem question,
    ) async {
      return await getChooseAnswer(openai, question);
    },
    getChoose10From15Answer: (
      List<int> indexList,
      ItestExamQuestionsChoose10From15Question question,
    ) async {
      return await getChoose10From15Answer(openai, question);
    },
    getWritingAnswer: (int index, ItestExamQuestionsWriteQuestion question) {},
    audioToText: (String url) {},
  );

  print("answers：$answers");
  final submitResult = await itest.submit(
    answers: answers,
    confirmExamData: confirmExam,
    uik: questionsWarp.data.uIK.toString(),
  );

  print("submitResult：$submitResult");
}

Future<void> testOpenai(OpenAiClient openai) async {
  final resp = await openai.chatCompletionApi.createChatCompletion(
    ChatCompletionRequest(
      messages: [
        ChatMessage(role: ChatMessageRole.user, content: "这是题目：$testQ，请给出答案"),
      ],
      model: "gpt-4o",
      responseFormat: ResponseFormat(
        type: ResponseFormatType.jsonSchema,
        jsonSchema: {
          "name": "answers",
          "description": "answers",
          "schema": {
            "type": "object",
            "properties": {
              "answers_list": {
                "type": "array",
                "description":
                    "Answer array. When single-choice, the array length is 1 and the type is int. When multiple-choice, the array length can be > 1",
                "items": {"type": "integer"},
              },
            },
            "required": ["answers_list"],
          },
        },
      ),
    ),
  );
  final answer =
      jsonDecode(resp.choices.first.message.content!)['answers_list'];
  print(answer);
}

Future<List<List<String>>> getChoose10From15Answer(
  OpenAiClient openai,
  ItestExamQuestionsChoose10From15Question question,
) async {
  for (var i = 0; i < 5; i++) {
    try {
      final resp = await openai.chatCompletionApi.createChatCompletion(
        ChatCompletionRequest(
          messages: [
            ChatMessage(
              role: ChatMessageRole.user,
              content: "这是题目：${jsonEncode(question.toJson())}，请给出答案",
            ),
          ],
          model: "gpt-4o",
          responseFormat: ResponseFormat(
            type: ResponseFormatType.jsonSchema,
            jsonSchema: {
              "name": "answers",
              "description": "answers",
              "schema": {
                "type": "object",
                "properties": {
                  "answers_list": {
                    "type": "array",
                    "description":
                        "Answer array. If the length of choose_10_from_15_question.content[type=\"input\"] is 3, an example answer would be: [[\"C\"], [[\"B\"], [[\"A\"]]. ",
                    "items": {
                      "type": "array",
                      "description":
                          "Answer(s) for a single question. one options.option, example [\"C\"], The length is always 1",
                      "items": {
                        "type": "string",
                        "description":
                            "`option` of the selected option for the choose_10_from_15_question.content[type=\"input\"], example: \"C\".",
                      },
                    },
                  },
                },
                "required": ["answers_list"],
              },
            },
          ),
        ),
      );
      final rawList =
          jsonDecode(resp.choices.first.message.content!)['answers_list']
              as List;
      final List<List<String>> answer =
          rawList
              .map<List<String>>(
                (item) =>
                    (item as List).map<String>((e) => e as String).toList(),
              )
              .toList();

      return answer;
    } catch (e) {
      print(e);
    }
  }
  throw Exception("答案获取失败");
}

Future<List<List<int>>> getChooseAnswer(
  OpenAiClient openai,
  ItestExamQuestionsQuestionGroupItem question,
) async {
  for (var i = 0; i < 5; i++) {
    try {
      final resp = await openai.chatCompletionApi.createChatCompletion(
        ChatCompletionRequest(
          messages: [
            ChatMessage(
              role: ChatMessageRole.user,
              content: "这是题目：${jsonEncode(question.toJson())}，请给出答案",
            ),
          ],
          model: "gpt-4o",
          responseFormat: ResponseFormat(
            type: ResponseFormatType.jsonSchema,
            jsonSchema: {
              "name": "answers",
              "description": "answers",
              "schema": {
                "type": "object",
                "properties": {
                  "answers_list": {
                    "type": "array",
                    "description":
                        "Answer array. If the length of questions is 3, an example answer would be: [[0], [1], [3]]. Each inner array represents the answer(s) to a specific question, in order. For single-choice questions, the inner array should contain exactly one integer. For multiple-choice questions, it may contain multiple integers.",
                    "items": {
                      "type": "array",
                      "description":
                          "Answer(s) for a single question. For single-choice, contains one integer; for multiple-choice, contains multiple integers.",
                      "items": {
                        "type": "integer",
                        "description":
                            "`value` of the selected option for the question",
                      },
                    },
                  },
                },
                "required": ["answers_list"],
              },
            },
          ),
        ),
      );
      final rawList =
          jsonDecode(resp.choices.first.message.content!)['answers_list']
              as List;
      final List<List<int>> answer =
          rawList
              .map<List<int>>(
                (item) => (item as List).map<int>((e) => e as int).toList(),
              )
              .toList();

      return answer;
    } catch (e) {
      print(e);
    }
  }
  throw Exception("答案获取失败");
}

Future<void> unipusMain({
  required String cookieDir,
  required String username,
}) async {
  final unipus = await Unipus.newInstance(
    cookieDir: cookieDir,
    cookieSubDir: username,
  );
  final isLogin = await unipus.checkLoginAndSetupSession();
  if (!isLogin) {
    final password = inputTrim("请输入密码：");
    await unipus.login(
      username: username,
      password: password,
      captchaHandler: (captchaResponse) async {
        throw "";
      },
    );
  } else {
    print("已登录：${unipus.sessionInfo!.name}");
  }

  final courses = await unipus.getCourses();
  print("📚 课程信息如下：");
  for (final class_ in courses) {
    print("\n============================================================");
    print("🔹 班级名称: ${class_.className}");
    print("📆 时间范围: ${class_.dateRange}");
    for (final course in class_.courses) {
      print("  ─────────────────────────────────────────────");
      print("  📖 课程名称: ${course.courseName}");
      print("  🔗 状态: ${course.status}");
      print("  🆔 tutorial_id: ${course.tutorialId}");
      print("  🌐 链接: ${course.courseUrl}");
    }
    print("============================================================\n");
  }

  final tutorialId = inputTrim("请输入 tutorial_id：");

  if (tutorialId.isEmpty) {
    print('Invalid tutorial_id');
    return;
  }

  // 获取课程进度
  var courseProgress = await unipus.getCourseProgress(tutorialId);

  // 获取课程单元
  var courseProgressUnits =
      courseProgress['rt']['units'] as Map<String, dynamic>;

  // 处理单元中的节点
  Map<String, dynamic> leafs = {};
  for (var unit in courseProgressUnits.keys) {
    var unitProgress = await unipus.getCourseProgressLeaf(tutorialId, unit);
    var leafsData = unitProgress['rt']['leafs'] as Map<String, dynamic>;

    leafs.addAll(leafsData);
  }

  // 获取课程详情
  final (_, courseDetail) = await unipus.getCourseDetail(tutorialId);
  var units =
      List.from(
        courseDetail['units'],
      ).map((e) => e as Map<String, dynamic>).toList();

  // 遍历课程单元
  await traversalCoursesToFs(
    units,
    [],
    unipus,
    tutorialId,
    leafs,
    '',
    Directory('courses'),
  );

  // // 输入节点 id
  // stdout.write("请输入节点 id: ");
  // String? leaf = stdin.readLineSync();
  //
  // if (leaf == null || leaf.isEmpty) {
  //   print('Invalid leaf id');
  //   return;
  // }
  //
  // // 获取节点内容
  // final leafContent = await unipus.getCourseLeafContent(tutorialId, leaf);
  // print("节点内容：$leafContent");
}

Future<void> traversalCoursesToFs(
  List<Map<String, dynamic>> units,
  List<int> prefix,
  Unipus unipus,
  String tutorialId,
  Map<String, dynamic> leafsProgress,
  String treePrefix,
  Directory rootDir,
) async {
  await rootDir.create(recursive: true);
  await traversalCoursesInner(
    units,
    prefix,
    unipus,
    tutorialId,
    leafsProgress,
    treePrefix,
    rootDir,
  );
}

Future<void> traversalCoursesInner(
  List<Map<String, dynamic>> units,
  List<int> prefix,
  Unipus unipus,
  String tutorialId,
  Map<String, dynamic> leafsProgress,
  String treePrefix,
  Directory currentPath,
) async {
  for (var i = 0; i < units.length; i++) {
    final unit = units[i];
    final isLast = i + 1 == units.length;
    final currentPrefix = List<int>.from(prefix)..add(i + 1);

    final name = unit['name'] ?? '<Unnamed>';
    final url = unit['url'] ?? '';

    String statusStr = "";

    bool required = false;
    bool pass = false;
    if (leafsProgress.containsKey(url)) {
      final leaf = leafsProgress[url];
      pass = (leaf['state']?['pass'] ?? 0) != 0;
      required = leaf['strategies']?['required'] ?? false;
      statusStr =
          pass
              ? "✅"
              : required
              ? "Fucking... 🕓"
              : "🚫";
    }

    final branch = isLast ? "└── " : "├── ";
    print("$treePrefix$branch$name $statusStr");

    final dirName = "${i + 1}.${sanitizeFilename(name)}";
    final thisPath = Directory('${currentPath.path}/$dirName');
    await thisPath.create();

    if (required) {
      await processCourseLeaf(
        unipus,
        tutorialId,
        url,
        thisPath,
        treePrefix,
        branch,
      );
    }

    if (unit.containsKey('children')) {
      final children = List<Map<String, dynamic>>.from(unit['children']);
      final newPrefix = isLast ? "$treePrefix    " : "$treePrefix│   ";
      await traversalCoursesInner(
        children,
        currentPrefix,
        unipus,
        tutorialId,
        leafsProgress,
        newPrefix,
        thisPath,
      );
    }
  }

  if (prefix.isEmpty) {
    print("遍历完成");
  }
}

Future<void> processCourseLeaf(
  Unipus unipus,
  String tutorialId,
  String url,
  Directory thisPath,
  String treePrefix,
  String branch,
) async {
  try {
    final content = await unipus.getCourseLeafContent(tutorialId, url);
    final summary = await unipus.getCourseSummary(tutorialId, url);
    final questions = await unipus.getCourseLeafQuestions(tutorialId, url);

    final contentPretty = JsonEncoder.withIndent('  ').convert(content);
    final questionsPretty = JsonEncoder.withIndent('  ').convert(questions);
    final summaryPretty = JsonEncoder.withIndent('  ').convert(summary);

    final paths = [
      ('content.json5', contentPretty),
      ('questions.json5', questionsPretty),
      ('summary.json5', summaryPretty),
    ];

    for (var path in paths) {
      final filePath = File('${thisPath.path}/${path.$1}');
      print("$treePrefix$branch Fulfilling ${path.$1} ... ${filePath.path}");
      await filePath.writeAsString(path.$2);
    }
  } catch (e) {
    print("Error processing leaf [$url]: $e");
  }
}

String sanitizeFilename(String name) {
  return name
      .replaceAll(RegExp(r'[^a-zA-Z0-9-_ ]'), '_') // 替换非法字符为下划线
      .trim() // 去除前后的空格
      .replaceAll(' ', '_'); // 替换空格为下划线
}

final testQ = """    {
      "id": "1000000",
      "index": 48,
      "content": "48.  The dish consists of 8 kinds of vegetables, mixed with hot chili ______ and served with beef soup.",
      "options": [
        {
          "type": "radio",
          "value": 3,
          "text": "A. decency",
          "sub_index": 1,
          "sub_sub_index": 1
        },
        {
          "type": "radio",
          "value": 1,
          "text": "B. nationality",
          "sub_index": 1,
          "sub_sub_index": 1
        },
        {
          "type": "radio",
          "value": 2,
          "text": "C. paste",
          "sub_index": 1,
          "sub_sub_index": 1
        },
        {
          "type": "radio",
          "value": 0,
          "text": "D. abundance",
          "sub_index": 1,
          "sub_sub_index": 1
        }
      ],
      "options_order": [
        3,
        1,
        2,
        0
      ]
    }""";
