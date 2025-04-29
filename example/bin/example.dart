import 'dart:convert';
import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:example/utils/input.dart';
import 'package:fuck_unipus/fuck_unipus.dart';

void main() async {
  final cookieDir = "./cookies";
  final username = inputTrim("请输入用户名：");

  unipusMain(cookieDir: cookieDir, username: username);
}

Future<void> itestMain({
  required String cookieDir,
  required String username,
}) async {
  final itest = await Itest.newInstance(
    cookieDir: cookieDir,
    cookieSubDir: username,
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
