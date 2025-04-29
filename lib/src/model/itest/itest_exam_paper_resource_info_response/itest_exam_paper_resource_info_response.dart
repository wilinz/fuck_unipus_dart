import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:autoequal/autoequal.dart';

part 'itest_exam_paper_resource_info_response.g.dart';

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class ItestExamPaperResourceInfoResponse with EquatableMixin {

  ItestExamPaperResourceInfoResponse(
      {required this.msg,
      required this.rs,
      required this.code});

  @JsonKey(name: "msg", defaultValue: "")
  final String msg;

  @JsonKey(name: "rs", defaultValue: ItestExamPaperResourceInfoRs.emptyInstance)
  final ItestExamPaperResourceInfoRs rs;

  @JsonKey(name: "code", defaultValue: 0)
  final int code;


  factory ItestExamPaperResourceInfoResponse.fromJson(Map<String, dynamic> json) => _$ItestExamPaperResourceInfoResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamPaperResourceInfoResponseToJson(this);
  
  factory ItestExamPaperResourceInfoResponse.emptyInstance() => ItestExamPaperResourceInfoResponse(msg: "", rs: ItestExamPaperResourceInfoRs.emptyInstance(), code: 0);
  
  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class ItestExamPaperResourceInfoRs with EquatableMixin {

  ItestExamPaperResourceInfoRs(
      {required this.urls,
      required this.updateTime,
      required this.size,
      required this.hash});

  @JsonKey(name: "urls", defaultValue: [])
  final List urls;

  @JsonKey(name: "update_time", defaultValue: 0)
  final int updateTime;

  @JsonKey(name: "size", defaultValue: 0)
  final int size;

  @JsonKey(name: "hash", defaultValue: 0)
  final int hash;


  factory ItestExamPaperResourceInfoRs.fromJson(Map<String, dynamic> json) => _$ItestExamPaperResourceInfoRsFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamPaperResourceInfoRsToJson(this);
  
  factory ItestExamPaperResourceInfoRs.emptyInstance() => ItestExamPaperResourceInfoRs(urls: [], updateTime: 0, size: 0, hash: 0);
  
  @override
  List<Object?> get props => _$props;
}


