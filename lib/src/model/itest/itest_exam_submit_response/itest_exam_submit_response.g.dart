// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itest_exam_submit_response.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$ItestExamSubmitResponseAutoequal on ItestExamSubmitResponse {
  List<Object?> get _$props => [msg, code, data, unNoticeList];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ItestExamSubmitResponseCWProxy {
  ItestExamSubmitResponse msg(String msg);

  ItestExamSubmitResponse code(int code);

  ItestExamSubmitResponse data(String data);

  ItestExamSubmitResponse unNoticeList(List<dynamic> unNoticeList);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItestExamSubmitResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItestExamSubmitResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  ItestExamSubmitResponse call({
    String msg,
    int code,
    String data,
    List<dynamic> unNoticeList,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfItestExamSubmitResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfItestExamSubmitResponse.copyWith.fieldName(...)`
class _$ItestExamSubmitResponseCWProxyImpl
    implements _$ItestExamSubmitResponseCWProxy {
  const _$ItestExamSubmitResponseCWProxyImpl(this._value);

  final ItestExamSubmitResponse _value;

  @override
  ItestExamSubmitResponse msg(String msg) => this(msg: msg);

  @override
  ItestExamSubmitResponse code(int code) => this(code: code);

  @override
  ItestExamSubmitResponse data(String data) => this(data: data);

  @override
  ItestExamSubmitResponse unNoticeList(List<dynamic> unNoticeList) =>
      this(unNoticeList: unNoticeList);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItestExamSubmitResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItestExamSubmitResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  ItestExamSubmitResponse call({
    Object? msg = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? unNoticeList = const $CopyWithPlaceholder(),
  }) {
    return ItestExamSubmitResponse(
      msg:
          msg == const $CopyWithPlaceholder()
              ? _value.msg
              // ignore: cast_nullable_to_non_nullable
              : msg as String,
      code:
          code == const $CopyWithPlaceholder()
              ? _value.code
              // ignore: cast_nullable_to_non_nullable
              : code as int,
      data:
          data == const $CopyWithPlaceholder()
              ? _value.data
              // ignore: cast_nullable_to_non_nullable
              : data as String,
      unNoticeList:
          unNoticeList == const $CopyWithPlaceholder()
              ? _value.unNoticeList
              // ignore: cast_nullable_to_non_nullable
              : unNoticeList as List<dynamic>,
    );
  }
}

extension $ItestExamSubmitResponseCopyWith on ItestExamSubmitResponse {
  /// Returns a callable class that can be used as follows: `instanceOfItestExamSubmitResponse.copyWith(...)` or like so:`instanceOfItestExamSubmitResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ItestExamSubmitResponseCWProxy get copyWith =>
      _$ItestExamSubmitResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItestExamSubmitResponse _$ItestExamSubmitResponseFromJson(
  Map<String, dynamic> json,
) => ItestExamSubmitResponse(
  msg: json['msg'] as String? ?? '',
  code: (json['code'] as num?)?.toInt() ?? 0,
  data: json['data'] as String? ?? '',
  unNoticeList: json['unNoticeList'] as List<dynamic>? ?? [],
);

Map<String, dynamic> _$ItestExamSubmitResponseToJson(
  ItestExamSubmitResponse instance,
) => <String, dynamic>{
  'msg': instance.msg,
  'code': instance.code,
  'data': instance.data,
  'unNoticeList': instance.unNoticeList,
};
