import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable_annotations/equatable_annotations.dart';

part 'mobile_sso_login_result.g.dart';

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class MobileSsoLoginResult with EquatableMixin {

  MobileSsoLoginResult(
      {required this.code,
      required this.msg,
      required this.rs});

  @JsonKey(name: "code", defaultValue: "")
  final String code;

  @JsonKey(name: "msg", defaultValue: "")
  final String msg;

  @JsonKey(name: "rs", defaultValue: MobileSsoLoginResultRs.emptyInstance)
  final MobileSsoLoginResultRs rs;


  factory MobileSsoLoginResult.fromJson(Map<String, dynamic> json) => _$MobileSsoLoginResultFromJson(json);
  
  Map<String, dynamic> toJson() => _$MobileSsoLoginResultToJson(this);
  
  factory MobileSsoLoginResult.emptyInstance() => MobileSsoLoginResult(code: "", msg: "", rs: MobileSsoLoginResultRs.emptyInstance());
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class MobileSsoLoginResultLinksItem with EquatableMixin {

  MobileSsoLoginResultLinksItem(
      {required this.rel,
      required this.href});

  @JsonKey(name: "rel", defaultValue: "")
  final String rel;

  @JsonKey(name: "href", defaultValue: "")
  final String href;


  factory MobileSsoLoginResultLinksItem.fromJson(Map<String, dynamic> json) => _$MobileSsoLoginResultLinksItemFromJson(json);
  
  Map<String, dynamic> toJson() => _$MobileSsoLoginResultLinksItemToJson(this);
  
  factory MobileSsoLoginResultLinksItem.emptyInstance() => MobileSsoLoginResultLinksItem(rel: "", href: "");
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class MobileSsoLoginResultRs with EquatableMixin {

  MobileSsoLoginResultRs(
      {required this.grantingTicket,
      required this.serviceTicket,
      required this.tgtExpiredTime,
      this.role,
      required this.openid,
      this.nickname,
      this.fullname,
      this.username,
      this.mobile,
      this.email,
      this.perms,
      required this.isSsoLogin,
      this.isCompleted,
      required this.openidHash,
      required this.jwt,
      required this.rt,
      this.createTime,
      required this.status,
      this.source,
      required this.links});

  @JsonKey(name: "grantingTicket", defaultValue: "")
  final String grantingTicket;

  @JsonKey(name: "serviceTicket", defaultValue: "")
  final String serviceTicket;

  @JsonKey(name: "tgtExpiredTime", defaultValue: 0)
  final int tgtExpiredTime;

  @JsonKey(name: "role")
  final dynamic role;

  @JsonKey(name: "openid", defaultValue: "")
  final String openid;

  @JsonKey(name: "nickname")
  final dynamic nickname;

  @JsonKey(name: "fullname")
  final dynamic fullname;

  @JsonKey(name: "username")
  final dynamic username;

  @JsonKey(name: "mobile")
  final dynamic mobile;

  @JsonKey(name: "email")
  final dynamic email;

  @JsonKey(name: "perms")
  final dynamic perms;

  @JsonKey(name: "isSsoLogin", defaultValue: "")
  final String isSsoLogin;

  @JsonKey(name: "isCompleted")
  final dynamic isCompleted;

  @JsonKey(name: "openidHash", defaultValue: "")
  final String openidHash;

  @JsonKey(name: "jwt", defaultValue: "")
  final String jwt;

  @JsonKey(name: "rt", defaultValue: "")
  final String rt;

  @JsonKey(name: "createTime")
  final dynamic createTime;

  @JsonKey(name: "status", defaultValue: 0)
  final int status;

  @JsonKey(name: "source")
  final dynamic source;

  @JsonKey(name: "links", defaultValue: [])
  final List<MobileSsoLoginResultLinksItem> links;


  factory MobileSsoLoginResultRs.fromJson(Map<String, dynamic> json) => _$MobileSsoLoginResultRsFromJson(json);
  
  Map<String, dynamic> toJson() => _$MobileSsoLoginResultRsToJson(this);
  
  factory MobileSsoLoginResultRs.emptyInstance() => MobileSsoLoginResultRs(grantingTicket: "", serviceTicket: "", tgtExpiredTime: 0, openid: "", isSsoLogin: "", openidHash: "", jwt: "", rt: "", status: 0, links: []);
  
  @override
  List<Object?> get props => _$props;
}


