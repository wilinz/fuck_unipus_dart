import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:example/utils/input.dart';
import 'package:example/utils/random.dart';
import 'package:fuck_unipus/fuck_unipus.dart';
import 'package:openai_dart_dio/openai_dart_dio.dart';
import 'package:path/path.dart';

void main() async {
  final cookieDir = "./cookies";
  final username = inputTrim("请输入用户名：");
  print("如需输入上次浏览器 openid 请修改 example/bin/example.dart");

  // String? ua = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36';

  String openId;
  final openIdStorageFile = File("./openid-$username.txt");
  final openIdStorageFileExists = await openIdStorageFile.exists();

  final openIdStorage =
      openIdStorageFileExists
          ? (await openIdStorageFile.readAsString()).trim()
          : "";
  if (openIdStorage.length == 32) {
    openId = openIdStorage;
  } else {
    openId = generateRandomMd5();
    if (!openIdStorageFileExists) openIdStorageFile.create(recursive: true);
    await openIdStorageFile.writeAsString(openId);
  }

  String? ua;

  // itestMain(
  //   cookieDir: cookieDir,
  //   username: username,
  //   loggerOpenId: openId,
  //   userAgent: ua,
  // );

  unipusMain(cookieDir: cookieDir, username: username);
}

Future<void> itestMain({
  required String cookieDir,
  required String username,
  String? loggerOpenId,
  String? userAgent,
}) async {
  final baseUrl = "https://itestcloud.unipus.cn/";
  // final baseUrl: "http://127.0.0.1:9001/"
  final itestDio = Dio(BaseOptions(baseUrl: baseUrl));

  // (itestDio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
  //   final client = HttpClient();
  //   SocksTCPClient.assignToHttpClient(client, [
  //     ProxySettings(
  //       'proxy.example.com',
  //       12345,
  //       username: "username",
  //       password: "password",
  //     ),
  //   ]);
  //   return client;
  // };

  final directory = join(cookieDir, username);
  if (!await Directory(directory).exists()) {
    await Directory(directory).create(recursive: true);
  }
  final cookieJar = PersistCookieJar(storage: FileStorage());

  final itest = await Itest.newInstance(
    cookieJar: cookieJar,
    loggerOpenId: loggerOpenId,
    userAgent: userAgent,
    dio: itestDio,
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
    printLogs("已登录：");
  }

  final examList = await itest.getExamList();
  for (final exam in examList.rs.data) {
    printLogs(exam.ksName);
    printLogs("ksd id: ${exam.ksdId}");
    printLogs(exam.examEnrollInfo);
    printLogs(exam.restrictBeginTimeStr);
    printLogs(exam.restrictEndTimeStr);
    printLogs(exam.canViewKaojuanJudgeBean.scoreReason);
    printLogs(exam.ksText);
    printLogs("faceRecognize: ${exam.faceRecognize}");
    printLogs("hasFaceRecognize: ${exam.hasFaceRecognize}");
    printLogs("hasFaceRecognizeCount: ${exam.hasFaceRecognizeCount}");
    printLogs("-" * 150);
  }

  final examId = inputTrim("请输入 ksdId: ");
  final judgeEntry = await itest.judgeEntry(examId: examId);
  printLogs(JsonEncoder.withIndent("  ").convert(judgeEntry));
  inputTrim("回车进入考试？");
  final confirmExam = await itest.confirmExam(token: judgeEntry.data.token);
  printLogs(confirmExam);
  inputTrim("请确认考试信息，回车确认");
  final examInfo = await itest.examInfo(token: judgeEntry.data.token);
  printLogs("examInfo：$examInfo");
  final examPaperResourceInfo = await itest.examPaperResourceInfo(
    token: judgeEntry.data.token,
  );
  printLogs("examPaperResourceInfo：$examPaperResourceInfo");
  final examWait = await itest.examWait(token: judgeEntry.data.token);
  printLogs("examWait：$examWait");

  await itest.getAnswerSheets(token: judgeEntry.data.token);

  final (questionsWarp, sections!) = await itest.getExamQuestions(
    confirmExamData: confirmExam,
  );
  printLogs("questionsWarp：$questionsWarp");
  final questionsJson = JsonEncoder.withIndent("  ").convert(sections);

  final file = File(
    "./questions/questions-${confirmExam.examName.replaceAll(" ", "-")}.json",
  );
  if (!(await file.parent.exists())) {
    await file.parent.create(recursive: true);
  }
  await file.writeAsString(questionsJson);
  printLogs("题目json已经写入文件：${file.path}");

  final key = inputTrim("请输入 openai api key: ");
  var baseurl = inputTrim("请输入 openai api base url，如果是官方可直接回车: ");
  if (baseurl.isEmpty) baseurl = OpenAiClient.defaultBaseUrl;

  final openaiDio = Dio();
  openaiDio.options = BaseOptions(validateStatus: (s) => s != null);
  openaiDio.interceptors.add(RetryInterceptor(dio: openaiDio));

  final openai = OpenAiClient(apiKey: key, baseUrl: baseurl, dio: openaiDio);
  await testOpenai(openai);

  inputTrim("回车开始自动答题");
  final answers = await itest.buildAnswer(
    uik: questionsWarp.data.uIK.toString(),
    confirmExamData: confirmExam,
    sections: sections,
    getChooseAnswer: (
      List<int> indexList,
      ItestExamQuestionsQuestionGroupItem question,
    ) async {
      printLogs(
        "正在获取答案...：$indexList, ${jsonEncode(question.copyWith(questions: []))}",
      );
      return await getChooseAnswer(openai, question);
    },

    getChoose10From15Answer: (
      List<int> indexList,
      ItestExamQuestionsChoose10From15Question question,
    ) async {
      printLogs("正在获取答案...：$indexList, 15 选 10");
      return await getChoose10From15Answer(openai, question);
    },
    getWritingAnswer: (
      int index,
      ItestExamQuestionsWriteQuestion question,
    ) async {
      printLogs("正在获取答案...：$index, ${question.title}");
      return await getWritingAnswer(openai, question);
    },
    audioToText: (String url) async {
      printLogs("正在识别音频...：$url");
      return audioToText(openai, url, itest.dio);
    },
    writingProgressCallback: (i, total) {
      printLogs("正在输入答案...：$i/$total");
    },
  );

  final file1 = File(
    "./questions/answer-${confirmExam.examName.replaceAll(" ", "-")}.json",
  );
  if (!(await file1.parent.exists())) {
    await file1.parent.create(recursive: true);
  }
  final answersJson = JsonEncoder.withIndent("  ").convert(answers);
  await file1.writeAsString(answersJson);
  printLogs("答案json已经写入文件：${file1.path}");

  while (true) {
    final ok = inputTrim("确认交卷请输入 ok ，不提交直接退出请输入 exit ");
    if (ok == "ok") {
      final submitResult = await itest.submit(
        answers: answers,
        confirmExamData: confirmExam,
        uik: questionsWarp.data.uIK.toString(),
      );
      printLogs("submitResult：$submitResult");
    } else if (ok == "exit") {
      break;
    }
  }
}

