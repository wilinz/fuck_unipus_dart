// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'captcha_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaptchaResponse _$CaptchaResponseFromJson(Map<String, dynamic> json) =>
    CaptchaResponse(
      code: json['code'] as String? ?? '',
      msg: json['msg'] as String? ?? '',
      rs: json['rs'] == null
          ? Rs.emptyInstance()
          : Rs.fromJson(json['rs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CaptchaResponseToJson(CaptchaResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
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
      type: json['type'] as String? ?? '',
      image: json['image'] as String? ?? '',
      encodeCaptha: json['encodeCaptha'] as String? ?? '',
      codeType: (json['codeType'] as num?)?.toInt() ?? 0,
      links: (json['links'] as List<dynamic>?)
              ?.map((e) => Links.fromJson(e as Map<String, dynamic>))
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
