// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itest_exam_wait_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ItestExamWaitResponseCWProxy {
  ItestExamWaitResponse code(int code);

  ItestExamWaitResponse msg(String msg);

  ItestExamWaitResponse rs(ItestExamWaitRs rs);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItestExamWaitResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItestExamWaitResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  ItestExamWaitResponse call({int code, String msg, ItestExamWaitRs rs});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfItestExamWaitResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfItestExamWaitResponse.copyWith.fieldName(...)`
class _$ItestExamWaitResponseCWProxyImpl
    implements _$ItestExamWaitResponseCWProxy {
  const _$ItestExamWaitResponseCWProxyImpl(this._value);

  final ItestExamWaitResponse _value;

  @override
  ItestExamWaitResponse code(int code) => this(code: code);

  @override
  ItestExamWaitResponse msg(String msg) => this(msg: msg);

  @override
  ItestExamWaitResponse rs(ItestExamWaitRs rs) => this(rs: rs);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItestExamWaitResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItestExamWaitResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  ItestExamWaitResponse call({
    Object? code = const $CopyWithPlaceholder(),
    Object? msg = const $CopyWithPlaceholder(),
    Object? rs = const $CopyWithPlaceholder(),
  }) {
    return ItestExamWaitResponse(
      code:
          code == const $CopyWithPlaceholder()
              ? _value.code
              // ignore: cast_nullable_to_non_nullable
              : code as int,
      msg:
          msg == const $CopyWithPlaceholder()
              ? _value.msg
              // ignore: cast_nullable_to_non_nullable
              : msg as String,
      rs:
          rs == const $CopyWithPlaceholder()
              ? _value.rs
              // ignore: cast_nullable_to_non_nullable
              : rs as ItestExamWaitRs,
    );
  }
}

extension $ItestExamWaitResponseCopyWith on ItestExamWaitResponse {
  /// Returns a callable class that can be used as follows: `instanceOfItestExamWaitResponse.copyWith(...)` or like so:`instanceOfItestExamWaitResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ItestExamWaitResponseCWProxy get copyWith =>
      _$ItestExamWaitResponseCWProxyImpl(this);
}

abstract class _$ItestExamWaitRsCWProxy {
  ItestExamWaitRs waitingTime(int waitingTime);

  ItestExamWaitRs isExpire(int isExpire);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItestExamWaitRs(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItestExamWaitRs(...).copyWith(id: 12, name: "My name")
  /// ````
  ItestExamWaitRs call({int waitingTime, int isExpire});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfItestExamWaitRs.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfItestExamWaitRs.copyWith.fieldName(...)`
class _$ItestExamWaitRsCWProxyImpl implements _$ItestExamWaitRsCWProxy {
  const _$ItestExamWaitRsCWProxyImpl(this._value);

  final ItestExamWaitRs _value;

  @override
  ItestExamWaitRs waitingTime(int waitingTime) =>
      this(waitingTime: waitingTime);

  @override
  ItestExamWaitRs isExpire(int isExpire) => this(isExpire: isExpire);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItestExamWaitRs(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItestExamWaitRs(...).copyWith(id: 12, name: "My name")
  /// ````
  ItestExamWaitRs call({
    Object? waitingTime = const $CopyWithPlaceholder(),
    Object? isExpire = const $CopyWithPlaceholder(),
  }) {
    return ItestExamWaitRs(
      waitingTime:
          waitingTime == const $CopyWithPlaceholder()
              ? _value.waitingTime
              // ignore: cast_nullable_to_non_nullable
              : waitingTime as int,
      isExpire:
          isExpire == const $CopyWithPlaceholder()
              ? _value.isExpire
              // ignore: cast_nullable_to_non_nullable
              : isExpire as int,
    );
  }
}

extension $ItestExamWaitRsCopyWith on ItestExamWaitRs {
  /// Returns a callable class that can be used as follows: `instanceOfItestExamWaitRs.copyWith(...)` or like so:`instanceOfItestExamWaitRs.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ItestExamWaitRsCWProxy get copyWith => _$ItestExamWaitRsCWProxyImpl(this);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$ItestExamWaitResponseEquatableAnnotations on ItestExamWaitResponse {
  List<Object?> get _$props => [code, msg, rs];
}

extension _$ItestExamWaitRsEquatableAnnotations on ItestExamWaitRs {
  List<Object?> get _$props => [waitingTime, isExpire];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItestExamWaitResponse _$ItestExamWaitResponseFromJson(
  Map<String, dynamic> json,
) => ItestExamWaitResponse(
  code: (json['code'] as num?)?.toInt() ?? 0,
  msg: json['msg'] as String? ?? '',
  rs:
      json['rs'] == null
          ? ItestExamWaitRs.emptyInstance()
          : ItestExamWaitRs.fromJson(json['rs'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItestExamWaitResponseToJson(
  ItestExamWaitResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'msg': instance.msg,
  'rs': instance.rs.toJson(),
};

ItestExamWaitRs _$ItestExamWaitRsFromJson(Map<String, dynamic> json) =>
    ItestExamWaitRs(
      waitingTime: (json['waitingTime'] as num?)?.toInt() ?? 0,
      isExpire: (json['isExpire'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ItestExamWaitRsToJson(ItestExamWaitRs instance) =>
    <String, dynamic>{
      'waitingTime': instance.waitingTime,
      'isExpire': instance.isExpire,
    };
