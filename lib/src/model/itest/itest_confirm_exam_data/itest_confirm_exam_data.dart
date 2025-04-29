import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:autoequal/autoequal.dart';

part 'itest_confirm_exam_data.g.dart';

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class ItestConfirmExamData with EquatableMixin {

  ItestConfirmExamData(
      {required this.examName,
      required this.username,
      required this.realName,
      required this.schoolName,
      required this.facultyName,
      required this.gradeName,
      required this.clsNames,
      required this.hasRecord,
      required this.capture,
      required this.hasRecognize,
      required this.itestStudentUrl,
      required this.rtcFlag,
      required this.rtcRecord,
      required this.prepareBroadcast,
      required this.kcId,
      required this.sppid,
      required this.dataSource,
      required this.dataType,
      required this.dataUser,
      required this.openId});

  @JsonKey(name: "examName", defaultValue: "")
  final String examName;

  @JsonKey(name: "username", defaultValue: "")
  final String username;

  @JsonKey(name: "realName", defaultValue: "")
  final String realName;

  @JsonKey(name: "schoolName", defaultValue: "")
  final String schoolName;

  @JsonKey(name: "facultyName", defaultValue: "")
  final String facultyName;

  @JsonKey(name: "gradeName", defaultValue: "")
  final String gradeName;

  @JsonKey(name: "clsNames", defaultValue: "")
  final String clsNames;

  @JsonKey(name: "hasRecord", defaultValue: "")
  final String hasRecord;

  @JsonKey(name: "capture", defaultValue: "")
  final String capture;

  @JsonKey(name: "hasRecognize", defaultValue: "")
  final String hasRecognize;

  @JsonKey(name: "itestStudentUrl", defaultValue: "")
  final String itestStudentUrl;

  @JsonKey(name: "rtcFlag", defaultValue: "")
  final String rtcFlag;

  @JsonKey(name: "rtcRecord", defaultValue: "")
  final String rtcRecord;

  @JsonKey(name: "prepareBroadcast", defaultValue: "")
  final String prepareBroadcast;

  @JsonKey(name: "kcId", defaultValue: "")
  final String kcId;

  @JsonKey(name: "sppid", defaultValue: "")
  final String sppid;

  @JsonKey(name: "dataSource", defaultValue: "")
  final String dataSource;

  @JsonKey(name: "dataType", defaultValue: "")
  final String dataType;

  @JsonKey(name: "dataUser", defaultValue: "")
  final String dataUser;

  @JsonKey(name: "openId", defaultValue: "")
  final String openId;


  factory ItestConfirmExamData.fromJson(Map<String, dynamic> json) => _$ItestConfirmExamDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestConfirmExamDataToJson(this);
  
  factory ItestConfirmExamData.emptyInstance() => ItestConfirmExamData(examName: "", username: "", realName: "", schoolName: "", facultyName: "", gradeName: "", clsNames: "", hasRecord: "", capture: "", hasRecognize: "", itestStudentUrl: "", rtcFlag: "", rtcRecord: "", prepareBroadcast: "", kcId: "", sppid: "", dataSource: "", dataType: "", dataUser: "", openId: "");
  
  @override
  List<Object?> get props => _$props;
}


