import 'package:fuck_unipus/src/model/itest/itest_confirm_exam_data/itest_confirm_exam_data.dart';
import 'package:json5/json5.dart';

ItestConfirmExamData parseConfirmExamData(String html) {
  final reg = RegExp(r'window\.\$GLOBAL\s*=\s*(\{[\s\S]*?\});');

  final match = reg.firstMatch(html);
  if (match != null) {
    final objectText = match.group(1);
    if (objectText != null) {
      try {
        final data = json5Decode(objectText);
        if (data is Map<String, dynamic>) {
          return ItestConfirmExamData.fromJson(data);
        }
      } catch (e) {
        throw Exception('ItestConfirmExam parsing failed: $e');
      }
    }
  }

  throw Exception('ItestConfirmExam parsing failed: No match found');
}
