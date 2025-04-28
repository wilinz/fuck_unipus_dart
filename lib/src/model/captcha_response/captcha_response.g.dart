// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'captcha_response.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$CaptchaResponseAutoequal on CaptchaResponse {
  List<Object?> get _$props => [code, msg, rs];
}

extension _$LinksItemAutoequal on LinksItem {
  List<Object?> get _$props => [rel, href];
}

extension _$RsAutoequal on Rs {
  List<Object?> get _$props => [type, image, encodeCaptha, codeType, links];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CaptchaResponseCWProxy {
  CaptchaResponse code(String code);

  CaptchaResponse msg(String msg);

  CaptchaResponse rs(Rs rs);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CaptchaResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CaptchaResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  CaptchaResponse call({String code, String msg, Rs rs});
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
  CaptchaResponse rs(Rs rs) => this(rs: rs);

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
              : rs as Rs,
    );
  }
}

extension $CaptchaResponseCopyWith on CaptchaResponse {
  /// Returns a callable class that can be used as follows: `instanceOfCaptchaResponse.copyWith(...)` or like so:`instanceOfCaptchaResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CaptchaResponseCWProxy get copyWith => _$CaptchaResponseCWProxyImpl(this);
}

abstract class _$LinksItemCWProxy {
  LinksItem rel(String rel);

  LinksItem href(String href);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LinksItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LinksItem(...).copyWith(id: 12, name: "My name")
  /// ````
  LinksItem call({String rel, String href});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLinksItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLinksItem.copyWith.fieldName(...)`
class _$LinksItemCWProxyImpl implements _$LinksItemCWProxy {
  const _$LinksItemCWProxyImpl(this._value);

  final LinksItem _value;

  @override
  LinksItem rel(String rel) => this(rel: rel);

  @override
  LinksItem href(String href) => this(href: href);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LinksItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LinksItem(...).copyWith(id: 12, name: "My name")
  /// ````
  LinksItem call({
    Object? rel = const $CopyWithPlaceholder(),
    Object? href = const $CopyWithPlaceholder(),
  }) {
    return LinksItem(
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

extension $LinksItemCopyWith on LinksItem {
  /// Returns a callable class that can be used as follows: `instanceOfLinksItem.copyWith(...)` or like so:`instanceOfLinksItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LinksItemCWProxy get copyWith => _$LinksItemCWProxyImpl(this);
}

abstract class _$RsCWProxy {
  Rs type(String type);

  Rs image(String image);

  Rs encodeCaptha(String encodeCaptha);

  Rs codeType(int codeType);

  Rs links(List<LinksItem> links);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Rs(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Rs(...).copyWith(id: 12, name: "My name")
  /// ````
  Rs call({
    String type,
    String image,
    String encodeCaptha,
    int codeType,
    List<LinksItem> links,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRs.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRs.copyWith.fieldName(...)`
class _$RsCWProxyImpl implements _$RsCWProxy {
  const _$RsCWProxyImpl(this._value);

  final Rs _value;

  @override
  Rs type(String type) => this(type: type);

  @override
  Rs image(String image) => this(image: image);

  @override
  Rs encodeCaptha(String encodeCaptha) => this(encodeCaptha: encodeCaptha);

  @override
  Rs codeType(int codeType) => this(codeType: codeType);

  @override
  Rs links(List<LinksItem> links) => this(links: links);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Rs(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Rs(...).copyWith(id: 12, name: "My name")
  /// ````
  Rs call({
    Object? type = const $CopyWithPlaceholder(),
    Object? image = const $CopyWithPlaceholder(),
    Object? encodeCaptha = const $CopyWithPlaceholder(),
    Object? codeType = const $CopyWithPlaceholder(),
    Object? links = const $CopyWithPlaceholder(),
  }) {
    return Rs(
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
              : links as List<LinksItem>,
    );
  }
}

extension $RsCopyWith on Rs {
  /// Returns a callable class that can be used as follows: `instanceOfRs.copyWith(...)` or like so:`instanceOfRs.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RsCWProxy get copyWith => _$RsCWProxyImpl(this);
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
              ? Rs.emptyInstance()
              : Rs.fromJson(json['rs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CaptchaResponseToJson(CaptchaResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'rs': instance.rs.toJson(),
    };

LinksItem _$LinksItemFromJson(Map<String, dynamic> json) => LinksItem(
  rel: json['rel'] as String? ?? '',
  href: json['href'] as String? ?? '',
);

Map<String, dynamic> _$LinksItemToJson(LinksItem instance) => <String, dynamic>{
  'rel': instance.rel,
  'href': instance.href,
};

Rs _$RsFromJson(Map<String, dynamic> json) => Rs(
  type: json['type'] as String? ?? '',
  image: json['image'] as String? ?? '',
  encodeCaptha: json['encodeCaptha'] as String? ?? '',
  codeType: (json['codeType'] as num?)?.toInt() ?? 0,
  links:
      (json['links'] as List<dynamic>?)
          ?.map((e) => LinksItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$RsToJson(Rs instance) => <String, dynamic>{
  'type': instance.type,
  'image': instance.image,
  'encodeCaptha': instance.encodeCaptha,
  'codeType': instance.codeType,
  'links': instance.links.map((e) => e.toJson()).toList(),
};
