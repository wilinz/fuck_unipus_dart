import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:autoequal/autoequal.dart';

part 'captcha_response.g.dart';

@CopyWith()
@Autoequal()
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

  @JsonKey(name: "rs", defaultValue: Rs.emptyInstance)
  final Rs rs;


  factory CaptchaResponse.fromJson(Map<String, dynamic> json) => _$CaptchaResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$CaptchaResponseToJson(this);
  
  factory CaptchaResponse.emptyInstance() => CaptchaResponse(code: "", msg: "", rs: Rs.emptyInstance());
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class LinksItem with EquatableMixin {

  LinksItem(
      {required this.rel,
      required this.href});

  @JsonKey(name: "rel", defaultValue: "")
  final String rel;

  @JsonKey(name: "href", defaultValue: "")
  final String href;


  factory LinksItem.fromJson(Map<String, dynamic> json) => _$LinksItemFromJson(json);
  
  Map<String, dynamic> toJson() => _$LinksItemToJson(this);
  
  factory LinksItem.emptyInstance() => LinksItem(rel: "", href: "");
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class Rs with EquatableMixin {

  Rs(
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
  final List<LinksItem> links;


  factory Rs.fromJson(Map<String, dynamic> json) => _$RsFromJson(json);
  
  Map<String, dynamic> toJson() => _$RsToJson(this);
  
  factory Rs.emptyInstance() => Rs(type: "", image: "", encodeCaptha: "", codeType: 0, links: []);
  
  @override
  List<Object?> get props => _$props;
}