Future<void> printLogs(s) async {
  print(s);
}

Future<void> testOpenai(OpenAiClient openai) async {
  final resp = await openai.chatCompletionApi.createChatCompletion(
    ChatCompletionRequest(
      messages: [
        ChatMessage(role: ChatMessageRole.user, content: "这是题目：$testQ，请给出答案"),
      ],
      model: "gpt-5-mini",
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
  printLogs(answer);
}

// MP3 文件的比特率 (kbps) = 128, 192, 256, 320 等
// 文件大小单位是字节 (Bytes)，文件大小 = 文件的比特数 / 8
// 估算时长 (秒) = 文件大小 / (比特率 / 8)
Duration estimateMp3Duration(int fileSizeInBytes, int bitrateKbps) {
  // 计算比特率（bitrate）的字节数，单位为字节/秒
  double bytesPerSecond = (bitrateKbps * 1000) / 8;

  // 估算时长（单位：秒）
  double durationInSeconds = fileSizeInBytes / bytesPerSecond;

  // 返回 Duration 对象
  return Duration(seconds: durationInSeconds.toInt());
}

Future<String> audioToText(OpenAiClient openai, String url, Dio dio) async {
  for (var i = 0; i < 5; i++) {
    try {
      final audioResponse = await dio.get(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      final Uint8List bytes = audioResponse.data;
      final file0 = File(
        "./audios/${DateTime.now().millisecondsSinceEpoch}.mp3",
      );
      if (!(await file0.exists())) await file0.create(recursive: true);
      await file0.writeAsBytes(bytes);

      final metadata = readMetadata(file0, getImage: false);
      final Duration duration =
          metadata.duration ?? estimateMp3Duration(bytes.length, 320);
      final file = MultipartFile.fromBytes(bytes, filename: "audio.mp3");
      final ats = await openai.audioApi.transcriptions<String>(
        SpeechRecognitionRequest(
          model: "whisper-1",
          file: file,
          responseFormat: "text",
          temperature: 0.2,
        ),
      );
      return jsonEncode({"seconds": duration.inSeconds, "text": ats});
    } catch (e) {
      printLogs(e);
    }
  }
  throw Exception("音频识别失败");
}

Future<String> getWritingAnswer(
  OpenAiClient openai,
  ItestExamQuestionsWriteQuestion question,
) async {
  for (var i = 0; i < 5; i++) {
    try {
      final resp = await openai.chatCompletionApi.createChatCompletion(
        ChatCompletionRequest(
          messages: [
            ChatMessage(
              role: ChatMessageRole.user,
              content:
                  "This is the question: ${jsonEncode(question.toJson())}, please provide the answer. If it is a translation question, please return the Chinese translation result when 'content' is English, and when 'content' is Chinese, please return the English translation result. If it is writing, please control the number of words according to the requirements of the topic and do not write too much. Please return plain text, not markdown",
            ),
          ],
          model: "gpt-5-mini",
          responseFormat: ResponseFormat(
            type: ResponseFormatType.jsonSchema,
            jsonSchema: {
              "name": "answers",
              "description": "answers",
              "schema": {
                "type": "object",
                "properties": {
                  "answer": {
                    "type": "string",
                    "description":
                        "Writing Answer. If it is a translation question, please return the Chinese translation result when 'content' is English, and when 'content' is Chinese, please return the English translation result. Please return plain text, not markdown",
                  },
                },
                "required": ["answer"],
              },
            },
          ),
        ),
      );
      final answer =
          jsonDecode(resp.choices.first.message.content!)['answer'] as String;
      return answer;
    } catch (e) {
      printLogs(e);
    }
  }
  throw Exception("答案获取失败");
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
              content:
                  "This is the question: ${jsonEncode(question.toJson())}, please provide the answer.",
            ),
          ],
          model: "gpt-5-mini",
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
                        "Answer array. Example: If the length of choose_10_from_15_question.content[type=\"input\"] is 3, an example answer would be: [[\"C\"], [[\"B\"], [[\"A\"]]. ",
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
      printLogs(e);
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
              content:
                  "This is the question: ${jsonEncode(question.toJson())}, please provide the answer. If it is a listening question, I have already converted it to text. Please check the audio_to_text field.",
            ),
          ],
          model: "gpt-5-mini",
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
                        "Answer array. Example: If the length of questions is 3, an example answer would be: [[0], [1], [3]]. Each inner array represents the answer(s) to a specific question, in order. For single-choice questions, the inner array should contain exactly one integer. For multiple-choice questions, it may contain multiple integers.",
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
      printLogs(e);
    }
  }
  throw Exception("答案获取失败");
}

