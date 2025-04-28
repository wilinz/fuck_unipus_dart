// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sso_login_response.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$SsoLoginResponseAutoequal on SsoLoginResponse {
  List<Object?> get _$props => [code, msg, error, rs];
}

extension _$LinksItemAutoequal on LinksItem {
  List<Object?> get _$props => [rel, href];
}

extension _$RsAutoequal on Rs {
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

  SsoLoginResponse rs(Rs rs);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SsoLoginResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SsoLoginResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  SsoLoginResponse call({String code, String msg, dynamic error, Rs rs});
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
  SsoLoginResponse rs(Rs rs) => this(rs: rs);

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
              : rs as Rs,
    );
  }
}

extension $SsoLoginResponseCopyWith on SsoLoginResponse {
  /// Returns a callable class that can be used as follows: `instanceOfSsoLoginResponse.copyWith(...)` or like so:`instanceOfSsoLoginResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SsoLoginResponseCWProxy get copyWith => _$SsoLoginResponseCWProxyImpl(this);
}

abstract class _$LinksItemCWProxy {
  LinksItem rel(String rel);

  LinksItem href(String href);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LinksItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LinksItem(...).copyWith(id: 12, name: "My name")
  /// ````
  LinksItem call({String rel, String href});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLinksItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLinksItem.copyWith.fieldName(...)`
class _$LinksItemCWProxyImpl implements _$LinksItemCWProxy {
  const _$LinksItemCWProxyImpl(this._value);

  final LinksItem _value;

  @override
  LinksItem rel(String rel) => this(rel: rel);

  @override
  LinksItem href(String href) => this(href: href);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LinksItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LinksItem(...).copyWith(id: 12, name: "My name")
  /// ````
  LinksItem call({
    Object? rel = const $CopyWithPlaceholder(),
    Object? href = const $CopyWithPlaceholder(),
  }) {
    return LinksItem(
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

extension $LinksItemCopyWith on LinksItem {
  /// Returns a callable class that can be used as follows: `instanceOfLinksItem.copyWith(...)` or like so:`instanceOfLinksItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LinksItemCWProxy get copyWith => _$LinksItemCWProxyImpl(this);
}

abstract class _$RsCWProxy {
  Rs grantingTicket(String grantingTicket);

  Rs serviceTicket(String serviceTicket);

  Rs tgtExpiredTime(int tgtExpiredTime);

  Rs role(String role);

  Rs openid(String openid);

  Rs nickname(String nickname);

  Rs fullname(String fullname);

  Rs username(String username);

  Rs mobile(String mobile);

  Rs email(String email);

  Rs perms(String perms);

  Rs isSsoLogin(String isSsoLogin);

  Rs isCompleted(String isCompleted);

  Rs openidHash(String openidHash);

  Rs jwt(String jwt);

  Rs rt(String rt);

  Rs createTime(String createTime);

  Rs status(int status);

  Rs source(String source);

  Rs links(List<LinksItem> links);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Rs(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Rs(...).copyWith(id: 12, name: "My name")
  /// ````
  Rs call({
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
    List<LinksItem> links,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRs.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRs.copyWith.fieldName(...)`
class _$RsCWProxyImpl implements _$RsCWProxy {
  const _$RsCWProxyImpl(this._value);

  final Rs _value;

  @override
  Rs grantingTicket(String grantingTicket) =>
      this(grantingTicket: grantingTicket);

  @override
  Rs serviceTicket(String serviceTicket) => this(serviceTicket: serviceTicket);

  @override
  Rs tgtExpiredTime(int tgtExpiredTime) => this(tgtExpiredTime: tgtExpiredTime);

  @override
  Rs role(String role) => this(role: role);

  @override
  Rs openid(String openid) => this(openid: openid);

  @override
  Rs nickname(String nickname) => this(nickname: nickname);

  @override
  Rs fullname(String fullname) => this(fullname: fullname);

  @override
  Rs username(String username) => this(username: username);

  @override
  Rs mobile(String mobile) => this(mobile: mobile);

  @override
  Rs email(String email) => this(email: email);

  @override
  Rs perms(String perms) => this(perms: perms);

  @override
  Rs isSsoLogin(String isSsoLogin) => this(isSsoLogin: isSsoLogin);

  @override
  Rs isCompleted(String isCompleted) => this(isCompleted: isCompleted);

  @override
  Rs openidHash(String openidHash) => this(openidHash: openidHash);

  @override
  Rs jwt(String jwt) => this(jwt: jwt);

  @override
  Rs rt(String rt) => this(rt: rt);

  @override
  Rs createTime(String createTime) => this(createTime: createTime);

  @override
  Rs status(int status) => this(status: status);

  @override
  Rs source(String source) => this(source: source);

  @override
  Rs links(List<LinksItem> links) => this(links: links);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Rs(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Rs(...).copyWith(id: 12, name: "My name")
  /// ````
  Rs call({
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
    return Rs(
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
              : links as List<LinksItem>,
    );
  }
}

extension $RsCopyWith on Rs {
  /// Returns a callable class that can be used as follows: `instanceOfRs.copyWith(...)` or like so:`instanceOfRs.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RsCWProxy get copyWith => _$RsCWProxyImpl(this);
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
              ? Rs.emptyInstance()
              : Rs.fromJson(json['rs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SsoLoginResponseToJson(SsoLoginResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'error': instance.error,
      'rs': instance.rs.toJson(),
    };

LinksItem _$LinksItemFromJson(Map<String, dynamic> json) => LinksItem(
  rel: json['rel'] as String? ?? '',
  href: json['href'] as String? ?? '',
);

Map<String, dynamic> _$LinksItemToJson(LinksItem instance) => <String, dynamic>{
  'rel': instance.rel,
  'href': instance.href,
};

Rs _$RsFromJson(Map<String, dynamic> json) => Rs(
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
          ?.map((e) => LinksItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$RsToJson(Rs instance) => <String, dynamic>{
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
