import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable_annotations/equatable_annotations.dart';
import 'package:fuck_unipus/src/model/unipus_mobile/mobile_login_result/mobile_login_result.dart';

part 'mobile_session_info.g.dart';

/// Mobile Session Information
@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class UnipusMobileSessionInfo with EquatableMixin {

  UnipusMobileSessionInfo({
    required this.serviceTicket,
    required this.openidHash,
    required this.userInfo,
  });

  @JsonKey(name: "service_ticket", defaultValue: "")
  final String serviceTicket;

  @JsonKey(name: "openid_hash", defaultValue: "")
  final String openidHash;

  @JsonKey(name: "user_info")
  final MobileLoginResultUserInfo? userInfo;

  factory UnipusMobileSessionInfo.fromJson(Map<String, dynamic> json) => _$UnipusMobileSessionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UnipusMobileSessionInfoToJson(this);

  factory UnipusMobileSessionInfo.emptyInstance() => UnipusMobileSessionInfo(
    serviceTicket: "",
    openidHash: "",
    userInfo: null
  );

  @override
  List<Object?> get props => _$props;
}