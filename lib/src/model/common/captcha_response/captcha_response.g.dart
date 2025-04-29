// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'captcha_response.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$CaptchaResponseAutoequal on CaptchaResponse {
  List<Object?> get _$props => [code, msg, rs];
}

extension _$CaptchaLinksItemAutoequal on CaptchaLinksItem {
  List<Object?> get _$props => [rel, href];
}

extension _$CaptchaResultAutoequal on CaptchaResult {
  List<Object?> get _$props => [type, image, encodeCaptha, codeType, links];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CaptchaResponseCWProxy {
  CaptchaResponse code(String code);

  CaptchaResponse msg(String msg);

  CaptchaResponse rs(CaptchaResult rs);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CaptchaResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CaptchaResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  CaptchaResponse call({String code, String msg, CaptchaResult rs});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCaptchaResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCaptchaResponse.copyWith.fieldName(...)`
class _$CaptchaResponseCWProxyImpl implements _$CaptchaResponseCWProxy {
  const _$CaptchaResponseCWProxyImpl(this._value);

  final CaptchaResponse _value;

  @override
  CaptchaResponse code(String code) => this(code: code);

  @override
  CaptchaResponse msg(String msg) => this(msg: msg);

  @override
  CaptchaResponse rs(CaptchaResult rs) => this(rs: rs);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CaptchaResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CaptchaResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  CaptchaResponse call({
    Object? code = const $CopyWithPlaceholder(),
    Object? msg = const $CopyWithPlaceholder(),
    Object? rs = const $CopyWithPlaceholder(),
  }) {
    return CaptchaResponse(
      code:
          code == const $CopyWithPlaceholder()
              ? _value.code
              // ignore: cast_nullable_to_non_nullable
              : code as String,
      msg:
          msg == const $CopyWithPlaceholder()
              ? _value.msg
              // ignore: cast_nullable_to_non_nullable
              : msg as String,
      rs:
          rs == const $CopyWithPlaceholder()
              ? _value.rs
              // ignore: cast_nullable_to_non_nullable
              : rs as CaptchaResult,
    );
  }
}

extension $CaptchaResponseCopyWith on CaptchaResponse {
  /// Returns a callable class that can be used as follows: `instanceOfCaptchaResponse.copyWith(...)` or like so:`instanceOfCaptchaResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CaptchaResponseCWProxy get copyWith => _$CaptchaResponseCWProxyImpl(this);
}

abstract class _$CaptchaLinksItemCWProxy {
  CaptchaLinksItem rel(String rel);

  CaptchaLinksItem href(String href);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CaptchaLinksItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CaptchaLinksItem(...).copyWith(id: 12, name: "My name")
  /// ````
  CaptchaLinksItem call({String rel, String href});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCaptchaLinksItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCaptchaLinksItem.copyWith.fieldName(...)`
class _$CaptchaLinksItemCWProxyImpl implements _$CaptchaLinksItemCWProxy {
  const _$CaptchaLinksItemCWProxyImpl(this._value);

  final CaptchaLinksItem _value;

  @override
  CaptchaLinksItem rel(String rel) => this(rel: rel);

  @override
  CaptchaLinksItem href(String href) => this(href: href);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CaptchaLinksItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CaptchaLinksItem(...).copyWith(id: 12, name: "My name")
  /// ````
  CaptchaLinksItem call({
    Object? rel = const $CopyWithPlaceholder(),
    Object? href = const $CopyWithPlaceholder(),
  }) {
    return CaptchaLinksItem(
      rel:
          rel == const $CopyWithPlaceholder()
              ? _value.rel
              // ignore: cast_nullable_to_non_nullable
              : rel as String,
      href:
          href == const $CopyWithPlaceholder()
              ? _value.href
              // ignore: cast_nullable_to_non_nullable
              : href as String,
    );
  }
}

extension $CaptchaLinksItemCopyWith on CaptchaLinksItem {
  /// Returns a callable class that can be used as follows: `instanceOfCaptchaLinksItem.copyWith(...)` or like so:`instanceOfCaptchaLinksItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CaptchaLinksItemCWProxy get copyWith => _$CaptchaLinksItemCWProxyImpl(this);
}

abstract class _$CaptchaResultCWProxy {
  CaptchaResult type(String type);

  CaptchaResult image(String image);

