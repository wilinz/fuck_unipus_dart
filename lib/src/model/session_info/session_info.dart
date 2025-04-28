import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:autoequal/autoequal.dart';

part 'session_info.g.dart';

@CopyWith()
@Autoequal()
@JsonSerializable(explicitToJson: true)
class SessionInfo with EquatableMixin {

  SessionInfo(
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


  factory SessionInfo.fromJson(Map<String, dynamic> json) => _$SessionInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$SessionInfoToJson(this);
  
  factory SessionInfo.emptyInstance() => SessionInfo(name: "", token: "", openid: "", websocketUrl: "");
  
  @override
  List<Object?> get props => _$props;
}


