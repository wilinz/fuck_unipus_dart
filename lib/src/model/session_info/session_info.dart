import 'package:json_annotation/json_annotation.dart';

part 'session_info.g.dart';

@JsonSerializable(explicitToJson: true)
class SessionInfo {

  SessionInfo(
      {required this.name,
      required this.token,
      required this.openid,
      required this.websocketUrl});

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "token", defaultValue: "")
  String token;

  @JsonKey(name: "openid", defaultValue: "")
  String openid;

  @JsonKey(name: "websocket_url", defaultValue: "")
  String websocketUrl;


  factory SessionInfo.fromJson(Map<String, dynamic> json) => _$SessionInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$SessionInfoToJson(this);
  
  factory SessionInfo.emptyInstance() => SessionInfo(name: "", token: "", openid: "", websocketUrl: "");
}


