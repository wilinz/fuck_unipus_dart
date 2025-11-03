/// U校园 iTest 考试题目 HTML 解析器
///
/// 本模块负责解析 iTest 考试页面的 HTML 内容，并将其转换为结构化的 JSON 数据。
///
/// ## 支持的题目类型（Section Types）
///
/// 本解析器支持以下 **5 种** 题目类型：
///
/// ### 1. `listening` - 听力题
/// - **sectionType**: `sHear`
/// - **特征**: 包含音频资源列表 (`.itest-hear-reslist`)
/// - **示例**: 短对话、长对话、短文理解
///
/// ### 2. `read_article` - 阅读理解（含文章）
/// - **sectionType**: `sNormal`
/// - **特征**: 包含文章内容 (`.article`)
/// - **示例**: 长篇阅读、段落匹配
///
/// ### 3. `choose` - 普通选择题
/// - **sectionType**: `sNormal`
/// - **特征**: 不含音频和文章
/// - **示例**: 单项选择、多项选择
///
/// ### 4. `write` - 写作题
/// - **sectionType**: `sNormal`
/// - **特征**: 包含写作区域 (`.itest-write`)
/// - **示例**: 短文写作、应用文写作
///
/// ### 5. `article_fill_blank` - 填空题
/// - **sectionType**: `sHear` (复合式听写) 或 `sNormal` (15选10)
/// - **子类型**:
///   - `compound_dictation` - 复合式听写
///   - `choose_10_from_15` - 15选10填空
/// - **特征**: 包含填空输入框和选项列表
/// - **示例**: 复合式听写、选词填空
///
/// ## 主要函数
///
/// - [parseExamQuestionsMap] - 主入口函数，解析整个HTML并返回所有section
/// - [parseChoose] - 解析选择题（listening/read_article/choose）
/// - [parseWrite] - 解析写作题（write）
/// - [parseFillBlank] - 解析填空题（article_fill_blank）
///
/// ## 使用示例
///
/// ```dart
/// final html = await loadExamHtml();
/// final sections = parseExamQuestionsMap(html);
/// final examQuestions = itestExamQuestionsListFormJson(sections);
/// ```
library;

import 'dart:convert';

import 'package:fuck_unipus/fuck_unipus.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:pure_dart_extensions/pure_dart_extensions.dart';

/// 解析 iTest 考试题目 HTML，返回结构化的 JSON 数据
///
/// 此函数是解析器的主入口，负责：
/// 1. 解析 HTML 文档
/// 2. 查找所有 `.itest-section` 元素
/// 3. 根据 `sectiontype` 属性分类处理
/// 4. 返回包含所有题目数据的 JSON 列表
///
/// ## 参数
/// - [html] - iTest 考试页面的完整 HTML 内容
///
/// ## 返回
/// 返回 `List<Map<String, dynamic>>`，每个 Map 代表一个 section，
/// 结构符合 [ItestExamQuestions] 模型定义
///
/// ## Section 分类逻辑
///
/// ### sHear (听力类)
/// - 如果 `part1` 为 "复合式听写" → `article_fill_blank` (compound_dictation)
/// - 否则 → `listening`
///
/// ### sNormal (普通类)
/// - 如果包含 `.itest-15xuan10` → `article_fill_blank` (choose_10_from_15)
/// - 如果包含 `.itest-read` 或 `.itest-danxuan` → `read_article` 或 `choose`
/// - 如果包含 `.itest-write` → `write`
///
/// ## 示例
/// ```dart
/// final html = '<div class="itest-section" sectiontype="sHear">...</div>';
/// final sections = parseExamQuestionsMap(html);
/// print(sections.length); // 输出: 1
/// print(sections[0]['type']); // 输出: listening 或 article_fill_blank
/// ```
List<Map<String, dynamic>> parseExamQuestionsMap(String html) {
  final document = parse(html);
  final sections = document.querySelectorAll('.itest-section');
  final jsonSections = <Map<String, dynamic>>[];

  for (final section in sections) {
    final sectionType = section.attributes['sectiontype']?.toString();

    if (sectionType == 'sHear') {
      if (section.querySelector("input.blankinput") != null) {
        final sectionData = parseFillBlank(
          section,
          sectionType,
          "compound_dictation",
        );
        jsonSections.add(sectionData);
      } else {
        final sectionData = parseChoose(section, sectionType);
        jsonSections.add(sectionData);
      }
    } else if (sectionType == 'sNormal') {
      final choose10From15Div = section.querySelector('.itest-15xuan10');
      final readDiv = section.querySelector('.itest-read');
      final unitDiv = section.querySelector('.itest-danxuan');
      final write = section.querySelector('.itest-write');

      if (choose10From15Div != null) {
        final sectionData = parseFillBlank(
          section,
          sectionType,
          "choose_10_from_15",
        );
        jsonSections.add(sectionData);
      } else if (readDiv != null || unitDiv != null) {
        final sectionData = parseChoose(section, sectionType);
        jsonSections.add(sectionData);
      } else if (write != null) {
        final sectionData = parseWrite(section, sectionType);
        jsonSections.add(sectionData);
      }
    }
  }
  return jsonSections;
}