Future<void> unipusMain({
  required String cookieDir,
  required String username,
}) async {
  final directory = join(cookieDir, username);
  if (!await Directory(directory).exists()) {
    await Directory(directory).create(recursive: true);
  }
  final cookieJar = PersistCookieJar(storage: FileStorage());

  final unipus = await Unipus.newInstance(cookieJar: cookieJar);

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
    printLogs("已登录：${unipus.sessionInfo!.name}");
  }

  final courses = await unipus.getCourses();
  printLogs("📚 课程信息如下：");
  for (final class_ in courses) {
    printLogs("\n============================================================");
    printLogs("🔹 班级名称: ${class_.className}");
    printLogs("📆 时间范围: ${class_.dateRange}");
    for (final course in class_.courses) {
      printLogs("  ─────────────────────────────────────────────");
      printLogs("  📖 课程名称: ${course.courseName}");
      printLogs("  🔗 状态: ${course.status}");
      printLogs("  🆔 tutorial_id: ${course.tutorialId}");
      printLogs("  🌐 链接: ${course.courseUrl}");
    }
    printLogs("============================================================\n");
  }

  final tutorialId = inputTrim("请输入 tutorial_id：");

  if (tutorialId.isEmpty) {
    printLogs('Invalid tutorial_id');
    return;
  }

  final course = courses
      .expand((e) => e.courses)
      .firstWhere((e) => e.tutorialId == tutorialId);

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
    course,
  );

  // // 输入节点 id
  // stdout.write("请输入节点 id: ");
  // String? leaf = stdin.readLineSync();
  //
  // if (leaf == null || leaf.isEmpty) {
  //   printLogs('Invalid leaf id');
  //   return;
  // }
  //
  // // 获取节点内容
  // final leafContent = await unipus.getCourseLeafContent(tutorialId, leaf);
  // printLogs("节点内容：$leafContent");
}

