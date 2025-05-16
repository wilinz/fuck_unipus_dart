import 'dart:convert';

import 'package:fuck_unipus/fuck_unipus.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:pure_dart_extensions/pure_dart_extensions.dart';

List<Map<String, dynamic>> parseExamQuestionsMap(String html) {
  final document = parse(html);
  final sections = document.querySelectorAll('.itest-section');
  final jsonSections = <Map<String, dynamic>>[];

  for (final section in sections) {
    final sectionType = section.attributes['sectiontype']?.toString();

    if (sectionType == 'sHear') {
      final sectionData = parseChoose(section, sectionType);
      jsonSections.add(sectionData);
    } else if (sectionType == 'sNormal') {
      final choose10From15Div = section.querySelector('.itest-15xuan10');
      final readDiv = section.querySelector('.itest-read');
      final unitDiv = section.querySelector('.itest-danxuan');
      final write = section.querySelector('.itest-write');

      if (choose10From15Div != null) {
        final sectionData = parseChoose10From15(section, sectionType);
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
    'title': title,
    'section_type': sectionType,
    'res_need_play': section.attributes['resneedplay'],
    'type': 'write',
    'write_question': {
      'title': title,
      'content': content,
      'id': textarea.attributes['qid'],
      'sub_index': textarea.attributes['qsubindex'],
      'index': textarea.attributes['qindex'],
      "res_need_play": quesDiv.attributes['resneedplay'],
      "rl": getReadRemainingTime(quesDiv),
    },
  };
  return sectionData;
}

String getReadRemainingTime(dom.Element quesDiv) => quesDiv.attributes['rl']?.toString() == "0" ? "-1" : quesDiv.attributes['rl'].toString();

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

  final questionGroup =
      section.querySelectorAll('.itest-ques-set').map((quesSet) {
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

              return {
                'id': quesDiv.attributes['qid'] ?? '',
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
                'audio_url':
                    audioUrls != null
                        ? (audioUrls.length > 1
                            ? audioUrls[1 + i]
                            : audioUrls[0])
                        : null,
                'audio_to_text': audioUrls != null ? "" : null,
                'options': options.where((o) => o.isNotEmpty).toList(),
                'options_order': parseOptionsOrder(
                  q.querySelector('input')?.attributes['qoo'] ?? '[]',
                ),
              };
            }).toList();

        final group = {
          "res_need_play": quesDiv.attributes['resneedplay'],
          "rl": getReadRemainingTime(quesDiv),
          'article': article,
          'audio_urls': audioUrls,
          'audio_to_text': audioUrls?.map((e) => "").toList(),
          'questions': qsData,
        };
        return group;
      }).toList();

  final sectionData = {
    'page_number': int.tryParse(section.attributes['pagenumber'] ?? '') ?? 0,
    'section_key': section.attributes['sectionkey'] ?? '',
    'section_id': section.attributes['sectionid'] ?? '',
    'res_need_play': section.attributes['resneedplay'],
    'title': section.attributes['part1']?.trim() ?? '',
    'section_type': sectionType,
    'type': subType,
    'question_group':
        questionGroup.where((q) => q?.isNotEmpty == true).toList(),
  };
  return sectionData;
}

Map<String, dynamic> parseChoose10From15(
  dom.Element section,
  String? sectionType,
) {
  final quesDiv = section.querySelector('.itest-ques')!;
  final ulElements = section.querySelectorAll('.xuanxian-list');

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

  final contentDiv = section.querySelector('.xxcontent')!.children.first;
  // 创建一个结构化的 JSON 数据
  List<Map<String, dynamic>> textSections = [];
  List<dynamic> tempSections = [];

  // 解析 <div> 中的内容
  for (var child in contentDiv.nodes) {
    if (child is dom.Text) {
      // 处理文本节点，保存文本内容
      tempSections.add({'type': 'text', 'content': child.text.trim()});
    } else if (child is dom.Element && child.localName == 'input') {
      // 处理 <input> 元素
      tempSections.add({
        'type': 'input',
        'id': child.attributes['qid'],
        'sub_index': child.attributes['qsubindex'],
        'sub_sub_index': child.attributes['qsubsubindex'],
        'index': child.attributes['qindex'],
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
    'title': section.attributes['part1']?.trim() ?? '',
    "res_need_play": section.attributes['resneedplay'],
    'section_type': sectionType,
    'type': 'choose_10_from_15',
    'choose_10_from_15_question': {
      'options': allOptions,
      'content': textSections,
      "res_need_play": quesDiv.attributes['resneedplay'],
      "rl": getReadRemainingTime(quesDiv),
    },
  };

  return sectionData;
}

extension StringCleaning on String {
  String cleanWhitespace() {
    return replaceAll(RegExp(r'\s*\n\s*'), ' ') // 替换换行符及周围的空白
    .replaceAll(RegExp(r'\u00A0'), ' '); // 替换不间断空格
  }
}
