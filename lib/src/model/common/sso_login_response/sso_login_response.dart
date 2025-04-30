import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable_annotations/equatable_annotations.dart';

part 'sso_login_response.g.dart';

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class SsoLoginResponse with EquatableMixin {

  SsoLoginResponse(
      {required this.code,
      required this.msg,
      this.error,
      required this.rs});

  @JsonKey(name: "code", defaultValue: "")
  final String code;

  @JsonKey(name: "msg", defaultValue: "")
  final String msg;

  @JsonKey(name: "error")
  final dynamic error;

  @JsonKey(name: "rs", defaultValue: SsoLoginRs.emptyInstance)
  final SsoLoginRs rs;


  factory SsoLoginResponse.fromJson(Map<String, dynamic> json) => _$SsoLoginResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$SsoLoginResponseToJson(this);
  
  factory SsoLoginResponse.emptyInstance() => SsoLoginResponse(code: "", msg: "", rs: SsoLoginRs.emptyInstance());
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class SsoLoginLinksItem with EquatableMixin {

  SsoLoginLinksItem(
      {required this.rel,
      required this.href});

  @JsonKey(name: "rel", defaultValue: "")
  final String rel;

  @JsonKey(name: "href", defaultValue: "")
  final String href;


  factory SsoLoginLinksItem.fromJson(Map<String, dynamic> json) => _$SsoLoginLinksItemFromJson(json);
  
  Map<String, dynamic> toJson() => _$SsoLoginLinksItemToJson(this);
  
  factory SsoLoginLinksItem.emptyInstance() => SsoLoginLinksItem(rel: "", href: "");
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class SsoLoginRs with EquatableMixin {

  SsoLoginRs(
      {required this.grantingTicket,
      required this.serviceTicket,
      required this.tgtExpiredTime,
      required this.role,
      required this.openid,
      required this.nickname,
      required this.fullname,
      required this.username,
      required this.mobile,
      required this.email,
      required this.perms,
      required this.isSsoLogin,
      required this.isCompleted,
      required this.openidHash,
      required this.jwt,
      required this.rt,
      required this.createTime,
      required this.status,
      required this.source,
      required this.links});

  @JsonKey(name: "grantingTicket", defaultValue: "")
  final String grantingTicket;

  @JsonKey(name: "serviceTicket", defaultValue: "")
  final String serviceTicket;

  @JsonKey(name: "tgtExpiredTime", defaultValue: 0)
  final int tgtExpiredTime;

  @JsonKey(name: "role", defaultValue: "")
  final String role;

  @JsonKey(name: "openid", defaultValue: "")
  final String openid;

  @JsonKey(name: "nickname", defaultValue: "")
  final String nickname;

  @JsonKey(name: "fullname", defaultValue: "")
  final String fullname;

  @JsonKey(name: "username", defaultValue: "")
  final String username;

  @JsonKey(name: "mobile", defaultValue: "")
  final String mobile;

  @JsonKey(name: "email", defaultValue: "")
  final String email;

  @JsonKey(name: "perms", defaultValue: "")
  final String perms;

  @JsonKey(name: "isSsoLogin", defaultValue: "")
  final String isSsoLogin;

  @JsonKey(name: "isCompleted", defaultValue: "")
  final String isCompleted;

  @JsonKey(name: "openidHash", defaultValue: "")
  final String openidHash;

  @JsonKey(name: "jwt", defaultValue: "")
  final String jwt;

  @JsonKey(name: "rt", defaultValue: "")
  final String rt;

  @JsonKey(name: "createTime", defaultValue: "")
  final String createTime;

  @JsonKey(name: "status", defaultValue: 0)
  final int status;

  @JsonKey(name: "source", defaultValue: "")
  final String source;

  @JsonKey(name: "links", defaultValue: [])
  final List<SsoLoginLinksItem> links;


  factory SsoLoginRs.fromJson(Map<String, dynamic> json) => _$SsoLoginRsFromJson(json);
  
  Map<String, dynamic> toJson() => _$SsoLoginRsToJson(this);
  
  factory SsoLoginRs.emptyInstance() => SsoLoginRs(grantingTicket: "", serviceTicket: "", tgtExpiredTime: 0, role: "", openid: "", nickname: "", fullname: "", username: "", mobile: "", email: "", perms: "", isSsoLogin: "", isCompleted: "", openidHash: "", jwt: "", rt: "", createTime: "", status: 0, source: "", links: []);
  
  @override
  List<Object?> get props => _$props;
}


