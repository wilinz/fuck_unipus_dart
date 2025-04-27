import 'package:json_annotation/json_annotation.dart';

part 'sso_login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SsoLoginResponse {

  SsoLoginResponse(
      {required this.code,
      required this.msg,
      this.error,
      required this.rs});

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  @JsonKey(name: "error")
  dynamic error;

  @JsonKey(name: "rs", defaultValue: Rs.emptyInstance)
  Rs rs;


  factory SsoLoginResponse.fromJson(Map<String, dynamic> json) => _$SsoLoginResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$SsoLoginResponseToJson(this);
  
  factory SsoLoginResponse.emptyInstance() => SsoLoginResponse(code: "", msg: "", rs: Rs.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class Links {

  Links(
      {required this.rel,
      required this.href});

  @JsonKey(name: "rel", defaultValue: "")
  String rel;

  @JsonKey(name: "href", defaultValue: "")
  String href;


  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  
  Map<String, dynamic> toJson() => _$LinksToJson(this);
  
  factory Links.emptyInstance() => Links(rel: "", href: "");
}

@JsonSerializable(explicitToJson: true)
class Rs {

  Rs(
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
  String grantingTicket;

  @JsonKey(name: "serviceTicket", defaultValue: "")
  String serviceTicket;

  @JsonKey(name: "tgtExpiredTime", defaultValue: 0)
  int tgtExpiredTime;

  @JsonKey(name: "role", defaultValue: "")
  String role;

  @JsonKey(name: "openid", defaultValue: "")
  String openid;

  @JsonKey(name: "nickname", defaultValue: "")
  String nickname;

  @JsonKey(name: "fullname", defaultValue: "")
  String fullname;

  @JsonKey(name: "username", defaultValue: "")
  String username;

  @JsonKey(name: "mobile", defaultValue: "")
  String mobile;

  @JsonKey(name: "email", defaultValue: "")
  String email;

  @JsonKey(name: "perms", defaultValue: "")
  String perms;

  @JsonKey(name: "isSsoLogin", defaultValue: "")
  String isSsoLogin;

  @JsonKey(name: "isCompleted", defaultValue: "")
  String isCompleted;

  @JsonKey(name: "openidHash", defaultValue: "")
  String openidHash;

  @JsonKey(name: "jwt", defaultValue: "")
  String jwt;

  @JsonKey(name: "rt", defaultValue: "")
  String rt;

  @JsonKey(name: "createTime", defaultValue: "")
  String createTime;

  @JsonKey(name: "status", defaultValue: 0)
  int status;

  @JsonKey(name: "source", defaultValue: "")
  String source;

  @JsonKey(name: "links", defaultValue: [])
  List<Links> links;


  factory Rs.fromJson(Map<String, dynamic> json) => _$RsFromJson(json);
  
  Map<String, dynamic> toJson() => _$RsToJson(this);
  
  factory Rs.emptyInstance() => Rs(grantingTicket: "", serviceTicket: "", tgtExpiredTime: 0, role: "", openid: "", nickname: "", fullname: "", username: "", mobile: "", email: "", perms: "", isSsoLogin: "", isCompleted: "", openidHash: "", jwt: "", rt: "", createTime: "", status: 0, source: "", links: []);
}