  CaptchaResult encodeCaptha(String encodeCaptha);

  CaptchaResult codeType(int codeType);

  CaptchaResult links(List<CaptchaLinksItem> links);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CaptchaResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CaptchaResult(...).copyWith(id: 12, name: "My name")
  /// ````
  CaptchaResult call({
    String type,
    String image,
    String encodeCaptha,
    int codeType,
    List<CaptchaLinksItem> links,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCaptchaResult.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCaptchaResult.copyWith.fieldName(...)`
class _$CaptchaResultCWProxyImpl implements _$CaptchaResultCWProxy {
  const _$CaptchaResultCWProxyImpl(this._value);

  final CaptchaResult _value;

  @override
  CaptchaResult type(String type) => this(type: type);

  @override
  CaptchaResult image(String image) => this(image: image);

  @override
  CaptchaResult encodeCaptha(String encodeCaptha) =>
      this(encodeCaptha: encodeCaptha);

  @override
  CaptchaResult codeType(int codeType) => this(codeType: codeType);

  @override
  CaptchaResult links(List<CaptchaLinksItem> links) => this(links: links);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CaptchaResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CaptchaResult(...).copyWith(id: 12, name: "My name")
  /// ````
  CaptchaResult call({
    Object? type = const $CopyWithPlaceholder(),
    Object? image = const $CopyWithPlaceholder(),
    Object? encodeCaptha = const $CopyWithPlaceholder(),
    Object? codeType = const $CopyWithPlaceholder(),
    Object? links = const $CopyWithPlaceholder(),
  }) {
    return CaptchaResult(
      type:
          type == const $CopyWithPlaceholder()
              ? _value.type
              // ignore: cast_nullable_to_non_nullable
              : type as String,
      image:
          image == const $CopyWithPlaceholder()
              ? _value.image
              // ignore: cast_nullable_to_non_nullable
              : image as String,
      encodeCaptha:
          encodeCaptha == const $CopyWithPlaceholder()
              ? _value.encodeCaptha
              // ignore: cast_nullable_to_non_nullable
              : encodeCaptha as String,
      codeType:
          codeType == const $CopyWithPlaceholder()
              ? _value.codeType
              // ignore: cast_nullable_to_non_nullable
              : codeType as int,
      links:
          links == const $CopyWithPlaceholder()
              ? _value.links
              // ignore: cast_nullable_to_non_nullable
              : links as List<CaptchaLinksItem>,
    );
  }
}

extension $CaptchaResultCopyWith on CaptchaResult {
  /// Returns a callable class that can be used as follows: `instanceOfCaptchaResult.copyWith(...)` or like so:`instanceOfCaptchaResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CaptchaResultCWProxy get copyWith => _$CaptchaResultCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaptchaResponse _$CaptchaResponseFromJson(Map<String, dynamic> json) =>
    CaptchaResponse(
      code: json['code'] as String? ?? '',
      msg: json['msg'] as String? ?? '',
      rs:
          json['rs'] == null
              ? CaptchaResult.emptyInstance()
              : CaptchaResult.fromJson(json['rs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CaptchaResponseToJson(CaptchaResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'rs': instance.rs.toJson(),
    };

CaptchaLinksItem _$CaptchaLinksItemFromJson(Map<String, dynamic> json) =>
    CaptchaLinksItem(
      rel: json['rel'] as String? ?? '',
      href: json['href'] as String? ?? '',
    );

Map<String, dynamic> _$CaptchaLinksItemToJson(CaptchaLinksItem instance) =>
    <String, dynamic>{'rel': instance.rel, 'href': instance.href};

CaptchaResult _$CaptchaResultFromJson(Map<String, dynamic> json) =>
    CaptchaResult(
      type: json['type'] as String? ?? '',
      image: json['image'] as String? ?? '',
      encodeCaptha: json['encodeCaptha'] as String? ?? '',
      codeType: (json['codeType'] as num?)?.toInt() ?? 0,
      links:
          (json['links'] as List<dynamic>?)
              ?.map((e) => CaptchaLinksItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CaptchaResultToJson(CaptchaResult instance) =>
    <String, dynamic>{
      'type': instance.type,
      'image': instance.image,
      'encodeCaptha': instance.encodeCaptha,
      'codeType': instance.codeType,
      'links': instance.links.map((e) => e.toJson()).toList(),
    };
