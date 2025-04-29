import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:autoequal/autoequal.dart';

part 'itest_exam_judge_entry_response.g.dart';

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class ItestExamJudgeEntryResponse with EquatableMixin {

  ItestExamJudgeEntryResponse(
      {required this.code,
      required this.data,
      required this.msg});

  @JsonKey(name: "code", defaultValue: 0)
  final int code;

  @JsonKey(name: "data", defaultValue: ItestExamJudgeEntryData.emptyInstance)
  final ItestExamJudgeEntryData data;

  @JsonKey(name: "msg", defaultValue: "")
  final String msg;


  factory ItestExamJudgeEntryResponse.fromJson(Map<String, dynamic> json) => _$ItestExamJudgeEntryResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamJudgeEntryResponseToJson(this);
  
  factory ItestExamJudgeEntryResponse.emptyInstance() => ItestExamJudgeEntryResponse(code: 0, data: ItestExamJudgeEntryData.emptyInstance(), msg: "");
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class ItestExamJudgeEntryData with EquatableMixin {

  ItestExamJudgeEntryData(
      {required this.ksId,
      required this.openId,
      required this.url,
      required this.token});

  @JsonKey(name: "ksId", defaultValue: "")
  final String ksId;

  @JsonKey(name: "openId", defaultValue: "")
  final String openId;

  @JsonKey(name: "url", defaultValue: "")
  final String url;

  @JsonKey(name: "token", defaultValue: "")
  final String token;


  factory ItestExamJudgeEntryData.fromJson(Map<String, dynamic> json) => _$ItestExamJudgeEntryDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamJudgeEntryDataToJson(this);
  
  factory ItestExamJudgeEntryData.emptyInstance() => ItestExamJudgeEntryData(ksId: "", openId: "", url: "", token: "");
  
  @override
  List<Object?> get props => _$props;
}