Map<String, dynamic> parseWrite(dom.Element section, String? sectionType) {
  final quesDiv = section.querySelector('.itest-ques')!;
  final content = section.querySelector(".title-text")!.text.cleanWhitespace();
  final textarea = section.querySelector("textarea")!;
  final title = section.attributes['part1']?.trim() ?? '';

  final sectionData = {
    'page_number': int.tryParse(section.attributes['pagenumber'] ?? '') ?? 0,
    'section_key': section.attributes['sectionkey'] ?? '',
    'section_id': section.attributes['sectionid'] ?? '',
    'direction':
        section
            .querySelector(".itest-direction > .text")
            ?.text
            .cleanWhitespace() ??
        '',
    'title': section.attributes['part1']?.trim() ?? '',
    'sub_title': section.querySelector("div.title")?.text ?? '',
    'section_type': sectionType,
    'res_need_play': section.attributes['resneedplay'],
    'type': 'write',
    'write_question': {
      'title': title,
      'content': content,
      'id': textarea.attributes['qid'].toIntOrNull(),
      'sub_index': textarea.attributes['qsubindex'].toIntOrNull(),
      'index': textarea.attributes['qindex'].toIntOrNull(),
      "res_need_play": quesDiv.attributes['resneedplay'],
      "rl": getReadRemainingTime(quesDiv),
    },
  };
  return sectionData;
}

String? getReadRemainingTime(dom.Element quesDiv) {
  final rl = quesDiv.attributes['rl'];
  return rl == "0" ? "-1" : rl;
}

List<int> parseOptionsOrder(String qooString) =>
    (jsonDecode(qooString) as List).cast<int>();

