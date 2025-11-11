import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable_annotations/equatable_annotations.dart';

part 'mobile_course_class_list.g.dart';

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class MobileCourseClassList with EquatableMixin {

  MobileCourseClassList(
      {required this.news,
      required this.currentTime,
      required this.success,
      required this.code,
      required this.msg,
      required this.rs});

  @JsonKey(name: "news", defaultValue: MobileCourseClassListNews.emptyInstance)
  final MobileCourseClassListNews news;

  @JsonKey(name: "currentTime", defaultValue: 0)
  final int currentTime;

  @JsonKey(name: "success", defaultValue: false)
  final bool success;

  @JsonKey(name: "code", defaultValue: 0)
  final int code;

  @JsonKey(name: "msg", defaultValue: "")
  final String msg;

  @JsonKey(name: "rs", defaultValue: MobileCourseClassListRs.emptyInstance)
  final MobileCourseClassListRs rs;


  factory MobileCourseClassList.fromJson(Map<String, dynamic> json) => _$MobileCourseClassListFromJson(json);
  
  Map<String, dynamic> toJson() => _$MobileCourseClassListToJson(this);
  
  factory MobileCourseClassList.emptyInstance() => MobileCourseClassList(news: MobileCourseClassListNews.emptyInstance(), currentTime: 0, success: false, code: 0, msg: "", rs: MobileCourseClassListRs.emptyInstance());
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class MobileCourseClassListN with EquatableMixin {

  MobileCourseClassListN(
      {required this.sch,
      required this.cls,
      required this.sys});

  @JsonKey(name: "sch", defaultValue: false)
  final bool sch;

  @JsonKey(name: "cls", defaultValue: false)
  final bool cls;

  @JsonKey(name: "sys", defaultValue: false)
  final bool sys;


  factory MobileCourseClassListN.fromJson(Map<String, dynamic> json) => _$MobileCourseClassListNFromJson(json);
  
  Map<String, dynamic> toJson() => _$MobileCourseClassListNToJson(this);
  
  factory MobileCourseClassListN.emptyInstance() => MobileCourseClassListN(sch: false, cls: false, sys: false);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class MobileCourseClassListNews with EquatableMixin {

  MobileCourseClassListNews(
      {required this.d,
      required this.n,
      required this.i,
      required this.e});

  @JsonKey(name: "d", defaultValue: false)
  final bool d;

  @JsonKey(name: "n", defaultValue: MobileCourseClassListN.emptyInstance)
  final MobileCourseClassListN n;

  @JsonKey(name: "i", defaultValue: false)
  final bool i;

  @JsonKey(name: "e", defaultValue: false)
  final bool e;


  factory MobileCourseClassListNews.fromJson(Map<String, dynamic> json) => _$MobileCourseClassListNewsFromJson(json);
  
  Map<String, dynamic> toJson() => _$MobileCourseClassListNewsToJson(this);
  
  factory MobileCourseClassListNews.emptyInstance() => MobileCourseClassListNews(d: false, n: MobileCourseClassListN.emptyInstance(), i: false, e: false);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class MobileCourseClassListTutorialsItem with EquatableMixin {

  MobileCourseClassListTutorialsItem(
      {required this.tutorialId,
      required this.realTutorialId,
      required this.tutorialName,
      required this.pic,
      required this.tutorialType,
      required this.tutorialVersion,
      required this.kind,
      required this.updateTime,
      required this.courseVersion,
      required this.teacherId,
      required this.activation,
      required this.status,
      required this.tutorialDetail,
      required this.courseSeries,
      required this.seriesTemplate,
      required this.coverImageUrl});

  @JsonKey(name: "tutorialId", defaultValue: 0)
  final int tutorialId;

  @JsonKey(name: "realTutorialId", defaultValue: "")
  final String realTutorialId;

  @JsonKey(name: "tutorialName", defaultValue: "")
  final String tutorialName;

  @JsonKey(name: "pic", defaultValue: "")
  final String pic;

  @JsonKey(name: "tutorialType", defaultValue: "")
  final String tutorialType;

  @JsonKey(name: "tutorialVersion", defaultValue: "")
  final String tutorialVersion;

  @JsonKey(name: "kind", defaultValue: 0)
  final int kind;

  @JsonKey(name: "updateTime", defaultValue: 0)
  final int updateTime;

  @JsonKey(name: "courseVersion", defaultValue: "")
  final String courseVersion;

  @JsonKey(name: "teacherId", defaultValue: 0)
  final int teacherId;

  @JsonKey(name: "activation", defaultValue: 0)
  final int activation;

  @JsonKey(name: "status", defaultValue: 0)
  final int status;

  @JsonKey(name: "tutorialDetail", defaultValue: "")
  final String tutorialDetail;

  @JsonKey(name: "courseSeries", defaultValue: "")
  final String courseSeries;

  @JsonKey(name: "seriesTemplate", defaultValue: "")
  final String seriesTemplate;

  @JsonKey(name: "coverImageUrl", defaultValue: "")
  final String coverImageUrl;


  factory MobileCourseClassListTutorialsItem.fromJson(Map<String, dynamic> json) => _$MobileCourseClassListTutorialsItemFromJson(json);
  
  Map<String, dynamic> toJson() => _$MobileCourseClassListTutorialsItemToJson(this);
  
  factory MobileCourseClassListTutorialsItem.emptyInstance() => MobileCourseClassListTutorialsItem(tutorialId: 0, realTutorialId: "", tutorialName: "", pic: "", tutorialType: "", tutorialVersion: "", kind: 0, updateTime: 0, courseVersion: "", teacherId: 0, activation: 0, status: 0, tutorialDetail: "", courseSeries: "", seriesTemplate: "", coverImageUrl: "");
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class MobileCourseClassListCourseClassListItem with EquatableMixin {

  MobileCourseClassListCourseClassListItem(
      {required this.classId,
      required this.className,
      required this.automaticGeneration,
      required this.curriculaId,
      required this.curriculaName,
      required this.name,
      required this.semester,
      required this.tutorials});

  @JsonKey(name: "classId", defaultValue: 0)
  final int classId;

  @JsonKey(name: "className", defaultValue: "")
  final String className;

  @JsonKey(name: "automaticGeneration", defaultValue: 0)
  final int automaticGeneration;

  @JsonKey(name: "curriculaId", defaultValue: 0)
  final int curriculaId;

  @JsonKey(name: "curriculaName", defaultValue: "")
  final String curriculaName;

  @JsonKey(name: "name", defaultValue: "")
  final String name;

  @JsonKey(name: "semester", defaultValue: "")
  final String semester;

  @JsonKey(name: "tutorials", defaultValue: [])
  final List<MobileCourseClassListTutorialsItem> tutorials;


  factory MobileCourseClassListCourseClassListItem.fromJson(Map<String, dynamic> json) => _$MobileCourseClassListCourseClassListItemFromJson(json);
  
  Map<String, dynamic> toJson() => _$MobileCourseClassListCourseClassListItemToJson(this);
  
  factory MobileCourseClassListCourseClassListItem.emptyInstance() => MobileCourseClassListCourseClassListItem(classId: 0, className: "", automaticGeneration: 0, curriculaId: 0, curriculaName: "", name: "", semester: "", tutorials: []);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class MobileCourseClassListRs with EquatableMixin {

  MobileCourseClassListRs(
      {required this.courseClassList});

  @JsonKey(name: "courseClassList", defaultValue: [])
  final List<MobileCourseClassListCourseClassListItem> courseClassList;


  factory MobileCourseClassListRs.fromJson(Map<String, dynamic> json) => _$MobileCourseClassListRsFromJson(json);
  
  Map<String, dynamic> toJson() => _$MobileCourseClassListRsToJson(this);
  
  factory MobileCourseClassListRs.emptyInstance() => MobileCourseClassListRs(courseClassList: []);
  
  @override
  List<Object?> get props => _$props;
}


