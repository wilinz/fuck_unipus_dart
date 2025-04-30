import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable_annotations/equatable_annotations.dart';

part 'itest_exam_questions.g.dart';

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class ItestExamQuestions with EquatableMixin {

  ItestExamQuestions(
      {required this.pageNumber,
      required this.sectionKey,
      required this.sectionId,
      required this.part1,
      required this.sectionType,
      required this.questions});

  @JsonKey(name: "page_number", defaultValue: 0)
  final int pageNumber;

  @JsonKey(name: "section_key", defaultValue: "")
  final String sectionKey;

  @JsonKey(name: "section_id", defaultValue: "")
  final String sectionId;

  @JsonKey(name: "part1", defaultValue: "")
  final String part1;

  @JsonKey(name: "section_type", defaultValue: "")
  final String sectionType;

  @JsonKey(name: "questions", defaultValue: [])
  final List<ItestExamQuestionsQuestionsItem> questions;


  factory ItestExamQuestions.fromJson(Map<String, dynamic> json) => _$ItestExamQuestionsFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamQuestionsToJson(this);
  
  factory ItestExamQuestions.emptyInstance() => ItestExamQuestions(pageNumber: 0, sectionKey: "", sectionId: "", part1: "", sectionType: "", questions: []);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class ItestExamQuestionsOptionsItem with EquatableMixin {

  ItestExamQuestionsOptionsItem(
      {required this.value,
      required this.text,
      this.subIndex,
      this.subSubIndex});

  @JsonKey(name: "value", defaultValue: "")
  final String value;

  @JsonKey(name: "text", defaultValue: "")
  final String text;

  @JsonKey(name: "sub_index")
  final String? subIndex;

  @JsonKey(name: "sub_sub_index")
  final String? subSubIndex;


  factory ItestExamQuestionsOptionsItem.fromJson(Map<String, dynamic> json) => _$ItestExamQuestionsOptionsItemFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamQuestionsOptionsItemToJson(this);
  
  factory ItestExamQuestionsOptionsItem.emptyInstance() => ItestExamQuestionsOptionsItem(value: "", text: "");
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class ItestExamQuestionsQuestionsItem with EquatableMixin {

  ItestExamQuestionsQuestionsItem(
      {required this.id,
      required this.index,
      required this.content,
      required this.options,
      this.optionsOrder});

  @JsonKey(name: "id", defaultValue: "")
  final String id;

  @JsonKey(name: "index", defaultValue: "")
  final String index;

  @JsonKey(name: "content", defaultValue: "")
  final String content;

  @JsonKey(name: "options", defaultValue: [])
  final List<ItestExamQuestionsOptionsItem> options;

  @JsonKey(name: "options_order", defaultValue: [])
  final List<int>? optionsOrder;


  factory ItestExamQuestionsQuestionsItem.fromJson(Map<String, dynamic> json) => _$ItestExamQuestionsQuestionsItemFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamQuestionsQuestionsItemToJson(this);
  
  factory ItestExamQuestionsQuestionsItem.emptyInstance() => ItestExamQuestionsQuestionsItem(id: "", index: "", content: "", options: []);
  
  @override
  List<Object?> get props => _$props;
}