Map<String, dynamic> parseChoose(dom.Element section, String? sectionType) {
  String subType;
  if (section.querySelector(".itest-hear-reslist") != null) {
    subType = 'listening';
  } else if (section.querySelector('.article') != null) {
    subType = 'read_article';
  } else {
    subType = 'choose';
  }

  final questionGroupDiv = section.querySelectorAll('.itest-ques-set');
  final questionGroup =
      questionGroupDiv.map((quesSet) {
        final quesDiv = quesSet.querySelector('.itest-ques');
        if (quesDiv == null) return null;

        final audioNodeText =
            quesSet.querySelector(".itest-hear-reslist")?.text;
        final itestHearReslist =
            audioNodeText != null
                ? (jsonDecode(audioNodeText) as List).cast<String>()
                : null;
        final audioUrls =
            itestHearReslist?.where((e) => e.startsWith("http")).toList();

        // -----------

        final article =
            quesSet.querySelector('.article')?.innerHtml.cleanWhitespace();

        final qs = quesDiv.querySelectorAll(
          article != null ? ".row" : ".css-danxuan.row",
        );

        final qid = getQuestionId(quesDiv, quesSet);
        final qsData =
            qs.indexed.map((item) {
              final i = item.$1;
              final q = item.$2;

              final options =
                  q.querySelectorAll('.option.hear-row').map((div) {
                    final input = div.querySelector('input');
                    return {
                      'value': input?.attributes['value']?.toIntOrNull(),
                      'type': input?.attributes['type'] ?? '',
                      'text': div.text.trim().cleanWhitespace() ?? '',
                      'sub_index':
                          input?.attributes['qsubindex']?.toIntOrNull(),
                      'sub_sub_index':
                          input?.attributes['qsubsubindex']?.toIntOrNull(),
                    };
                  }).toList();

              final audioUrl =
                  audioUrls != null
                      ? (audioUrls.length > 1 ? audioUrls[1 + i] : audioUrls[0])
                      : null;
              return {
                'qid':
                    (quesDiv.attributes['qid'] ??
                            quesSet.attributes['questionid'] ??
                            '-1')
                        .toIntOrNull(),
                'index':
                    q
                        .querySelector('input')
                        ?.attributes['qindex']
                        ?.toIntOrNull(),
                'content':
                    q
                        .querySelector('.option-head')
                        ?.text
                        .trim()
                        .cleanWhitespace() ??
                    '',
                'audios':
                    audioUrl != null
                        ? {"url": audioUrl, "seconds": -1, "audio_to_text": ""}
                        : null,
                'options': options.where((o) => o.isNotEmpty).toList(),
                'options_order': parseOptionsOrder(
                  q.querySelector('input')?.attributes['qoo'] ?? '[]',
                ),
              };
            }).toList();

        final group = {
          "id": qid,
          "res_need_play":
              quesDiv.attributes['resneedplay'] ??
              quesSet.attributes['resneedplay'],
          "rl": getReadRemainingTime(
            quesDiv.attributes['rl'] != null ? quesDiv : quesSet,
          ),
          'article': article,
          'audios':
              audioUrls
                  ?.map((e) => {"url": e, "seconds": -1, "audio_to_text": ""})
                  .toList(),
          'questions': qsData,
        };
        return group;
      }).toList();

  final sectionData = {
    'page_number': int.tryParse(section.attributes['pagenumber'] ?? '') ?? 0,
    'section_key': section.attributes['sectionkey'] ?? '',
    'section_id': section.attributes['sectionid'] ?? '',
    'res_need_play': section.attributes['resneedplay'],
    'direction':
        section
            .querySelector(".itest-direction > .text")
            ?.text
            .cleanWhitespace() ??
        '',
    'title': section.attributes['part1']?.trim() ?? '',
    'sub_title': section.querySelector("div.title")?.text ?? '',
    'section_type': sectionType,
    'type': subType,
    'question_group':
        questionGroup.where((q) => q?.isNotEmpty == true).toList(),
  };
  return sectionData;
}

