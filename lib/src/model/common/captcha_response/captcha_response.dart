import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable_annotations/equatable_annotations.dart';

part 'captcha_response.g.dart';

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class CaptchaResponse with EquatableMixin {

  CaptchaResponse(
      {required this.code,
      required this.msg,
      required this.rs});

  @JsonKey(name: "code", defaultValue: "")
  final String code;

  @JsonKey(name: "msg", defaultValue: "")
  final String msg;

  @JsonKey(name: "rs", defaultValue: CaptchaRs.emptyInstance)
  final CaptchaRs rs;


  factory CaptchaResponse.fromJson(Map<String, dynamic> json) => _$CaptchaResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$CaptchaResponseToJson(this);
  
  factory CaptchaResponse.emptyInstance() => CaptchaResponse(code: "", msg: "", rs: CaptchaRs.emptyInstance());
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class CaptchaLinksItem with EquatableMixin {

  CaptchaLinksItem(
      {required this.rel,
      required this.href});

  @JsonKey(name: "rel", defaultValue: "")
  final String rel;

  @JsonKey(name: "href", defaultValue: "")
  final String href;


  factory CaptchaLinksItem.fromJson(Map<String, dynamic> json) => _$CaptchaLinksItemFromJson(json);
  
  Map<String, dynamic> toJson() => _$CaptchaLinksItemToJson(this);
  
  factory CaptchaLinksItem.emptyInstance() => CaptchaLinksItem(rel: "", href: "");
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class CaptchaRs with EquatableMixin {

  CaptchaRs(
      {required this.type,
      required this.image,
      required this.encodeCaptha,
      required this.codeType,
      required this.links});

  @JsonKey(name: "type", defaultValue: "")
  final String type;

  @JsonKey(name: "image", defaultValue: "")
  final String image;

  @JsonKey(name: "encodeCaptha", defaultValue: "")
  final String encodeCaptha;

  @JsonKey(name: "codeType", defaultValue: 0)
  final int codeType;

  @JsonKey(name: "links", defaultValue: [])
  final List<CaptchaLinksItem> links;


  factory CaptchaRs.fromJson(Map<String, dynamic> json) => _$CaptchaRsFromJson(json);
  
  Map<String, dynamic> toJson() => _$CaptchaRsToJson(this);
  
  factory CaptchaRs.emptyInstance() => CaptchaRs(type: "", image: "", encodeCaptha: "", codeType: 0, links: []);
  
  @override
  List<Object?> get props => _$props;
}


