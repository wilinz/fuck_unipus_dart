import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:autoequal/autoequal.dart';

part 'itest_exam_wait_response.g.dart';

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class ItestExamWaitResponse with EquatableMixin {

  ItestExamWaitResponse(
      {required this.code,
      required this.msg,
      required this.rs});

  @JsonKey(name: "code", defaultValue: 0)
  final int code;

  @JsonKey(name: "msg", defaultValue: "")
  final String msg;

  @JsonKey(name: "rs", defaultValue: ItestExamWaitRs.emptyInstance)
  final ItestExamWaitRs rs;


  factory ItestExamWaitResponse.fromJson(Map<String, dynamic> json) => _$ItestExamWaitResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamWaitResponseToJson(this);
  
  factory ItestExamWaitResponse.emptyInstance() => ItestExamWaitResponse(code: 0, msg: "", rs: ItestExamWaitRs.emptyInstance());
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class ItestExamWaitRs with EquatableMixin {

  ItestExamWaitRs(
      {required this.waitingTime,
      required this.isExpire});

  @JsonKey(name: "waitingTime", defaultValue: 0)
  final int waitingTime;

  @JsonKey(name: "isExpire", defaultValue: 0)
  final int isExpire;


  factory ItestExamWaitRs.fromJson(Map<String, dynamic> json) => _$ItestExamWaitRsFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamWaitRsToJson(this);
  
  factory ItestExamWaitRs.emptyInstance() => ItestExamWaitRs(waitingTime: 0, isExpire: 0);
  
  @override
  List<Object?> get props => _$props;
}


