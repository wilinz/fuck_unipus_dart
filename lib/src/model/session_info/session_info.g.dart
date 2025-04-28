// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_info.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$SessionInfoAutoequal on SessionInfo {
  List<Object?> get _$props => [name, token, openid, websocketUrl];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SessionInfoCWProxy {
  SessionInfo name(String name);

  SessionInfo token(String token);

  SessionInfo openid(String openid);

  SessionInfo websocketUrl(String websocketUrl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SessionInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SessionInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  SessionInfo call({
    String name,
    String token,
    String openid,
    String websocketUrl,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSessionInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSessionInfo.copyWith.fieldName(...)`
class _$SessionInfoCWProxyImpl implements _$SessionInfoCWProxy {
  const _$SessionInfoCWProxyImpl(this._value);

  final SessionInfo _value;

  @override
  SessionInfo name(String name) => this(name: name);

  @override
  SessionInfo token(String token) => this(token: token);

  @override
  SessionInfo openid(String openid) => this(openid: openid);

  @override
  SessionInfo websocketUrl(String websocketUrl) =>
      this(websocketUrl: websocketUrl);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SessionInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SessionInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  SessionInfo call({
    Object? name = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
    Object? openid = const $CopyWithPlaceholder(),
    Object? websocketUrl = const $CopyWithPlaceholder(),
  }) {
    return SessionInfo(
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

extension $SessionInfoCopyWith on SessionInfo {
  /// Returns a callable class that can be used as follows: `instanceOfSessionInfo.copyWith(...)` or like so:`instanceOfSessionInfo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SessionInfoCWProxy get copyWith => _$SessionInfoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionInfo _$SessionInfoFromJson(Map<String, dynamic> json) => SessionInfo(
  name: json['name'] as String? ?? '',
  token: json['token'] as String? ?? '',
  openid: json['openid'] as String? ?? '',
  websocketUrl: json['websocket_url'] as String? ?? '',
);

Map<String, dynamic> _$SessionInfoToJson(SessionInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'token': instance.token,
      'openid': instance.openid,
      'websocket_url': instance.websocketUrl,
    };
