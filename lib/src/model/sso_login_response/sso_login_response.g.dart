// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sso_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SsoLoginResponse _$SsoLoginResponseFromJson(Map<String, dynamic> json) =>
    SsoLoginResponse(
      code: json['code'] as String? ?? '',
      msg: json['msg'] as String? ?? '',
      error: json['error'],
      rs: json['rs'] == null
          ? Rs.emptyInstance()
          : Rs.fromJson(json['rs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SsoLoginResponseToJson(SsoLoginResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'error': instance.error,
      'rs': instance.rs.toJson(),
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      rel: json['rel'] as String? ?? '',
      href: json['href'] as String? ?? '',
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'rel': instance.rel,
      'href': instance.href,
    };

Rs _$RsFromJson(Map<String, dynamic> json) => Rs(
      grantingTicket: json['grantingTicket'] as String? ?? '',
      serviceTicket: json['serviceTicket'] as String? ?? '',
      tgtExpiredTime: (json['tgtExpiredTime'] as num?)?.toInt() ?? 0,
      role: json['role'] as String? ?? '',
      openid: json['openid'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      fullname: json['fullname'] as String? ?? '',
      username: json['username'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      email: json['email'] as String? ?? '',
      perms: json['perms'] as String? ?? '',
      isSsoLogin: json['isSsoLogin'] as String? ?? '',
      isCompleted: json['isCompleted'] as String? ?? '',
      openidHash: json['openidHash'] as String? ?? '',
      jwt: json['jwt'] as String? ?? '',
      rt: json['rt'] as String? ?? '',
      createTime: json['createTime'] as String? ?? '',
      status: (json['status'] as num?)?.toInt() ?? 0,
      source: json['source'] as String? ?? '',
      links: (json['links'] as List<dynamic>?)
              ?.map((e) => Links.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$RsToJson(Rs instance) => <String, dynamic>{
      'grantingTicket': instance.grantingTicket,
      'serviceTicket': instance.serviceTicket,
      'tgtExpiredTime': instance.tgtExpiredTime,
      'role': instance.role,
      'openid': instance.openid,
      'nickname': instance.nickname,
      'fullname': instance.fullname,
      'username': instance.username,
      'mobile': instance.mobile,
      'email': instance.email,
      'perms': instance.perms,
      'isSsoLogin': instance.isSsoLogin,
      'isCompleted': instance.isCompleted,
      'openidHash': instance.openidHash,
      'jwt': instance.jwt,
      'rt': instance.rt,
      'createTime': instance.createTime,
      'status': instance.status,
      'source': instance.source,
      'links': instance.links.map((e) => e.toJson()).toList(),
    };
