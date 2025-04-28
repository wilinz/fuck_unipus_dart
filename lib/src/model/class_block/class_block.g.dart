// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_block.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$ClassBlockAutoequal on ClassBlock {
  List<Object?> get _$props => [
    className,
    dateRange,
    startDate,
    endDate,
    courses,
  ];
}

extension _$CoursesItemAutoequal on CoursesItem {
  List<Object?> get _$props => [
    courseName,
    status,
    image,
    courseUrl,
    tutorialId,
  ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClassBlockCWProxy {
  ClassBlock className(String className);

  ClassBlock dateRange(String dateRange);

  ClassBlock startDate(String startDate);

  ClassBlock endDate(String endDate);

  ClassBlock courses(List<CoursesItem> courses);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClassBlock(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClassBlock(...).copyWith(id: 12, name: "My name")
  /// ````
  ClassBlock call({
    String className,
    String dateRange,
    String startDate,
    String endDate,
    List<CoursesItem> courses,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClassBlock.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClassBlock.copyWith.fieldName(...)`
class _$ClassBlockCWProxyImpl implements _$ClassBlockCWProxy {
  const _$ClassBlockCWProxyImpl(this._value);

  final ClassBlock _value;

  @override
  ClassBlock className(String className) => this(className: className);

  @override
  ClassBlock dateRange(String dateRange) => this(dateRange: dateRange);

  @override
  ClassBlock startDate(String startDate) => this(startDate: startDate);

  @override
  ClassBlock endDate(String endDate) => this(endDate: endDate);

  @override
  ClassBlock courses(List<CoursesItem> courses) => this(courses: courses);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClassBlock(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClassBlock(...).copyWith(id: 12, name: "My name")
  /// ````
  ClassBlock call({
    Object? className = const $CopyWithPlaceholder(),
    Object? dateRange = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? courses = const $CopyWithPlaceholder(),
  }) {
    return ClassBlock(
      className:
          className == const $CopyWithPlaceholder()
              ? _value.className
              // ignore: cast_nullable_to_non_nullable
              : className as String,
      dateRange:
          dateRange == const $CopyWithPlaceholder()
              ? _value.dateRange
              // ignore: cast_nullable_to_non_nullable
              : dateRange as String,
      startDate:
          startDate == const $CopyWithPlaceholder()
              ? _value.startDate
              // ignore: cast_nullable_to_non_nullable
              : startDate as String,
      endDate:
          endDate == const $CopyWithPlaceholder()
              ? _value.endDate
              // ignore: cast_nullable_to_non_nullable
              : endDate as String,
      courses:
          courses == const $CopyWithPlaceholder()
              ? _value.courses
              // ignore: cast_nullable_to_non_nullable
              : courses as List<CoursesItem>,
    );
  }
}

extension $ClassBlockCopyWith on ClassBlock {
  /// Returns a callable class that can be used as follows: `instanceOfClassBlock.copyWith(...)` or like so:`instanceOfClassBlock.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClassBlockCWProxy get copyWith => _$ClassBlockCWProxyImpl(this);
}

abstract class _$CoursesItemCWProxy {
  CoursesItem courseName(String? courseName);

  CoursesItem status(String status);

  CoursesItem image(String image);

  CoursesItem courseUrl(String? courseUrl);

  CoursesItem tutorialId(String? tutorialId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CoursesItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CoursesItem(...).copyWith(id: 12, name: "My name")
  /// ````
  CoursesItem call({
    String? courseName,
    String status,
    String image,
    String? courseUrl,
    String? tutorialId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCoursesItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCoursesItem.copyWith.fieldName(...)`
class _$CoursesItemCWProxyImpl implements _$CoursesItemCWProxy {
  const _$CoursesItemCWProxyImpl(this._value);

  final CoursesItem _value;

  @override
  CoursesItem courseName(String? courseName) => this(courseName: courseName);

  @override
  CoursesItem status(String status) => this(status: status);

  @override
  CoursesItem image(String image) => this(image: image);

  @override
  CoursesItem courseUrl(String? courseUrl) => this(courseUrl: courseUrl);

  @override
  CoursesItem tutorialId(String? tutorialId) => this(tutorialId: tutorialId);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CoursesItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CoursesItem(...).copyWith(id: 12, name: "My name")
  /// ````
  CoursesItem call({
    Object? courseName = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? image = const $CopyWithPlaceholder(),
    Object? courseUrl = const $CopyWithPlaceholder(),
    Object? tutorialId = const $CopyWithPlaceholder(),
  }) {
    return CoursesItem(
      courseName:
          courseName == const $CopyWithPlaceholder()
              ? _value.courseName
              // ignore: cast_nullable_to_non_nullable
              : courseName as String?,
      status:
          status == const $CopyWithPlaceholder()
              ? _value.status
              // ignore: cast_nullable_to_non_nullable
              : status as String,
      image:
          image == const $CopyWithPlaceholder()
              ? _value.image
              // ignore: cast_nullable_to_non_nullable
              : image as String,
      courseUrl:
          courseUrl == const $CopyWithPlaceholder()
              ? _value.courseUrl
              // ignore: cast_nullable_to_non_nullable
              : courseUrl as String?,
      tutorialId:
          tutorialId == const $CopyWithPlaceholder()
              ? _value.tutorialId
              // ignore: cast_nullable_to_non_nullable
              : tutorialId as String?,
    );
  }
}

extension $CoursesItemCopyWith on CoursesItem {
  /// Returns a callable class that can be used as follows: `instanceOfCoursesItem.copyWith(...)` or like so:`instanceOfCoursesItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CoursesItemCWProxy get copyWith => _$CoursesItemCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassBlock _$ClassBlockFromJson(Map<String, dynamic> json) => ClassBlock(
  className: json['class_name'] as String? ?? '',
  dateRange: json['date_range'] as String? ?? '',
  startDate: json['start_date'] as String? ?? '',
  endDate: json['end_date'] as String? ?? '',
  courses:
      (json['courses'] as List<dynamic>?)
          ?.map((e) => CoursesItem.fromJson(e as Map<String, dynamic>))
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

CoursesItem _$CoursesItemFromJson(Map<String, dynamic> json) => CoursesItem(
  courseName: json['course_name'] as String?,
  status: json['status'] as String? ?? '',
  image: json['image'] as String? ?? '',
  courseUrl: json['course_url'] as String?,
  tutorialId: json['tutorial_id'] as String?,
);

Map<String, dynamic> _$CoursesItemToJson(CoursesItem instance) =>
    <String, dynamic>{
      'course_name': instance.courseName,
      'status': instance.status,
      'image': instance.image,
      'course_url': instance.courseUrl,
      'tutorial_id': instance.tutorialId,
    };
