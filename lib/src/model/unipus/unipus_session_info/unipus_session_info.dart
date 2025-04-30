import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable_annotations/equatable_annotations.dart';

part 'unipus_session_info.g.dart';

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class UnipusSessionInfo with EquatableMixin {

  UnipusSessionInfo(
      {required this.name,
      required this.token,
      required this.openid,
      required this.websocketUrl});

  @JsonKey(name: "name", defaultValue: "")
  final String name;

  @JsonKey(name: "token", defaultValue: "")
  final String token;

  @JsonKey(name: "openid", defaultValue: "")
  final String openid;

  @JsonKey(name: "websocket_url", defaultValue: "")
  final String websocketUrl;


  factory UnipusSessionInfo.fromJson(Map<String, dynamic> json) => _$UnipusSessionInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$UnipusSessionInfoToJson(this);
  
  factory UnipusSessionInfo.emptyInstance() => UnipusSessionInfo(name: "", token: "", openid: "", websocketUrl: "");
  
  @override
  List<Object?> get props => _$props;
}


