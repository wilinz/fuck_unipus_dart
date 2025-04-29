import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:autoequal/autoequal.dart';

part 'itest_exam_renew_token_response.g.dart';

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class ItestExamRenewTokenResponse with EquatableMixin {

  ItestExamRenewTokenResponse(
      {required this.code,
      required this.msg,
      required this.rs});

  @JsonKey(name: "code", defaultValue: 0)
  final int code;

  @JsonKey(name: "msg", defaultValue: "")
  final String msg;

  @JsonKey(name: "rs", defaultValue: ItestExamRenewTokenRs.emptyInstance)
  final ItestExamRenewTokenRs rs;


  factory ItestExamRenewTokenResponse.fromJson(Map<String, dynamic> json) => _$ItestExamRenewTokenResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamRenewTokenResponseToJson(this);
  
  factory ItestExamRenewTokenResponse.emptyInstance() => ItestExamRenewTokenResponse(code: 0, msg: "", rs: ItestExamRenewTokenRs.emptyInstance());
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class ItestExamRenewTokenRs with EquatableMixin {

  ItestExamRenewTokenRs(
      {required this.ksId,
      required this.openId,
      required this.extSourceType,
      required this.url,
      required this.token});

  @JsonKey(name: "ksId", defaultValue: "")
  final String ksId;

  @JsonKey(name: "openId", defaultValue: "")
  final String openId;

  @JsonKey(name: "extSourceType", defaultValue: 0)
  final int extSourceType;

  @JsonKey(name: "url", defaultValue: "")
  final String url;

  @JsonKey(name: "token", defaultValue: "")
  final String token;


  factory ItestExamRenewTokenRs.fromJson(Map<String, dynamic> json) => _$ItestExamRenewTokenRsFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamRenewTokenRsToJson(this);
  
  factory ItestExamRenewTokenRs.emptyInstance() => ItestExamRenewTokenRs(ksId: "", openId: "", extSourceType: 0, url: "", token: "");
  
  @override
  List<Object?> get props => _$props;
}


