import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable_annotations/equatable_annotations.dart';

part 'itest_exam_questions_wrap_response.g.dart';

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class ItestExamQuestionsWrapResponse with EquatableMixin {

  ItestExamQuestionsWrapResponse(
      {required this.code,
      required this.data});

  @JsonKey(name: "code", defaultValue: 0)
  final int code;

  @JsonKey(name: "data", defaultValue: ItestExamQuestionsWrapData.emptyInstance)
  final ItestExamQuestionsWrapData data;


  factory ItestExamQuestionsWrapResponse.fromJson(Map<String, dynamic> json) => _$ItestExamQuestionsWrapResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamQuestionsWrapResponseToJson(this);
  
  factory ItestExamQuestionsWrapResponse.emptyInstance() => ItestExamQuestionsWrapResponse(code: 0, data: ItestExamQuestionsWrapData.emptyInstance());
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class ItestExamQuestionsWrapData with EquatableMixin {

  ItestExamQuestionsWrapData(
      {required this.dHTML,
      required this.oPTIONORDER,
      required this.iSSHOWQUESPARSE,
      required this.bACKPLAY,
      required this.cHTML,
      required this.uIK,
      required this.nTL,
      required this.tL,
      required this.tYPE});

  @JsonKey(name: "D_HTML", defaultValue: "")
  final String dHTML;

  @JsonKey(name: "OPTION_ORDER", defaultValue: false)
  final bool oPTIONORDER;

  @JsonKey(name: "IS_SHOW_QUESPARSE", defaultValue: false)
  final bool iSSHOWQUESPARSE;

  @JsonKey(name: "BACK_PLAY", defaultValue: false)
  final bool bACKPLAY;

  @JsonKey(name: "C_HTML", defaultValue: "")
  final String cHTML;

  @JsonKey(name: "UIK", defaultValue: 0)
  final int uIK;

  @JsonKey(name: "NTL", defaultValue: 0)
  final int nTL;

  @JsonKey(name: "TL", defaultValue: 0)
  final int tL;

  @JsonKey(name: "TYPE", defaultValue: 0)
  final int tYPE;


  factory ItestExamQuestionsWrapData.fromJson(Map<String, dynamic> json) => _$ItestExamQuestionsWrapDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamQuestionsWrapDataToJson(this);
  
  factory ItestExamQuestionsWrapData.emptyInstance() => ItestExamQuestionsWrapData(dHTML: "", oPTIONORDER: false, iSSHOWQUESPARSE: false, bACKPLAY: false, cHTML: "", uIK: 0, nTL: 0, tL: 0, tYPE: 0);
  
  @override
  List<Object?> get props => _$props;
}