Map<String, dynamic> parseFillBlank(
  dom.Element section,
  String? sectionType,
  String type,
) {
  final questionGroupDiv = section.querySelector('.itest-ques-set')!;
  final quesDiv = section.querySelector('.itest-ques')!;
  final ulElements = section.querySelectorAll('.xuanxian-list');

  final audioNodeText = section.querySelector(".itest-hear-reslist")?.text;
  final itestHearReslist =
      audioNodeText != null
          ? (jsonDecode(audioNodeText) as List).cast<String>()
          : null;
  final audioUrls =
      itestHearReslist?.where((e) => e.startsWith("http")).toList();

  Map<String, String> parseItem(String item) {
    // 使用正则表达式提取字母和词汇
    RegExp regExp = RegExp(r'([A-Z])\)(.+)');
    Match? match = regExp.firstMatch(item);

    if (match != null) {
      // 返回字母和词汇的键值对
      return {'option': match.group(1)!.trim(), 'word': match.group(2)!.trim()};
    } else {
      // 如果匹配失败，返回空的 Map
      return {'option': item, 'word': item};
    }
  }

  // 遍历每个 <ul>，提取其中的 <li> 元素并处理
  List<Map<String, String>> allOptions = [];
  for (var ul in ulElements) {
    List<Map<String, String>> group = [];
    ul.querySelectorAll('li').forEach((li) {
      String text = li.text.trim(); // 获取 <li> 中的文本
      group.add(parseItem(text)); // 解析文本
    });
    allOptions.addAll(group);
  }

  // final contentDiv = section.querySelector('input')!.parent!;
  dom.Element contentDiv;
  if (type == "compound_dictation"){
    contentDiv = section.querySelector('.css-danxuan.row')!;
  }else {
    // choose_10_from_15
    contentDiv = section.querySelector('.xxcontent')!;
  }

  List<dom.Node> flattenNodes(dom.Node root) {
    List<dom.Node> result = [];

    void traverse(dom.Node node) {
      result.add(node);
      for (var child in node.nodes) {
        traverse(child);
      }
    }

    traverse(root);
    return result;
  }

  final allNodes = flattenNodes(contentDiv);

  // 创建一个结构化的 JSON 数据
  List<Map<String, dynamic>> textSections = [];
  List<dynamic> tempSections = [];

  // 解析 <div> 中的内容
  for (var child in allNodes) {
    if (child is dom.Text) {
      // 处理文本节点，保存文本内容
      if (child.text.isNotBlank) {
        tempSections.add({'type': 'text', 'content': child.text.trim()});
      }
    } else if (child is dom.Element && child.localName == 'input') {
      // 处理 <input> 元素
      tempSections.add({
        'type': 'input',
        'qid': child.attributes['qid'].toIntOrNull(),
        'sub_index': child.attributes['qsubindex'].toIntOrNull(),
        'sub_sub_index': child.attributes['qsubsubindex'].toIntOrNull(),
        'index': child.attributes['qindex'].toIntOrNull(),
        'placeholder': child.attributes['placeholder'],
        'validate_rule': child.attributes['validaterole'],
      });
    } else if (child is dom.Element && child.localName == 'br') {
      // 处理 <br> 标签，将其视为换行
      tempSections.add({'type': 'text', 'content': '\n'});
    }
  }

  // 合并相邻的文本节点
  StringBuffer currentText = StringBuffer();
  for (var section in tempSections) {
    if (section['type'] == 'text') {
      // 如果当前是文本节点，合并文本内容
      String textContent = section['content'];

      // 如果当前文本是换行符后的文本，移除前面的空格
      if (currentText.isNotEmpty && currentText.toString().endsWith('\n')) {
        textContent = textContent.trimLeft(); // 移除文本前的空格
      }

      // 处理句内的换行符，移除换行符及其前后的空格
      textContent = textContent.cleanWhitespace();

      // 添加文本内容到 currentText
      currentText.write(textContent);
    } else {
      // 如果是非文本节点，先将合并后的文本内容存入结果
      if (currentText.isNotEmpty) {
        textSections.add({'type': 'text', 'content': currentText.toString()});
        currentText.clear();
      }
      // 将非文本节点直接添加
      textSections.add(section);
    }
  }

  // 如果最后有剩余的文本，将其添加
  if (currentText.isNotEmpty) {
    textSections.add({'type': 'text', 'content': currentText.toString()});
  }

  final sectionData = {
    'page_number': int.tryParse(section.attributes['pagenumber'] ?? '') ?? 0,
    'section_key': section.attributes['sectionkey'] ?? '',
    'section_id': section.attributes['sectionid'] ?? '',
    'direction':
        section
            .querySelector(".itest-direction > .text")
            ?.text
            .cleanWhitespace() ??
        '',
    'title': section.attributes['part1']?.trim() ?? '',
    'sub_title': section.querySelector("div.title")?.text ?? '',
    "res_need_play": section.attributes['resneedplay'],
    'section_type': sectionType,
    'type': 'article_fill_blank',
    'question': {
      "id": getQuestionId(quesDiv, questionGroupDiv),
      'type': type,
      'audios':
          audioUrls?.map((e) => {"url": e, "seconds": -1, "audio_to_text": ""}).toList(),
      'options': allOptions.isNotEmpty ? allOptions : null,
      'content': textSections,
      "res_need_play": quesDiv.attributes['resneedplay'],
      "rl": getReadRemainingTime(quesDiv),
    },
  };

  return sectionData;
}

int? getQuestionId(dom.Element quesDiv, [dom.Element? questionGroupDiv]) {
  return quesDiv.attributes['qid'].toIntOrNull() ??
      questionGroupDiv?.attributes['questionid'].toIntOrNull();
}

extension StringCleaning on String {
  String cleanWhitespace() {
    return replaceAll(RegExp(r'\s*\n\s*'), '\n') // 替换换行符及周围的空白
    .replaceAll(RegExp(r'\u00A0'), ' '); // 替换不间断空格
  }
}
