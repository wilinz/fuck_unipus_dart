import 'dart:convert';
import 'dart:math';

import 'package:html/parser.dart';
import 'package:json5/json5.dart';

Map<String, dynamic>? parseCloseReferNotifyData(String htmlContent) {
  // 正则表达式提取整个 $.ajax({...}) 函数调用的 JSON 部分
  final doc = parse(htmlContent);
  final scripts = doc
      .getElementsByTagName("script")
      .where(
        (e) => e.text.contains("itest-api/itest/s/answer/closeReferNotify"),
      )
      .map((e) => e.text)
      .join("\n\n");
  RegExp regex = RegExp(
    r'\$\.\s*ajax\s*\(\s*\{[^}]*?"data"\s*:\s*(\{.*\})',
    multiLine: true,
    dotAll: true, // 使正则可以匹配换行符
  );
  final match = regex.firstMatch(scripts);

  if (match != null) {
    // 提取的 JSON 部分
    final matchText = match.group(1)!;
    final text = extractBracketsContent(matchText);

    try {
      final preprocessText = preprocessJson5(text);
      // 解析 JSON 字符串为 Map 对象
      final dataMap = json5Decode(preprocessText);
      dataMap['__r'] = Random().nextDouble();
      // 返回 Map 对象
      return dataMap;
    } catch (e) {
      print("JSON 解析失败: $e");
      return null;
    }
  } else {
    print("未找到匹配的 \$.ajax 数据！");
    return null;
  }
}

String extractBracketsContent(String input) {
  int openCount = 0; // 左括号计数
  int startIndex = -1; // 存储第一个左括号的索引
  int endIndex = -1; // 存储最后一个右括号的索引

  for (int i = 0; i < input.length; i++) {
    if (input[i] == '{') {
      if (openCount == 0) {
        startIndex = i; // 记录第一个左括号的位置
      }
      openCount++; // 遇到左括号增加计数
    } else if (input[i] == '}') {
      openCount--; // 遇到右括号减少计数
      if (openCount == 0) {
        endIndex = i; // 记录配对的最后一个右括号的位置
        break; // 找到配对的括号后跳出
      }
    }
  }

  // 截取最外层括号内的内容
  if (startIndex != -1 && endIndex != -1) {
    return input.substring(startIndex, endIndex+1); // 去掉最外层括号
  }

  return ''; // 如果没有找到匹配的括号，则返回空字符串
}

String preprocessJson5(String input) {
  // 正则替换任意函数调用为字符串 "functionName()"
  String output = input.replaceAllMapped(RegExp(r'[a-zA-Z0-9_\.]+\([^)]*\)'), (match) {
    return '"${match.group(0)}"'; // 将整个匹配的函数调用转化为字符串
  });

  // 返回处理后的 JSON5 字符串
  return output;
}