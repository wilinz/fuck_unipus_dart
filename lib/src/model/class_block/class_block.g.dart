// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassBlock _$ClassBlockFromJson(Map<String, dynamic> json) => ClassBlock(
      className: json['class_name'] as String? ?? '',
      dateRange: json['date_range'] as String? ?? '',
      startDate: json['start_date'] as String? ?? '',
      endDate: json['end_date'] as String? ?? '',
      courses: (json['courses'] as List<dynamic>?)
              ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ClassBlockToJson(ClassBlock instance) =>
    <String, dynamic>{
      'class_name': instance.className,
      'date_range': instance.dateRange,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'courses': instance.courses.map((e) => e.toJson()).toList(),
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      courseName: json['course_name'] as String? ?? '',
      status: json['status'] as String? ?? '',
      image: json['image'] as String? ?? '',
      courseUrl: json['course_url'] as String? ?? '',
      tutorialId: json['tutorial_id'] as String? ?? '',
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'course_name': instance.courseName,
      'status': instance.status,
      'image': instance.image,
      'course_url': instance.courseUrl,
      'tutorial_id': instance.tutorialId,
    };
