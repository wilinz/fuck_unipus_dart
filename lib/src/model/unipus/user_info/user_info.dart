import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable_annotations/equatable_annotations.dart';

part 'user_info.g.dart';

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class UserInfo with EquatableMixin {

  UserInfo(
      {required this.code,
      required this.currentTime,
      required this.message,
      required this.result,
      required this.success});

  @JsonKey(name: "code", defaultValue: 0)
  final int code;

  @JsonKey(name: "currentTime", defaultValue: 0)
  final int currentTime;

  @JsonKey(name: "message", defaultValue: "")
  final String message;

  @JsonKey(name: "result", defaultValue: UserInfoResult.emptyInstance)
  final UserInfoResult result;

  @JsonKey(name: "success", defaultValue: false)
  final bool success;


  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
  
  factory UserInfo.emptyInstance() => UserInfo(code: 0, currentTime: 0, message: "", result: UserInfoResult.emptyInstance(), success: false);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class UserInfoUser with EquatableMixin {

  UserInfoUser(
      {required this.bid,
      required this.deviceToken,
      required this.email,
      required this.gender,
      required this.grade,
      required this.mobile,
      required this.name,
      required this.nickname,
      required this.numX,
      required this.openid,
      required this.realName,
      required this.role,
      required this.schoolId,
      required this.schoolName,
      required this.uid,
      required this.useMode,
      required this.username});

  @JsonKey(name: "bid", defaultValue: 0)
  final int bid;

  @JsonKey(name: "deviceToken", defaultValue: "")
  final String deviceToken;

  @JsonKey(name: "email", defaultValue: "")
  final String email;

  @JsonKey(name: "gender", defaultValue: 0)
  final int gender;

  @JsonKey(name: "grade", defaultValue: "")
  final String grade;

  @JsonKey(name: "mobile", defaultValue: "")
  final String mobile;

  @JsonKey(name: "name", defaultValue: "")
  final String name;

  @JsonKey(name: "nickname", defaultValue: "")
  final String nickname;

  @JsonKey(name: "num", defaultValue: "")
  final String numX;

  @JsonKey(name: "openid", defaultValue: "")
  final String openid;

  @JsonKey(name: "realName", defaultValue: "")
  final String realName;

  @JsonKey(name: "role", defaultValue: 0)
  final int role;

  @JsonKey(name: "schoolId", defaultValue: 0)
  final int schoolId;

  @JsonKey(name: "schoolName", defaultValue: "")
  final String schoolName;

  @JsonKey(name: "uid", defaultValue: 0)
  final int uid;

  @JsonKey(name: "useMode", defaultValue: 0)
  final int useMode;

  @JsonKey(name: "username", defaultValue: "")
  final String username;


  factory UserInfoUser.fromJson(Map<String, dynamic> json) => _$UserInfoUserFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserInfoUserToJson(this);
  
  factory UserInfoUser.emptyInstance() => UserInfoUser(bid: 0, deviceToken: "", email: "", gender: 0, grade: "", mobile: "", name: "", nickname: "", numX: "", openid: "", realName: "", role: 0, schoolId: 0, schoolName: "", uid: 0, useMode: 0, username: "");
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class UserInfoSchool with EquatableMixin {

  UserInfoSchool(
      {required this.code,
      required this.dnsIp,
      required this.id,
      required this.level,
      required this.name,
      required this.openTime,
      required this.registerMode,
      required this.status,
      required this.useMode});

  @JsonKey(name: "code", defaultValue: "")
  final String code;

  @JsonKey(name: "dnsIp", defaultValue: "")
  final String dnsIp;

  @JsonKey(name: "id", defaultValue: 0)
  final int id;

  @JsonKey(name: "level", defaultValue: 0)
  final int level;

  @JsonKey(name: "name", defaultValue: "")
  final String name;

  @JsonKey(name: "openTime", defaultValue: 0)
  final int openTime;

  @JsonKey(name: "registerMode", defaultValue: 0)
  final int registerMode;

  @JsonKey(name: "status", defaultValue: 0)
  final int status;

  @JsonKey(name: "useMode", defaultValue: 0)
  final int useMode;


  factory UserInfoSchool.fromJson(Map<String, dynamic> json) => _$UserInfoSchoolFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserInfoSchoolToJson(this);
  
  factory UserInfoSchool.emptyInstance() => UserInfoSchool(code: "", dnsIp: "", id: 0, level: 0, name: "", openTime: 0, registerMode: 0, status: 0, useMode: 0);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class UserInfoResult with EquatableMixin {

  UserInfoResult(
      {required this.total,
      required this.role,
      required this.user,
      required this.school});

  @JsonKey(name: "total", defaultValue: 0)
  final int total;

  @JsonKey(name: "role", defaultValue: 0)
  final int role;

  @JsonKey(name: "user", defaultValue: UserInfoUser.emptyInstance)
  final UserInfoUser user;

  @JsonKey(name: "school", defaultValue: UserInfoSchool.emptyInstance)
  final UserInfoSchool school;


  factory UserInfoResult.fromJson(Map<String, dynamic> json) => _$UserInfoResultFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserInfoResultToJson(this);
  
  factory UserInfoResult.emptyInstance() => UserInfoResult(total: 0, role: 0, user: UserInfoUser.emptyInstance(), school: UserInfoSchool.emptyInstance());
  
  @override
  List<Object?> get props => _$props;
}


