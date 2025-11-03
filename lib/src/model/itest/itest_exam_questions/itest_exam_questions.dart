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
class ItestExamQuestionsAudio with EquatableMixin {
  ItestExamQuestionsAudio({
    required this.url,
    this.seconds,
    this.audioToText,
  });

  @JsonKey(name: "url", defaultValue: "")
  final String url;

  @JsonKey(name: "seconds", defaultValue: -1)
  final int? seconds;

  @JsonKey(name: "audio_to_text", defaultValue: "")
  final String? audioToText;

  factory ItestExamQuestionsAudio.fromJson(Map<String, dynamic> json) =>
      _$ItestExamQuestionsAudioFromJson(json);

  Map<String, dynamic> toJson() => _$ItestExamQuestionsAudioToJson(this);

  factory ItestExamQuestionsAudio.emptyInstance() =>
      ItestExamQuestionsAudio(url: "");

  @override
  List<Object?> get props => _$props;
}

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
    required this.qid,
    required this.index,
    required this.content,
    this.audios,
    required this.options,
    this.optionsOrder,
  });

  @JsonKey(name: "qid", defaultValue: 0)
  final int qid;

  @JsonKey(name: "index", defaultValue: 0)
  final int index;

  @JsonKey(name: "content", defaultValue: "")
  final String content;

  @JsonKey(name: "audios")
  final ItestExamQuestionsAudio? audios;

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
        qid: 0,
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
    required this.id,
    this.article,
    this.audios,
    required this.questions,
    required this.resNeedPlay,
    this.rl,
  });

  @JsonKey(name: "id", defaultValue: 0)
  final int id;

  @JsonKey(name: "article")
  final String? article;

  @JsonKey(name: "res_need_play", defaultValue: "0")
  final String resNeedPlay;

  @JsonKey(name: "rl")
  final String? rl;

  @JsonKey(name: "audios", defaultValue: [])
  final List<ItestExamQuestionsAudio>? audios;

  @JsonKey(name: "questions", defaultValue: [])
  final List<ItestExamQuestionsQuestionsItem> questions;

  factory ItestExamQuestionsQuestionGroupItem.fromJson(
    Map<String, dynamic> json,
  ) => _$ItestExamQuestionsQuestionGroupItemFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ItestExamQuestionsQuestionGroupItemToJson(this);

  factory ItestExamQuestionsQuestionGroupItem.emptyInstance() =>
      ItestExamQuestionsQuestionGroupItem(
        id: 0,
        questions: [],
        resNeedPlay: "0",
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
    this.qid,
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

  @JsonKey(name: "qid")
  final int? qid;

  @JsonKey(name: "sub_index")
  final int? subIndex;

  @JsonKey(name: "sub_sub_index")
  final int? subSubIndex;

  @JsonKey(name: "index")
  final int? index;

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
class ItestExamQuestionsQuestionOption with EquatableMixin {
  ItestExamQuestionsQuestionOption({
    required this.option,
    required this.word,
  });

  @JsonKey(name: "option", defaultValue: "")
  final String option;

  @JsonKey(name: "word", defaultValue: "")
  final String word;

  factory ItestExamQuestionsQuestionOption.fromJson(Map<String, dynamic> json) =>
      _$ItestExamQuestionsQuestionOptionFromJson(json);

  Map<String, dynamic> toJson() => _$ItestExamQuestionsQuestionOptionToJson(this);

  factory ItestExamQuestionsQuestionOption.emptyInstance() =>
      ItestExamQuestionsQuestionOption(option: "", word: "");

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
class ItestExamQuestionsQuestion with EquatableMixin {
  ItestExamQuestionsQuestion({
    required this.id,
    this.type,
    this.audios,
    this.options,
    required this.content,
    this.resNeedPlay,
    this.rl,
  });

  @JsonKey(name: "id", defaultValue: 0)
  final int id;

  @JsonKey(name: "type")
  final String? type;

  @JsonKey(name: "audios", defaultValue: [])
  final List<ItestExamQuestionsAudio>? audios;

  @JsonKey(name: "options", defaultValue: [])
  final List<ItestExamQuestionsQuestionOption>? options;

  @JsonKey(name: "content", defaultValue: [])
  final List<ItestExamQuestionsContentItem> content;

  @JsonKey(name: "res_need_play")
  final String? resNeedPlay;

  @JsonKey(name: "rl")
  final String? rl;

  factory ItestExamQuestionsQuestion.fromJson(Map<String, dynamic> json) =>
      _$ItestExamQuestionsQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$ItestExamQuestionsQuestionToJson(this);

  factory ItestExamQuestionsQuestion.emptyInstance() =>
      ItestExamQuestionsQuestion(
        id: 0,
        content: [],
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
    this.subTitle,
    this.sectionType,
    required this.type,
    required this.resNeedPlay,
    this.direction,
    this.questionGroup,
    this.writeQuestion,
    this.question,
  });

  @JsonKey(name: "page_number")
  final int? pageNumber;

  @JsonKey(name: "section_key")
  final String? sectionKey;

  @JsonKey(name: "section_id")
  final String? sectionId;

  @JsonKey(name: "title", defaultValue: "")
  final String title;

  @JsonKey(name: "sub_title")
  final String? subTitle;

  @JsonKey(name: "section_type")
  final String? sectionType;

  @JsonKey(name: "res_need_play", defaultValue: "0")
  final String resNeedPlay;

  @JsonKey(name: "type", defaultValue: "")
  final String type;

  @JsonKey(name: "direction")
  final String? direction;

  @JsonKey(name: "question_group")
  final List<ItestExamQuestionsQuestionGroupItem>? questionGroup;

  @JsonKey(name: "write_question")
  final ItestExamQuestionsWriteQuestion? writeQuestion;

  @JsonKey(name: "question")
  final ItestExamQuestionsQuestion? question;

  factory ItestExamQuestions.fromJson(Map<String, dynamic> json) =>
      _$ItestExamQuestionsFromJson(json);

  Map<String, dynamic> toJson() => _$ItestExamQuestionsToJson(this);

  factory ItestExamQuestions.emptyInstance() =>
      ItestExamQuestions(title: "", type: "", resNeedPlay: "0");

  @override
  List<Object?> get props => _$props;
}
