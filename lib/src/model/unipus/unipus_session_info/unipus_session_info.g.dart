// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unipus_session_info.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UnipusSessionInfoCWProxy {
  UnipusSessionInfo name(String name);

  UnipusSessionInfo token(String token);

  UnipusSessionInfo openid(String openid);

  UnipusSessionInfo websocketUrl(String websocketUrl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnipusSessionInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnipusSessionInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  UnipusSessionInfo call({
    String name,
    String token,
    String openid,
    String websocketUrl,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUnipusSessionInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUnipusSessionInfo.copyWith.fieldName(...)`
class _$UnipusSessionInfoCWProxyImpl implements _$UnipusSessionInfoCWProxy {
  const _$UnipusSessionInfoCWProxyImpl(this._value);

  final UnipusSessionInfo _value;

  @override
  UnipusSessionInfo name(String name) => this(name: name);

  @override
  UnipusSessionInfo token(String token) => this(token: token);

  @override
  UnipusSessionInfo openid(String openid) => this(openid: openid);

  @override
  UnipusSessionInfo websocketUrl(String websocketUrl) =>
      this(websocketUrl: websocketUrl);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnipusSessionInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnipusSessionInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  UnipusSessionInfo call({
    Object? name = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
    Object? openid = const $CopyWithPlaceholder(),
    Object? websocketUrl = const $CopyWithPlaceholder(),
  }) {
    return UnipusSessionInfo(
      name:
          name == const $CopyWithPlaceholder()
              ? _value.name
              // ignore: cast_nullable_to_non_nullable
              : name as String,
      token:
          token == const $CopyWithPlaceholder()
              ? _value.token
              // ignore: cast_nullable_to_non_nullable
              : token as String,
      openid:
          openid == const $CopyWithPlaceholder()
              ? _value.openid
              // ignore: cast_nullable_to_non_nullable
              : openid as String,
      websocketUrl:
          websocketUrl == const $CopyWithPlaceholder()
              ? _value.websocketUrl
              // ignore: cast_nullable_to_non_nullable
              : websocketUrl as String,
    );
  }
}

extension $UnipusSessionInfoCopyWith on UnipusSessionInfo {
  /// Returns a callable class that can be used as follows: `instanceOfUnipusSessionInfo.copyWith(...)` or like so:`instanceOfUnipusSessionInfo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UnipusSessionInfoCWProxy get copyWith =>
      _$UnipusSessionInfoCWProxyImpl(this);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$UnipusSessionInfoEquatableAnnotations on UnipusSessionInfo {
  List<Object?> get _$props => [name, token, openid, websocketUrl];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnipusSessionInfo _$UnipusSessionInfoFromJson(Map<String, dynamic> json) =>
    UnipusSessionInfo(
      name: json['name'] as String? ?? '',
      token: json['token'] as String? ?? '',
      openid: json['openid'] as String? ?? '',
      websocketUrl: json['websocket_url'] as String? ?? '',
    );

Map<String, dynamic> _$UnipusSessionInfoToJson(UnipusSessionInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'token': instance.token,
      'openid': instance.openid,
      'websocket_url': instance.websocketUrl,
    };
