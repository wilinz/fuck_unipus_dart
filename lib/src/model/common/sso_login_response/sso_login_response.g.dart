// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sso_login_response.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$SsoLoginResponseAutoequal on SsoLoginResponse {
  List<Object?> get _$props => [code, msg, error, rs];
}

extension _$SsoLoginLinksItemAutoequal on SsoLoginLinksItem {
  List<Object?> get _$props => [rel, href];
}

extension _$SsoLoginResultAutoequal on SsoLoginResult {
  List<Object?> get _$props => [
    grantingTicket,
    serviceTicket,
    tgtExpiredTime,
    role,
    openid,
    nickname,
    fullname,
    username,
    mobile,
    email,
    perms,
    isSsoLogin,
    isCompleted,
    openidHash,
    jwt,
    rt,
    createTime,
    status,
    source,
    links,
  ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SsoLoginResponseCWProxy {
  SsoLoginResponse code(String code);

  SsoLoginResponse msg(String msg);

  SsoLoginResponse error(dynamic error);

  SsoLoginResponse rs(SsoLoginResult rs);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SsoLoginResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SsoLoginResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  SsoLoginResponse call({
    String code,
    String msg,
    dynamic error,
    SsoLoginResult rs,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSsoLoginResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSsoLoginResponse.copyWith.fieldName(...)`
class _$SsoLoginResponseCWProxyImpl implements _$SsoLoginResponseCWProxy {
  const _$SsoLoginResponseCWProxyImpl(this._value);

  final SsoLoginResponse _value;

  @override
  SsoLoginResponse code(String code) => this(code: code);

  @override
  SsoLoginResponse msg(String msg) => this(msg: msg);

  @override
  SsoLoginResponse error(dynamic error) => this(error: error);

  @override
  SsoLoginResponse rs(SsoLoginResult rs) => this(rs: rs);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SsoLoginResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SsoLoginResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  SsoLoginResponse call({
    Object? code = const $CopyWithPlaceholder(),
    Object? msg = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? rs = const $CopyWithPlaceholder(),
  }) {
    return SsoLoginResponse(
      code:
          code == const $CopyWithPlaceholder()
              ? _value.code
              // ignore: cast_nullable_to_non_nullable
              : code as String,
      msg:
          msg == const $CopyWithPlaceholder()
              ? _value.msg
              // ignore: cast_nullable_to_non_nullable
              : msg as String,
      error:
          error == const $CopyWithPlaceholder()
              ? _value.error
              // ignore: cast_nullable_to_non_nullable
              : error as dynamic,
      rs:
          rs == const $CopyWithPlaceholder()
              ? _value.rs
              // ignore: cast_nullable_to_non_nullable
              : rs as SsoLoginResult,
    );
  }
}

extension $SsoLoginResponseCopyWith on SsoLoginResponse {
  /// Returns a callable class that can be used as follows: `instanceOfSsoLoginResponse.copyWith(...)` or like so:`instanceOfSsoLoginResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SsoLoginResponseCWProxy get copyWith => _$SsoLoginResponseCWProxyImpl(this);
}

abstract class _$SsoLoginLinksItemCWProxy {
  SsoLoginLinksItem rel(String rel);

  SsoLoginLinksItem href(String href);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SsoLoginLinksItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SsoLoginLinksItem(...).copyWith(id: 12, name: "My name")
  /// ````
  SsoLoginLinksItem call({String rel, String href});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSsoLoginLinksItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSsoLoginLinksItem.copyWith.fieldName(...)`
class _$SsoLoginLinksItemCWProxyImpl implements _$SsoLoginLinksItemCWProxy {
  const _$SsoLoginLinksItemCWProxyImpl(this._value);

  final SsoLoginLinksItem _value;

  @override
  SsoLoginLinksItem rel(String rel) => this(rel: rel);

  @override
  SsoLoginLinksItem href(String href) => this(href: href);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SsoLoginLinksItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SsoLoginLinksItem(...).copyWith(id: 12, name: "My name")
  /// ````
  SsoLoginLinksItem call({
    Object? rel = const $CopyWithPlaceholder(),
    Object? href = const $CopyWithPlaceholder(),
  }) {
    return SsoLoginLinksItem(
      rel:
          rel == const $CopyWithPlaceholder()
              ? _value.rel
              // ignore: cast_nullable_to_non_nullable
              : rel as String,
      href:
          href == const $CopyWithPlaceholder()
              ? _value.href
              // ignore: cast_nullable_to_non_nullable
              : href as String,
    );
  }
}

extension $SsoLoginLinksItemCopyWith on SsoLoginLinksItem {
  /// Returns a callable class that can be used as follows: `instanceOfSsoLoginLinksItem.copyWith(...)` or like so:`instanceOfSsoLoginLinksItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SsoLoginLinksItemCWProxy get copyWith =>
      _$SsoLoginLinksItemCWProxyImpl(this);
}

abstract class _$SsoLoginResultCWProxy {
  SsoLoginResult grantingTicket(String grantingTicket);

  SsoLoginResult serviceTicket(String serviceTicket);

  SsoLoginResult tgtExpiredTime(int tgtExpiredTime);

  SsoLoginResult role(String role);

  SsoLoginResult openid(String openid);

  SsoLoginResult nickname(String nickname);

  SsoLoginResult fullname(String fullname);

  SsoLoginResult username(String username);

  SsoLoginResult mobile(String mobile);

  SsoLoginResult email(String email);

  SsoLoginResult perms(String perms);

  SsoLoginResult isSsoLogin(String isSsoLogin);

  SsoLoginResult isCompleted(String isCompleted);

  SsoLoginResult openidHash(String openidHash);

  SsoLoginResult jwt(String jwt);

  SsoLoginResult rt(String rt);

  SsoLoginResult createTime(String createTime);

  SsoLoginResult status(int status);

  SsoLoginResult source(String source);

  SsoLoginResult links(List<SsoLoginLinksItem> links);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SsoLoginResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SsoLoginResult(...).copyWith(id: 12, name: "My name")
  /// ````
  SsoLoginResult call({
    String grantingTicket,
    String serviceTicket,
    int tgtExpiredTime,
    String role,
    String openid,
    String nickname,
    String fullname,
    String username,
    String mobile,
    String email,
    String perms,
    String isSsoLogin,
    String isCompleted,
    String openidHash,
    String jwt,
    String rt,
    String createTime,
    int status,
    String source,
    List<SsoLoginLinksItem> links,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSsoLoginResult.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSsoLoginResult.copyWith.fieldName(...)`
class _$SsoLoginResultCWProxyImpl implements _$SsoLoginResultCWProxy {
  const _$SsoLoginResultCWProxyImpl(this._value);

  final SsoLoginResult _value;

  @override
  SsoLoginResult grantingTicket(String grantingTicket) =>
      this(grantingTicket: grantingTicket);

  @override
  SsoLoginResult serviceTicket(String serviceTicket) =>
      this(serviceTicket: serviceTicket);

  @override
  SsoLoginResult tgtExpiredTime(int tgtExpiredTime) =>
      this(tgtExpiredTime: tgtExpiredTime);

  @override
  SsoLoginResult role(String role) => this(role: role);

  @override
  SsoLoginResult openid(String openid) => this(openid: openid);

  @override
  SsoLoginResult nickname(String nickname) => this(nickname: nickname);

  @override
  SsoLoginResult fullname(String fullname) => this(fullname: fullname);

  @override
  SsoLoginResult username(String username) => this(username: username);

  @override
  SsoLoginResult mobile(String mobile) => this(mobile: mobile);

  @override
  SsoLoginResult email(String email) => this(email: email);

  @override
  SsoLoginResult perms(String perms) => this(perms: perms);

  @override
  SsoLoginResult isSsoLogin(String isSsoLogin) => this(isSsoLogin: isSsoLogin);

  @override
  SsoLoginResult isCompleted(String isCompleted) =>
      this(isCompleted: isCompleted);

  @override
  SsoLoginResult openidHash(String openidHash) => this(openidHash: openidHash);

  @override
  SsoLoginResult jwt(String jwt) => this(jwt: jwt);

  @override
  SsoLoginResult rt(String rt) => this(rt: rt);

  @override
  SsoLoginResult createTime(String createTime) => this(createTime: createTime);

  @override
  SsoLoginResult status(int status) => this(status: status);

  @override
  SsoLoginResult source(String source) => this(source: source);

  @override
  SsoLoginResult links(List<SsoLoginLinksItem> links) => this(links: links);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SsoLoginResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SsoLoginResult(...).copyWith(id: 12, name: "My name")
  /// ````
  SsoLoginResult call({
    Object? grantingTicket = const $CopyWithPlaceholder(),
    Object? serviceTicket = const $CopyWithPlaceholder(),
    Object? tgtExpiredTime = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? openid = const $CopyWithPlaceholder(),
    Object? nickname = const $CopyWithPlaceholder(),
    Object? fullname = const $CopyWithPlaceholder(),
    Object? username = const $CopyWithPlaceholder(),
    Object? mobile = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? perms = const $CopyWithPlaceholder(),
    Object? isSsoLogin = const $CopyWithPlaceholder(),
    Object? isCompleted = const $CopyWithPlaceholder(),
    Object? openidHash = const $CopyWithPlaceholder(),
    Object? jwt = const $CopyWithPlaceholder(),
    Object? rt = const $CopyWithPlaceholder(),
    Object? createTime = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? source = const $CopyWithPlaceholder(),
    Object? links = const $CopyWithPlaceholder(),
  }) {
    return SsoLoginResult(
      grantingTicket:
          grantingTicket == const $CopyWithPlaceholder()
              ? _value.grantingTicket
              // ignore: cast_nullable_to_non_nullable
              : grantingTicket as String,
      serviceTicket:
          serviceTicket == const $CopyWithPlaceholder()
              ? _value.serviceTicket
              // ignore: cast_nullable_to_non_nullable
              : serviceTicket as String,
      tgtExpiredTime:
          tgtExpiredTime == const $CopyWithPlaceholder()
              ? _value.tgtExpiredTime
              // ignore: cast_nullable_to_non_nullable
              : tgtExpiredTime as int,
      role:
          role == const $CopyWithPlaceholder()
              ? _value.role
              // ignore: cast_nullable_to_non_nullable
              : role as String,
      openid:
          openid == const $CopyWithPlaceholder()
              ? _value.openid
              // ignore: cast_nullable_to_non_nullable
              : openid as String,
      nickname:
          nickname == const $CopyWithPlaceholder()
              ? _value.nickname
              // ignore: cast_nullable_to_non_nullable
              : nickname as String,
      fullname:
          fullname == const $CopyWithPlaceholder()
              ? _value.fullname
              // ignore: cast_nullable_to_non_nullable
              : fullname as String,
      username:
          username == const $CopyWithPlaceholder()
              ? _value.username
              // ignore: cast_nullable_to_non_nullable
              : username as String,
      mobile:
          mobile == const $CopyWithPlaceholder()
              ? _value.mobile
              // ignore: cast_nullable_to_non_nullable
              : mobile as String,
      email:
          email == const $CopyWithPlaceholder()
              ? _value.email
              // ignore: cast_nullable_to_non_nullable
              : email as String,
      perms:
          perms == const $CopyWithPlaceholder()
              ? _value.perms
              // ignore: cast_nullable_to_non_nullable
              : perms as String,
      isSsoLogin:
          isSsoLogin == const $CopyWithPlaceholder()
              ? _value.isSsoLogin
              // ignore: cast_nullable_to_non_nullable
              : isSsoLogin as String,
      isCompleted:
          isCompleted == const $CopyWithPlaceholder()
              ? _value.isCompleted
              // ignore: cast_nullable_to_non_nullable
              : isCompleted as String,
      openidHash:
          openidHash == const $CopyWithPlaceholder()
              ? _value.openidHash
              // ignore: cast_nullable_to_non_nullable
              : openidHash as String,
      jwt:
          jwt == const $CopyWithPlaceholder()
              ? _value.jwt
              // ignore: cast_nullable_to_non_nullable
              : jwt as String,
      rt:
          rt == const $CopyWithPlaceholder()
              ? _value.rt
              // ignore: cast_nullable_to_non_nullable
              : rt as String,
      createTime:
          createTime == const $CopyWithPlaceholder()
              ? _value.createTime
              // ignore: cast_nullable_to_non_nullable
              : createTime as String,
      status:
          status == const $CopyWithPlaceholder()
              ? _value.status
              // ignore: cast_nullable_to_non_nullable
              : status as int,
      source:
          source == const $CopyWithPlaceholder()
              ? _value.source
              // ignore: cast_nullable_to_non_nullable
              : source as String,
      links:
          links == const $CopyWithPlaceholder()
              ? _value.links
              // ignore: cast_nullable_to_non_nullable
              : links as List<SsoLoginLinksItem>,
    );
  }
}

extension $SsoLoginResultCopyWith on SsoLoginResult {
  /// Returns a callable class that can be used as follows: `instanceOfSsoLoginResult.copyWith(...)` or like so:`instanceOfSsoLoginResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SsoLoginResultCWProxy get copyWith => _$SsoLoginResultCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SsoLoginResponse _$SsoLoginResponseFromJson(Map<String, dynamic> json) =>
    SsoLoginResponse(
      code: json['code'] as String? ?? '',
      msg: json['msg'] as String? ?? '',
      error: json['error'],
      rs:
          json['rs'] == null
              ? SsoLoginResult.emptyInstance()
              : SsoLoginResult.fromJson(json['rs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SsoLoginResponseToJson(SsoLoginResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'error': instance.error,
      'rs': instance.rs.toJson(),
    };

SsoLoginLinksItem _$SsoLoginLinksItemFromJson(Map<String, dynamic> json) =>
    SsoLoginLinksItem(
      rel: json['rel'] as String? ?? '',
      href: json['href'] as String? ?? '',
    );

Map<String, dynamic> _$SsoLoginLinksItemToJson(SsoLoginLinksItem instance) =>
    <String, dynamic>{'rel': instance.rel, 'href': instance.href};

SsoLoginResult _$SsoLoginResultFromJson(Map<String, dynamic> json) =>
    SsoLoginResult(
      grantingTicket: json['grantingTicket'] as String? ?? '',
      serviceTicket: json['serviceTicket'] as String? ?? '',
      tgtExpiredTime: (json['tgtExpiredTime'] as num?)?.toInt() ?? 0,
      role: json['role'] as String? ?? '',
      openid: json['openid'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      fullname: json['fullname'] as String? ?? '',
      username: json['username'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      email: json['email'] as String? ?? '',
      perms: json['perms'] as String? ?? '',
      isSsoLogin: json['isSsoLogin'] as String? ?? '',
      isCompleted: json['isCompleted'] as String? ?? '',
      openidHash: json['openidHash'] as String? ?? '',
      jwt: json['jwt'] as String? ?? '',
      rt: json['rt'] as String? ?? '',
      createTime: json['createTime'] as String? ?? '',
      status: (json['status'] as num?)?.toInt() ?? 0,
      source: json['source'] as String? ?? '',
      links:
          (json['links'] as List<dynamic>?)
              ?.map(
                (e) => SsoLoginLinksItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$SsoLoginResultToJson(SsoLoginResult instance) =>
    <String, dynamic>{
      'grantingTicket': instance.grantingTicket,
      'serviceTicket': instance.serviceTicket,
      'tgtExpiredTime': instance.tgtExpiredTime,
      'role': instance.role,
      'openid': instance.openid,
      'nickname': instance.nickname,
      'fullname': instance.fullname,
      'username': instance.username,
      'mobile': instance.mobile,
      'email': instance.email,
      'perms': instance.perms,
      'isSsoLogin': instance.isSsoLogin,
      'isCompleted': instance.isCompleted,
      'openidHash': instance.openidHash,
      'jwt': instance.jwt,
      'rt': instance.rt,
      'createTime': instance.createTime,
      'status': instance.status,
      'source': instance.source,
      'links': instance.links.map((e) => e.toJson()).toList(),
    };