Future<void> traversalCoursesToFs(
  List<Map<String, dynamic>> units,
  List<int> prefix,
  Unipus unipus,
  String tutorialId,
  Map<String, dynamic> leafsProgress,
  String treePrefix,
  Directory rootDir,
  UnipusClassBlockCoursesItem course,
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
    '',
    course,
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
  String leafPath,
  UnipusClassBlockCoursesItem course,
) async {
  for (var i = 0; i < units.length; i++) {
    final unit = units[i];
    final isLast = i + 1 == units.length;
    final currentPrefix = List<int>.from(prefix)..add(i + 1);

    final name = unit['name'] ?? '<Unnamed>';
    final currentLeaf = unit['url'] ?? '';

    final String? summaryString = unit['summary'];
    if (summaryString?.contains('exerciseId') == true) {
      // {"questionNumber":"25","exerciseType":3,"fromApp":3001,"tutorialId":"course-v1:Unipus+nhce_3_vls_1+2016_10","totalScore":"25","exerciseName":"Unit test","scoreDetail":[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],"type":"ut","tutorialType":2,"exerciseId":"453","examId":"20000082"}
      final Map<String, dynamic> summary = jsonDecode(summaryString!);
      final String exerciseId = summary['exerciseId'];
      final dataId = await unipus.enterUnitTest(exerciseId: exerciseId, tutorialId: course.tutorialId!, leaf: currentLeaf);

      final (questionsWarp, sections!) = await unipus.loadUT(
        dataId: dataId
      );

      // todo
    }

    // 构建当前节点的 URL 路径
    final currentLeafPath =
        currentLeaf.isEmpty ? leafPath : '$leafPath/$currentLeaf';
    String statusStr = "";

    bool required = false;
    bool pass = false;

    final leaf = leafsProgress[currentLeaf];
    bool isStudy = leaf != null;
    if (isStudy) {
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
    printLogs("$treePrefix$branch$name $statusStr");
    printLogs(
      "$treePrefix${isLast ? '    ' : '│   '}📍 URL Path: $currentLeafPath",
    );

    final dirName = "${i + 1}.${sanitizeFilename(name)}";
    final thisPath = Directory('${currentPath.path}/$dirName');
    await thisPath.create();

    if (isStudy && !pass) {
      await processCourseLeaf(
        unipus,
        tutorialId,
        currentLeaf,
        thisPath,
        treePrefix,
        branch,
        currentLeafPath,
        course,
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
        currentLeafPath,
        course,
      );
    }
  }

  if (prefix.isEmpty) {
    printLogs("遍历完成");
  }
}

Future<void> processCourseLeaf(
  Unipus unipus,
  String tutorialId,
  String currentLeaf,
  Directory thisPath,
  String treePrefix,
  String branch,
  String leafPath,
  UnipusClassBlockCoursesItem course,
) async {
  try {
    final pageUrl = Unipus.buildStudyPageUrl(
      tutorialId: course.tutorialId!,
      leafPath: leafPath,
    );

    try {
      if (unipus.studyDurationTracker == null) {
            await unipus.connectStudyDurationTracker(
              leaf: currentLeaf,
              tutorialId: tutorialId,
              pageUrl: pageUrl,
            );
          } else {
            unipus.studyDurationTracker!.sendStart(
              newLeaf: currentLeaf,
              newUrl: pageUrl,
            );
          }
    } catch (e) {
      print(e);
      rethrow;
    }

    print("【$currentLeaf】正在学习");
    await Future.delayed(Duration(seconds: Random().nextIntInRange(30, 60)));

    final content = await unipus.getCourseLeafContent(tutorialId, currentLeaf);
    final summary = await unipus.getCourseSummary(tutorialId, currentLeaf);
    final questions = await unipus.getCourseLeafQuestions(
      tutorialId,
      currentLeaf,
    );

    final answer = Unipus.genAnswerBySummary(summary);
    final result = await unipus.submitAnswer(
      tutorialId: course.tutorialId!,
      leaf: currentLeaf,
      answer: answer,
    );
    print("【$currentLeaf】答案提交结果：$result");

    try {
      final result2 = await unipus.postProgress(tutorialId: tutorialId, leaf: currentLeaf);
      print("【$currentLeaf】进度提交结果：$result2");
    } catch (e) {
      print(e);
    }

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
      printLogs(
        "$treePrefix$branch Fulfilling ${path.$1} ... ${filePath.path}",
      );
      printLogs(
        "$leafPath $treePrefix $branch Fulfilling ${path.$1} ... ${filePath.path}",
      );
      await filePath.writeAsString(path.$2);
    }
  } catch (e) {
    printLogs("Error processing leaf [$currentLeaf]: $e");
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
