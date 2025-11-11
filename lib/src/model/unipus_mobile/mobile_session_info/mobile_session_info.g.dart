// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_session_info.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UnipusMobileSessionInfoCWProxy {
  UnipusMobileSessionInfo serviceTicket(String serviceTicket);

  UnipusMobileSessionInfo openidHash(String openidHash);

  UnipusMobileSessionInfo userInfo(MobileLoginResultUserInfo? userInfo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnipusMobileSessionInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnipusMobileSessionInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  UnipusMobileSessionInfo call({
    String serviceTicket,
    String openidHash,
    MobileLoginResultUserInfo? userInfo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUnipusMobileSessionInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUnipusMobileSessionInfo.copyWith.fieldName(...)`
class _$UnipusMobileSessionInfoCWProxyImpl
    implements _$UnipusMobileSessionInfoCWProxy {
  const _$UnipusMobileSessionInfoCWProxyImpl(this._value);

  final UnipusMobileSessionInfo _value;

  @override
  UnipusMobileSessionInfo serviceTicket(String serviceTicket) =>
      this(serviceTicket: serviceTicket);

  @override
  UnipusMobileSessionInfo openidHash(String openidHash) =>
      this(openidHash: openidHash);

  @override
  UnipusMobileSessionInfo userInfo(MobileLoginResultUserInfo? userInfo) =>
      this(userInfo: userInfo);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnipusMobileSessionInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnipusMobileSessionInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  UnipusMobileSessionInfo call({
    Object? serviceTicket = const $CopyWithPlaceholder(),
    Object? openidHash = const $CopyWithPlaceholder(),
    Object? userInfo = const $CopyWithPlaceholder(),
  }) {
    return UnipusMobileSessionInfo(
      serviceTicket:
          serviceTicket == const $CopyWithPlaceholder()
              ? _value.serviceTicket
              // ignore: cast_nullable_to_non_nullable
              : serviceTicket as String,
      openidHash:
          openidHash == const $CopyWithPlaceholder()
              ? _value.openidHash
              // ignore: cast_nullable_to_non_nullable
              : openidHash as String,
      userInfo:
          userInfo == const $CopyWithPlaceholder()
              ? _value.userInfo
              // ignore: cast_nullable_to_non_nullable
              : userInfo as MobileLoginResultUserInfo?,
    );
  }
}

extension $UnipusMobileSessionInfoCopyWith on UnipusMobileSessionInfo {
  /// Returns a callable class that can be used as follows: `instanceOfUnipusMobileSessionInfo.copyWith(...)` or like so:`instanceOfUnipusMobileSessionInfo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UnipusMobileSessionInfoCWProxy get copyWith =>
      _$UnipusMobileSessionInfoCWProxyImpl(this);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$UnipusMobileSessionInfoEquatableAnnotations
    on UnipusMobileSessionInfo {
  List<Object?> get _$props => [serviceTicket, openidHash, userInfo];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnipusMobileSessionInfo _$UnipusMobileSessionInfoFromJson(
  Map<String, dynamic> json,
) => UnipusMobileSessionInfo(
  serviceTicket: json['service_ticket'] as String? ?? '',
  openidHash: json['openid_hash'] as String? ?? '',
  userInfo:
      json['user_info'] == null
          ? null
          : MobileLoginResultUserInfo.fromJson(
            json['user_info'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$UnipusMobileSessionInfoToJson(
  UnipusMobileSessionInfo instance,
) => <String, dynamic>{
  'service_ticket': instance.serviceTicket,
  'openid_hash': instance.openidHash,
  'user_info': instance.userInfo?.toJson(),
};
