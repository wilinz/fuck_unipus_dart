import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable_annotations/equatable_annotations.dart';

part 'itest_exam_questions.g.dart';

List<ItestExamQuestions> itestExamQuestionsListFormJson(List json) =>
    json
        .map((e) => ItestExamQuestions.fromJson(e as Map<String, dynamic>))
        .toList();

List<Map<String, dynamic>> itestExamQuestionsListToJson(
  List<ItestExamQuestions> instance,
) => instance.map((e) => e.toJson()).toList();

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class ItestExamQuestionsOptionsItem with EquatableMixin {
  ItestExamQuestionsOptionsItem({
    required this.value,
    required this.type,
    required this.text,
    this.subIndex,
    this.subSubIndex,
  });

  @JsonKey(name: "value", defaultValue: 0)
  final int value;

  @JsonKey(name: "type", defaultValue: "")
  final String type;

  @JsonKey(name: "text", defaultValue: "")
  final String text;

  @JsonKey(name: "sub_index")
  final int? subIndex;

  @JsonKey(name: "sub_sub_index")
  final int? subSubIndex;

  factory ItestExamQuestionsOptionsItem.fromJson(Map<String, dynamic> json) =>
      _$ItestExamQuestionsOptionsItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItestExamQuestionsOptionsItemToJson(this);

  factory ItestExamQuestionsOptionsItem.emptyInstance() =>
      ItestExamQuestionsOptionsItem(value: 0, type: "", text: "");

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class ItestExamQuestionsQuestionsItem with EquatableMixin {
  ItestExamQuestionsQuestionsItem({
    required this.id,
    required this.index,
    required this.content,
    this.audioUrl,
    this.audioToText,
    required this.options,
    this.optionsOrder,
  });

  @JsonKey(name: "id", defaultValue: "")
  final String id;

  @JsonKey(name: "index", defaultValue: 0)
  final int index;

  @JsonKey(name: "content", defaultValue: "")
  final String content;

  @JsonKey(name: "audio_url")
  final String? audioUrl;

  @JsonKey(name: "audio_to_text")
  final String? audioToText;

  @JsonKey(name: "options", defaultValue: [])
  final List<ItestExamQuestionsOptionsItem> options;

  @JsonKey(name: "options_order", defaultValue: [])
  final List<int>? optionsOrder;

  factory ItestExamQuestionsQuestionsItem.fromJson(Map<String, dynamic> json) =>
      _$ItestExamQuestionsQuestionsItemFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ItestExamQuestionsQuestionsItemToJson(this);

  factory ItestExamQuestionsQuestionsItem.emptyInstance() =>
      ItestExamQuestionsQuestionsItem(
        id: "",
        index: 0,
        content: "",
        options: [],
      );

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class ItestExamQuestionsQuestionGroupItem with EquatableMixin {
  ItestExamQuestionsQuestionGroupItem({
    this.article,
    this.audioUrls,
    this.audioToText,
    required this.questions,
    required this.resNeedPlay,
    required this.rl,
  });

  @JsonKey(name: "article")
  final String? article;

  @JsonKey(name: "res_need_play", defaultValue: "0")
  final String resNeedPlay;

  @JsonKey(name: "rl", defaultValue: "-1")
  final String rl;

  @JsonKey(name: "audio_urls", defaultValue: [])
  final List<String>? audioUrls;

  @JsonKey(name: "audio_to_text", defaultValue: [])
  final List<String>? audioToText;

  @JsonKey(name: "questions", defaultValue: [])
  final List<ItestExamQuestionsQuestionsItem> questions;

  factory ItestExamQuestionsQuestionGroupItem.fromJson(
    Map<String, dynamic> json,
  ) => _$ItestExamQuestionsQuestionGroupItemFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ItestExamQuestionsQuestionGroupItemToJson(this);

  factory ItestExamQuestionsQuestionGroupItem.emptyInstance() =>
      ItestExamQuestionsQuestionGroupItem(
        questions: [],
        resNeedPlay: "0",
        rl: "-1",
      );

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class ItestExamQuestionsContentItem with EquatableMixin {
  ItestExamQuestionsContentItem({
    required this.type,
    this.content,
    this.id,
    this.subIndex,
    this.subSubIndex,
    this.index,
    this.placeholder,
    this.validateRule,
  });

  @JsonKey(name: "type", defaultValue: "")
  final String type;

  @JsonKey(name: "content")
  final String? content;

  @JsonKey(name: "id")
  final String? id;

  @JsonKey(name: "sub_index")
  final String? subIndex;

  @JsonKey(name: "sub_sub_index")
  final String? subSubIndex;

  @JsonKey(name: "index")
  final String? index;

  @JsonKey(name: "placeholder")
  final String? placeholder;

  @JsonKey(name: "validate_rule")
  final String? validateRule;

  factory ItestExamQuestionsContentItem.fromJson(Map<String, dynamic> json) =>
      _$ItestExamQuestionsContentItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItestExamQuestionsContentItemToJson(this);

  factory ItestExamQuestionsContentItem.emptyInstance() =>
      ItestExamQuestionsContentItem(type: "");

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class ItestExamQuestionsChoose10From15Option with EquatableMixin {
  ItestExamQuestionsChoose10From15Option({
    required this.option,
    required this.word,
  });

  @JsonKey(name: "option", defaultValue: "")
  final String option;

  @JsonKey(name: "word", defaultValue: "")
  final String word;

  factory ItestExamQuestionsChoose10From15Option.fromJson(Map<String, dynamic> json) =>
      _$ItestExamQuestionsChoose10From15OptionFromJson(json);

  Map<String, dynamic> toJson() => _$ItestExamQuestionsChoose10From15OptionToJson(this);

  factory ItestExamQuestionsChoose10From15Option.emptyInstance() =>
      ItestExamQuestionsChoose10From15Option(option: "", word: "");

  @override
  List<Object?> get props => _$props;

}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class ItestExamQuestionsChoose10From15Question with EquatableMixin {
  ItestExamQuestionsChoose10From15Question({
    required this.options,
    required this.content,
    required this.resNeedPlay,
    required this.rl,
  });

  @JsonKey(name: "res_need_play", defaultValue: "0")
  final String resNeedPlay;

  @JsonKey(name: "rl", defaultValue: "-1")
  final String rl;

  @JsonKey(name: "options", defaultValue: [])
  final List<ItestExamQuestionsChoose10From15Option> options;

  @JsonKey(name: "content", defaultValue: [])
  final List<ItestExamQuestionsContentItem> content;

  factory ItestExamQuestionsChoose10From15Question.fromJson(
    Map<String, dynamic> json,
  ) => _$ItestExamQuestionsChoose10From15QuestionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ItestExamQuestionsChoose10From15QuestionToJson(this);

  factory ItestExamQuestionsChoose10From15Question.emptyInstance() =>
      ItestExamQuestionsChoose10From15Question(
        options: [],
        content: [],
        resNeedPlay: "0",
        rl: "-1",
      );

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class ItestExamQuestionsWriteQuestion with EquatableMixin {
  ItestExamQuestionsWriteQuestion({
    required this.title,
    required this.content,
    required this.id,
    required this.subIndex,
    required this.index,
    required this.resNeedPlay,
    required this.rl,
  });

  @JsonKey(name: "res_need_play", defaultValue: "0")
  final String resNeedPlay;

  @JsonKey(name: "rl", defaultValue: "-1")
  final String rl;

  @JsonKey(name: "title", defaultValue: "")
  final String title;

  @JsonKey(name: "content", defaultValue: "")
  final String content;

  @JsonKey(name: "id", defaultValue: "")
  final String id;

  @JsonKey(name: "sub_index", defaultValue: "")
  final String subIndex;

  @JsonKey(name: "index", defaultValue: "")
  final String index;

  factory ItestExamQuestionsWriteQuestion.fromJson(Map<String, dynamic> json) =>
      _$ItestExamQuestionsWriteQuestionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ItestExamQuestionsWriteQuestionToJson(this);

  factory ItestExamQuestionsWriteQuestion.emptyInstance() =>
      ItestExamQuestionsWriteQuestion(
        title: "",
        content: "",
        id: "",
        subIndex: "",
        index: "",
        resNeedPlay: "0",
        rl: "-1",
      );

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class ItestExamQuestions with EquatableMixin {
  ItestExamQuestions({
    this.pageNumber,
    this.sectionKey,
    this.sectionId,
    required this.title,
    this.sectionType,
    required this.type,
    required this.resNeedPlay,
    this.questionGroup,
    this.choose10From15Question,
    this.writeQuestion,
  });

  @JsonKey(name: "page_number")
  final int? pageNumber;

  @JsonKey(name: "section_key")
  final String? sectionKey;

  @JsonKey(name: "section_id")
  final String? sectionId;

  @JsonKey(name: "title", defaultValue: "")
  final String title;

  @JsonKey(name: "section_type")
  final String? sectionType;

  @JsonKey(name: "res_need_play", defaultValue: "0")
  final String resNeedPlay;

  @JsonKey(name: "type", defaultValue: "")
  final String type;

  @JsonKey(name: "question_group", defaultValue: [])
  final List<ItestExamQuestionsQuestionGroupItem>? questionGroup;

  @JsonKey(name: "choose_10_from_15_question")
  final ItestExamQuestionsChoose10From15Question? choose10From15Question;

  @JsonKey(name: "write_question")
  final ItestExamQuestionsWriteQuestion? writeQuestion;

  factory ItestExamQuestions.fromJson(Map<String, dynamic> json) =>
      _$ItestExamQuestionsFromJson(json);

  Map<String, dynamic> toJson() => _$ItestExamQuestionsToJson(this);

  factory ItestExamQuestions.emptyInstance() =>
      ItestExamQuestions(title: "", type: "", resNeedPlay: "0");

  @override
  List<Object?> get props => _$props;
}
