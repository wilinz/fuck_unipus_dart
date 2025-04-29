import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:autoequal/autoequal.dart';

part 'itest_exam_info_response.g.dart';

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class ItestExamInfoResponse with EquatableMixin {

  ItestExamInfoResponse(
      {required this.msg,
      required this.rs,
      required this.code});

  @JsonKey(name: "msg", defaultValue: "")
  final String msg;

  @JsonKey(name: "rs", defaultValue: ItestExamInfoRs.emptyInstance)
  final ItestExamInfoRs rs;

  @JsonKey(name: "code", defaultValue: 0)
  final int code;


  factory ItestExamInfoResponse.fromJson(Map<String, dynamic> json) => _$ItestExamInfoResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamInfoResponseToJson(this);
  
  factory ItestExamInfoResponse.emptyInstance() => ItestExamInfoResponse(msg: "", rs: ItestExamInfoRs.emptyInstance(), code: 0);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class ItestExamInfoRs with EquatableMixin {

  ItestExamInfoRs(
      {required this.ksName,
      required this.ksLimit,
      required this.beginTime,
      required this.endTime,
      required this.kcName});

  @JsonKey(name: "ksName", defaultValue: "")
  final String ksName;

  @JsonKey(name: "ksLimit", defaultValue: 0)
  final int ksLimit;

  @JsonKey(name: "beginTime", defaultValue: "")
  final String beginTime;

  @JsonKey(name: "endTime", defaultValue: "")
  final String endTime;

  @JsonKey(name: "kcName", defaultValue: "")
  final String kcName;


  factory ItestExamInfoRs.fromJson(Map<String, dynamic> json) => _$ItestExamInfoRsFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamInfoRsToJson(this);
  
  factory ItestExamInfoRs.emptyInstance() => ItestExamInfoRs(ksName: "", ksLimit: 0, beginTime: "", endTime: "", kcName: "");
  
  @override
  List<Object?> get props => _$props;
}


