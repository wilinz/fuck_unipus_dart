// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_info.dart';

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
