import 'package:json_annotation/json_annotation.dart';

part 'captcha_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CaptchaResponse {

  CaptchaResponse(
      {required this.code,
      required this.msg,
      required this.rs});

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  @JsonKey(name: "rs", defaultValue: Rs.emptyInstance)
  Rs rs;


  factory CaptchaResponse.fromJson(Map<String, dynamic> json) => _$CaptchaResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$CaptchaResponseToJson(this);
  
  factory CaptchaResponse.emptyInstance() => CaptchaResponse(code: "", msg: "", rs: Rs.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class Links {

  Links(
      {required this.rel,
      required this.href});

  @JsonKey(name: "rel", defaultValue: "")
  String rel;

  @JsonKey(name: "href", defaultValue: "")
  String href;


  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  
  Map<String, dynamic> toJson() => _$LinksToJson(this);
  
  factory Links.emptyInstance() => Links(rel: "", href: "");
}

@JsonSerializable(explicitToJson: true)
class Rs {

  Rs(
      {required this.type,
      required this.image,
      required this.encodeCaptha,
      required this.codeType,
      required this.links});

  @JsonKey(name: "type", defaultValue: "")
  String type;

  @JsonKey(name: "image", defaultValue: "")
  String image;

  @JsonKey(name: "encodeCaptha", defaultValue: "")
  String encodeCaptha;

  @JsonKey(name: "codeType", defaultValue: 0)
  int codeType;

  @JsonKey(name: "links", defaultValue: [])
  List<Links> links;


  factory Rs.fromJson(Map<String, dynamic> json) => _$RsFromJson(json);
  
  Map<String, dynamic> toJson() => _$RsToJson(this);
  
  factory Rs.emptyInstance() => Rs(type: "", image: "", encodeCaptha: "", codeType: 0, links: []);
}


