import 'package:json_annotation/json_annotation.dart';

part 'class_block.g.dart';

@JsonSerializable(explicitToJson: true)
class ClassBlock {

  ClassBlock(
      {required this.className,
      required this.dateRange,
      required this.startDate,
      required this.endDate,
      required this.courses});

  @JsonKey(name: "class_name", defaultValue: "")
  String className;

  @JsonKey(name: "date_range", defaultValue: "")
  String dateRange;

  @JsonKey(name: "start_date", defaultValue: "")
  String startDate;

  @JsonKey(name: "end_date", defaultValue: "")
  String endDate;

  @JsonKey(name: "courses", defaultValue: [])
  List<Course> courses;


  factory ClassBlock.fromJson(Map<String, dynamic> json) => _$ClassBlockFromJson(json);
  
  Map<String, dynamic> toJson() => _$ClassBlockToJson(this);
  
  factory ClassBlock.emptyInstance() => ClassBlock(className: "", dateRange: "", startDate: "", endDate: "", courses: []);
}

@JsonSerializable(explicitToJson: true)
class Course {

  Course(
      {required this.courseName,
      required this.status,
      required this.image,
      required this.courseUrl,
      required this.tutorialId});

  @JsonKey(name: "course_name", defaultValue: "")
  String courseName;

  @JsonKey(name: "status", defaultValue: "")
  String status;

  @JsonKey(name: "image", defaultValue: "")
  String image;

  @JsonKey(name: "course_url", defaultValue: "")
  String courseUrl;

  @JsonKey(name: "tutorial_id", defaultValue: "")
  String tutorialId;


  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  
  Map<String, dynamic> toJson() => _$CourseToJson(this);
  
  factory Course.emptyInstance() => Course(courseName: "", status: "", image: "", courseUrl: "", tutorialId: "");
}


