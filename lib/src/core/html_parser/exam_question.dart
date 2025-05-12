
import 'dart:convert';

import 'package:fuck_unipus/fuck_unipus.dart';
import 'package:html/parser.dart';
import 'package:pure_dart_extensions/pure_dart_extensions.dart';

ItestExamQuestions? parseExamQuestions(String html) {
  final document = parse(html);
  final sectionDiv = document.querySelector('.itest-section');

  if (sectionDiv == null) return null;

  List<int> parseOptionsOrder(String qooString) => (jsonDecode(qooString) as List).cast<int>();

  final questions = sectionDiv.querySelectorAll('.itest-ques-set').map((quesSet) {
    final quesDiv = quesSet.querySelector('.itest-ques');
    if (quesDiv == null) return null;

    final options = quesDiv.querySelectorAll('.option.hear-row').map((div) {
      final input = div.querySelector('input');
      return {
        'value': input?.attributes['value']?.toIntOrNull(),
        'type': input?.attributes['type'] ?? '',
        'text': div.text.trim().replaceAll(RegExp(r'\s+'), ' ') ?? '',
        'sub_index': input?.attributes['qsubindex']?.toIntOrNull(),
        'sub_sub_index': input?.attributes['qsubsubindex']?.toIntOrNull(),
      };
    }).toList();

    return {
      'id': quesDiv.attributes['qid'] ?? '',
      'index': quesDiv.querySelector('input')?.attributes['qindex']?.toIntOrNull(),
      'content': quesDiv.querySelector('.option-head')?.text.trim() ?? '',
      'options': options.where((o) => o.isNotEmpty).toList(),
      'options_order': parseOptionsOrder(quesDiv.querySelector('input')?.attributes['qoo'] ?? '[]'),
    };
  }).toList();

  final data = {
    'page_number': int.tryParse(sectionDiv.attributes['pagenumber'] ?? '') ?? 0,
    'section_key': sectionDiv.attributes['sectionkey'] ?? '',
    'section_id': sectionDiv.attributes['sectionid'] ?? '',
    'part1': sectionDiv.attributes['part1']?.trim() ?? '',
    'section_type': sectionDiv.attributes['sectiontype'] ?? '',
    'questions': questions.where((q) => q?.isNotEmpty == true).toList(),
  };
  return ItestExamQuestions.fromJson(data);
}