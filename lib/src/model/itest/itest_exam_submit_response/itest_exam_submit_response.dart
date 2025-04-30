import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable_annotations/equatable_annotations.dart';

part 'itest_exam_submit_response.g.dart';

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class ItestExamSubmitResponse with EquatableMixin {

  ItestExamSubmitResponse(
      {required this.msg,
      required this.code,
      required this.data,
      required this.unNoticeList});

  @JsonKey(name: "msg", defaultValue: "")
  final String msg;

  @JsonKey(name: "code", defaultValue: 0)
  final int code;

  @JsonKey(name: "data", defaultValue: "")
  final String data;

  @JsonKey(name: "unNoticeList", defaultValue: [])
  final List unNoticeList;


  factory ItestExamSubmitResponse.fromJson(Map<String, dynamic> json) => _$ItestExamSubmitResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItestExamSubmitResponseToJson(this);
  
  factory ItestExamSubmitResponse.emptyInstance() => ItestExamSubmitResponse(msg: "", code: 0, data: "", unNoticeList: []);
  
  @override
  List<Object?> get props => _$props;
}


