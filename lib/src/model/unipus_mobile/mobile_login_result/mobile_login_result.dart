import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable_annotations/equatable_annotations.dart';

part 'mobile_login_result.g.dart';

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class MobileLoginResult with EquatableMixin {

  MobileLoginResult(
      {required this.news,
      required this.currentTime,
      required this.success,
      required this.code,
      required this.msg,
      required this.rs});

  @JsonKey(name: "news", defaultValue: MobileLoginResultNews.emptyInstance)
  final MobileLoginResultNews news;

  @JsonKey(name: "currentTime", defaultValue: 0)
  final int currentTime;

  @JsonKey(name: "success", defaultValue: false)
  final bool success;

  @JsonKey(name: "code", defaultValue: 0)
  final int code;

  @JsonKey(name: "msg", defaultValue: "")
  final String msg;

  @JsonKey(name: "rs", defaultValue: MobileLoginResultRs.emptyInstance)
  final MobileLoginResultRs rs;


  factory MobileLoginResult.fromJson(Map<String, dynamic> json) => _$MobileLoginResultFromJson(json);
  
  Map<String, dynamic> toJson() => _$MobileLoginResultToJson(this);
  
  factory MobileLoginResult.emptyInstance() => MobileLoginResult(news: MobileLoginResultNews.emptyInstance(), currentTime: 0, success: false, code: 0, msg: "", rs: MobileLoginResultRs.emptyInstance());
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class MobileLoginResultN with EquatableMixin {

  MobileLoginResultN(
      {required this.sch,
      required this.cls,
      required this.sys});

  @JsonKey(name: "sch", defaultValue: false)
  final bool sch;

  @JsonKey(name: "cls", defaultValue: false)
  final bool cls;

  @JsonKey(name: "sys", defaultValue: false)
  final bool sys;


  factory MobileLoginResultN.fromJson(Map<String, dynamic> json) => _$MobileLoginResultNFromJson(json);
  
  Map<String, dynamic> toJson() => _$MobileLoginResultNToJson(this);
  
  factory MobileLoginResultN.emptyInstance() => MobileLoginResultN(sch: false, cls: false, sys: false);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class MobileLoginResultNews with EquatableMixin {

  MobileLoginResultNews(
      {required this.d,
      required this.n,
      required this.i,
      required this.e});

  @JsonKey(name: "d", defaultValue: false)
  final bool d;

  @JsonKey(name: "n", defaultValue: MobileLoginResultN.emptyInstance)
  final MobileLoginResultN n;

  @JsonKey(name: "i", defaultValue: false)
  final bool i;

  @JsonKey(name: "e", defaultValue: false)
  final bool e;


  factory MobileLoginResultNews.fromJson(Map<String, dynamic> json) => _$MobileLoginResultNewsFromJson(json);
  
  Map<String, dynamic> toJson() => _$MobileLoginResultNewsToJson(this);
  
  factory MobileLoginResultNews.emptyInstance() => MobileLoginResultNews(d: false, n: MobileLoginResultN.emptyInstance(), i: false, e: false);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class MobileLoginResultUserInfo with EquatableMixin {

  MobileLoginResultUserInfo(
      {required this.openid,
      required this.username,
      required this.nickname,
      required this.mobile,
      required this.uid,
      required this.gender,
      required this.schoolId,
      required this.schoolName,
      required this.grade,
      required this.numX,
      required this.name,
      required this.realName,
      required this.useMode,
      required this.role,
      required this.token,
      required this.ssxSystem,
      required this.gyUid,
      required this.zjUid});

  @JsonKey(name: "openid", defaultValue: "")
  final String openid;

  @JsonKey(name: "username", defaultValue: "")
  final String username;

  @JsonKey(name: "nickname", defaultValue: "")
  final String nickname;

  @JsonKey(name: "mobile", defaultValue: "")
  final String mobile;

  @JsonKey(name: "uid", defaultValue: 0)
  final int uid;

  @JsonKey(name: "gender", defaultValue: 0)
  final int gender;

  @JsonKey(name: "schoolId", defaultValue: 0)
  final int schoolId;

  @JsonKey(name: "schoolName", defaultValue: "")
  final String schoolName;

  @JsonKey(name: "grade", defaultValue: "")
  final String grade;

  @JsonKey(name: "num", defaultValue: "")
  final String numX;

  @JsonKey(name: "name", defaultValue: "")
  final String name;

  @JsonKey(name: "realName", defaultValue: "")
  final String realName;

  @JsonKey(name: "useMode", defaultValue: 0)
  final int useMode;

  @JsonKey(name: "role", defaultValue: 0)
  final int role;

  @JsonKey(name: "token", defaultValue: "")
  final String token;

  @JsonKey(name: "ssxSystem", defaultValue: "")
  final String ssxSystem;

  @JsonKey(name: "gyUid", defaultValue: 0)
  final int gyUid;

  @JsonKey(name: "zjUid", defaultValue: 0)
  final int zjUid;


  factory MobileLoginResultUserInfo.fromJson(Map<String, dynamic> json) => _$MobileLoginResultUserInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$MobileLoginResultUserInfoToJson(this);
  
  factory MobileLoginResultUserInfo.emptyInstance() => MobileLoginResultUserInfo(openid: "", username: "", nickname: "", mobile: "", uid: 0, gender: 0, schoolId: 0, schoolName: "", grade: "", numX: "", name: "", realName: "", useMode: 0, role: 0, token: "", ssxSystem: "", gyUid: 0, zjUid: 0);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class MobileLoginResultRs with EquatableMixin {

  MobileLoginResultRs(
      {required this.userInfo});

  @JsonKey(name: "user_info", defaultValue: MobileLoginResultUserInfo.emptyInstance)
  final MobileLoginResultUserInfo userInfo;


  factory MobileLoginResultRs.fromJson(Map<String, dynamic> json) => _$MobileLoginResultRsFromJson(json);
  
  Map<String, dynamic> toJson() => _$MobileLoginResultRsToJson(this);
  
  factory MobileLoginResultRs.emptyInstance() => MobileLoginResultRs(userInfo: MobileLoginResultUserInfo.emptyInstance());
  
  @override
  List<Object?> get props => _$props;
}


