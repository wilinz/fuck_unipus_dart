import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:autoequal/autoequal.dart';

part 'class_block.g.dart';

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class ClassBlock with EquatableMixin {

  ClassBlock(
      {required this.className,
      required this.dateRange,
      required this.startDate,
      required this.endDate,
      required this.courses});

  @JsonKey(name: "class_name", defaultValue: "")
  final String className;

  @JsonKey(name: "date_range", defaultValue: "")
  final String dateRange;

  @JsonKey(name: "start_date", defaultValue: "")
  final String startDate;

  @JsonKey(name: "end_date", defaultValue: "")
  final String endDate;

  @JsonKey(name: "courses", defaultValue: [])
  final List<CoursesItem> courses;


  factory ClassBlock.fromJson(Map<String, dynamic> json) => _$ClassBlockFromJson(json);
  
  Map<String, dynamic> toJson() => _$ClassBlockToJson(this);
  
  factory ClassBlock.emptyInstance() => ClassBlock(className: "", dateRange: "", startDate: "", endDate: "", courses: []);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class CoursesItem with EquatableMixin {

  CoursesItem(
      {this.courseName,
      required this.status,
      required this.image,
      this.courseUrl,
      this.tutorialId});

  @JsonKey(name: "course_name")
  final String? courseName;

  @JsonKey(name: "status", defaultValue: "")
  final String status;

  @JsonKey(name: "image", defaultValue: "")
  final String image;

  @JsonKey(name: "course_url")
  final String? courseUrl;

  @JsonKey(name: "tutorial_id")
  final String? tutorialId;


  factory CoursesItem.fromJson(Map<String, dynamic> json) => _$CoursesItemFromJson(json);
  
  Map<String, dynamic> toJson() => _$CoursesItemToJson(this);
  
  factory CoursesItem.emptyInstance() => CoursesItem(status: "", image: "");
  
  @override
  List<Object?> get props => _$props;
}


