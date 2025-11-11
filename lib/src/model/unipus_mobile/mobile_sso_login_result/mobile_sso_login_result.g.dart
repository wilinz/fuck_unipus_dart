// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_sso_login_result.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MobileSsoLoginResultCWProxy {
  MobileSsoLoginResult code(String code);

  MobileSsoLoginResult msg(String msg);

  MobileSsoLoginResult rs(MobileSsoLoginResultRs rs);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MobileSsoLoginResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MobileSsoLoginResult(...).copyWith(id: 12, name: "My name")
  /// ````
  MobileSsoLoginResult call({
    String code,
    String msg,
    MobileSsoLoginResultRs rs,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMobileSsoLoginResult.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMobileSsoLoginResult.copyWith.fieldName(...)`
class _$MobileSsoLoginResultCWProxyImpl
    implements _$MobileSsoLoginResultCWProxy {
  const _$MobileSsoLoginResultCWProxyImpl(this._value);

  final MobileSsoLoginResult _value;

  @override
  MobileSsoLoginResult code(String code) => this(code: code);

  @override
  MobileSsoLoginResult msg(String msg) => this(msg: msg);

  @override
  MobileSsoLoginResult rs(MobileSsoLoginResultRs rs) => this(rs: rs);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MobileSsoLoginResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MobileSsoLoginResult(...).copyWith(id: 12, name: "My name")
  /// ````
  MobileSsoLoginResult call({
    Object? code = const $CopyWithPlaceholder(),
    Object? msg = const $CopyWithPlaceholder(),
    Object? rs = const $CopyWithPlaceholder(),
  }) {
    return MobileSsoLoginResult(
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
      rs:
          rs == const $CopyWithPlaceholder()
              ? _value.rs
              // ignore: cast_nullable_to_non_nullable
              : rs as MobileSsoLoginResultRs,
    );
  }
}

extension $MobileSsoLoginResultCopyWith on MobileSsoLoginResult {
  /// Returns a callable class that can be used as follows: `instanceOfMobileSsoLoginResult.copyWith(...)` or like so:`instanceOfMobileSsoLoginResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MobileSsoLoginResultCWProxy get copyWith =>
      _$MobileSsoLoginResultCWProxyImpl(this);
}

abstract class _$MobileSsoLoginResultLinksItemCWProxy {
  MobileSsoLoginResultLinksItem rel(String rel);

  MobileSsoLoginResultLinksItem href(String href);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MobileSsoLoginResultLinksItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MobileSsoLoginResultLinksItem(...).copyWith(id: 12, name: "My name")
  /// ````
  MobileSsoLoginResultLinksItem call({String rel, String href});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMobileSsoLoginResultLinksItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMobileSsoLoginResultLinksItem.copyWith.fieldName(...)`
class _$MobileSsoLoginResultLinksItemCWProxyImpl
    implements _$MobileSsoLoginResultLinksItemCWProxy {
  const _$MobileSsoLoginResultLinksItemCWProxyImpl(this._value);

  final MobileSsoLoginResultLinksItem _value;

  @override
  MobileSsoLoginResultLinksItem rel(String rel) => this(rel: rel);

  @override
  MobileSsoLoginResultLinksItem href(String href) => this(href: href);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MobileSsoLoginResultLinksItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MobileSsoLoginResultLinksItem(...).copyWith(id: 12, name: "My name")
  /// ````
  MobileSsoLoginResultLinksItem call({
    Object? rel = const $CopyWithPlaceholder(),
    Object? href = const $CopyWithPlaceholder(),
  }) {
    return MobileSsoLoginResultLinksItem(
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

extension $MobileSsoLoginResultLinksItemCopyWith
    on MobileSsoLoginResultLinksItem {
  /// Returns a callable class that can be used as follows: `instanceOfMobileSsoLoginResultLinksItem.copyWith(...)` or like so:`instanceOfMobileSsoLoginResultLinksItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MobileSsoLoginResultLinksItemCWProxy get copyWith =>
      _$MobileSsoLoginResultLinksItemCWProxyImpl(this);
}

abstract class _$MobileSsoLoginResultRsCWProxy {
  MobileSsoLoginResultRs grantingTicket(String grantingTicket);

  MobileSsoLoginResultRs serviceTicket(String serviceTicket);

  MobileSsoLoginResultRs tgtExpiredTime(int tgtExpiredTime);

  MobileSsoLoginResultRs role(dynamic role);

  MobileSsoLoginResultRs openid(String openid);

  MobileSsoLoginResultRs nickname(dynamic nickname);

  MobileSsoLoginResultRs fullname(dynamic fullname);

  MobileSsoLoginResultRs username(dynamic username);

  MobileSsoLoginResultRs mobile(dynamic mobile);

  MobileSsoLoginResultRs email(dynamic email);

  MobileSsoLoginResultRs perms(dynamic perms);

  MobileSsoLoginResultRs isSsoLogin(String isSsoLogin);

  MobileSsoLoginResultRs isCompleted(dynamic isCompleted);

  MobileSsoLoginResultRs openidHash(String openidHash);

  MobileSsoLoginResultRs jwt(String jwt);

  MobileSsoLoginResultRs rt(String rt);

  MobileSsoLoginResultRs createTime(dynamic createTime);

  MobileSsoLoginResultRs status(int status);

  MobileSsoLoginResultRs source(dynamic source);

  MobileSsoLoginResultRs links(List<MobileSsoLoginResultLinksItem> links);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MobileSsoLoginResultRs(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MobileSsoLoginResultRs(...).copyWith(id: 12, name: "My name")
  /// ````
  MobileSsoLoginResultRs call({
    String grantingTicket,
    String serviceTicket,
    int tgtExpiredTime,
    dynamic role,
    String openid,
    dynamic nickname,
    dynamic fullname,
    dynamic username,
    dynamic mobile,
    dynamic email,
    dynamic perms,
    String isSsoLogin,
    dynamic isCompleted,
    String openidHash,
    String jwt,
    String rt,
    dynamic createTime,
    int status,
    dynamic source,
    List<MobileSsoLoginResultLinksItem> links,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMobileSsoLoginResultRs.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMobileSsoLoginResultRs.copyWith.fieldName(...)`
class _$MobileSsoLoginResultRsCWProxyImpl
    implements _$MobileSsoLoginResultRsCWProxy {
  const _$MobileSsoLoginResultRsCWProxyImpl(this._value);

  final MobileSsoLoginResultRs _value;

  @override
  MobileSsoLoginResultRs grantingTicket(String grantingTicket) =>
      this(grantingTicket: grantingTicket);

  @override
  MobileSsoLoginResultRs serviceTicket(String serviceTicket) =>
      this(serviceTicket: serviceTicket);

  @override
  MobileSsoLoginResultRs tgtExpiredTime(int tgtExpiredTime) =>
      this(tgtExpiredTime: tgtExpiredTime);

  @override
  MobileSsoLoginResultRs role(dynamic role) => this(role: role);

  @override
  MobileSsoLoginResultRs openid(String openid) => this(openid: openid);

  @override
  MobileSsoLoginResultRs nickname(dynamic nickname) => this(nickname: nickname);

  @override
  MobileSsoLoginResultRs fullname(dynamic fullname) => this(fullname: fullname);

  @override
  MobileSsoLoginResultRs username(dynamic username) => this(username: username);

  @override
  MobileSsoLoginResultRs mobile(dynamic mobile) => this(mobile: mobile);

  @override
  MobileSsoLoginResultRs email(dynamic email) => this(email: email);

  @override
  MobileSsoLoginResultRs perms(dynamic perms) => this(perms: perms);

  @override
  MobileSsoLoginResultRs isSsoLogin(String isSsoLogin) =>
      this(isSsoLogin: isSsoLogin);

  @override
  MobileSsoLoginResultRs isCompleted(dynamic isCompleted) =>
      this(isCompleted: isCompleted);

  @override
  MobileSsoLoginResultRs openidHash(String openidHash) =>
      this(openidHash: openidHash);

  @override
  MobileSsoLoginResultRs jwt(String jwt) => this(jwt: jwt);

  @override
  MobileSsoLoginResultRs rt(String rt) => this(rt: rt);

  @override
  MobileSsoLoginResultRs createTime(dynamic createTime) =>
      this(createTime: createTime);

  @override
  MobileSsoLoginResultRs status(int status) => this(status: status);

  @override
  MobileSsoLoginResultRs source(dynamic source) => this(source: source);

  @override
  MobileSsoLoginResultRs links(List<MobileSsoLoginResultLinksItem> links) =>
      this(links: links);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MobileSsoLoginResultRs(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MobileSsoLoginResultRs(...).copyWith(id: 12, name: "My name")
  /// ````
  MobileSsoLoginResultRs call({
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
    return MobileSsoLoginResultRs(
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
              : role as dynamic,
      openid:
          openid == const $CopyWithPlaceholder()
              ? _value.openid
              // ignore: cast_nullable_to_non_nullable
              : openid as String,
      nickname:
          nickname == const $CopyWithPlaceholder()
              ? _value.nickname
              // ignore: cast_nullable_to_non_nullable
              : nickname as dynamic,
      fullname:
          fullname == const $CopyWithPlaceholder()
              ? _value.fullname
              // ignore: cast_nullable_to_non_nullable
              : fullname as dynamic,
      username:
          username == const $CopyWithPlaceholder()
              ? _value.username
              // ignore: cast_nullable_to_non_nullable
              : username as dynamic,
      mobile:
          mobile == const $CopyWithPlaceholder()
              ? _value.mobile
              // ignore: cast_nullable_to_non_nullable
              : mobile as dynamic,
      email:
          email == const $CopyWithPlaceholder()
              ? _value.email
              // ignore: cast_nullable_to_non_nullable
              : email as dynamic,
      perms:
          perms == const $CopyWithPlaceholder()
              ? _value.perms
              // ignore: cast_nullable_to_non_nullable
              : perms as dynamic,
      isSsoLogin:
          isSsoLogin == const $CopyWithPlaceholder()
              ? _value.isSsoLogin
              // ignore: cast_nullable_to_non_nullable
              : isSsoLogin as String,
      isCompleted:
          isCompleted == const $CopyWithPlaceholder()
              ? _value.isCompleted
              // ignore: cast_nullable_to_non_nullable
              : isCompleted as dynamic,
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
              : createTime as dynamic,
      status:
          status == const $CopyWithPlaceholder()
              ? _value.status
              // ignore: cast_nullable_to_non_nullable
              : status as int,
      source:
          source == const $CopyWithPlaceholder()
              ? _value.source
              // ignore: cast_nullable_to_non_nullable
              : source as dynamic,
      links:
          links == const $CopyWithPlaceholder()
              ? _value.links
              // ignore: cast_nullable_to_non_nullable
              : links as List<MobileSsoLoginResultLinksItem>,
    );
  }
}

extension $MobileSsoLoginResultRsCopyWith on MobileSsoLoginResultRs {
  /// Returns a callable class that can be used as follows: `instanceOfMobileSsoLoginResultRs.copyWith(...)` or like so:`instanceOfMobileSsoLoginResultRs.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MobileSsoLoginResultRsCWProxy get copyWith =>
      _$MobileSsoLoginResultRsCWProxyImpl(this);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$MobileSsoLoginResultEquatableAnnotations on MobileSsoLoginResult {
  List<Object?> get _$props => [code, msg, rs];
}

extension _$MobileSsoLoginResultLinksItemEquatableAnnotations
    on MobileSsoLoginResultLinksItem {
  List<Object?> get _$props => [rel, href];
}

extension _$MobileSsoLoginResultRsEquatableAnnotations
    on MobileSsoLoginResultRs {
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
// JsonSerializableGenerator
// **************************************************************************

MobileSsoLoginResult _$MobileSsoLoginResultFromJson(
  Map<String, dynamic> json,
) => MobileSsoLoginResult(
  code: json['code'] as String? ?? '',
  msg: json['msg'] as String? ?? '',
  rs:
      json['rs'] == null
          ? MobileSsoLoginResultRs.emptyInstance()
          : MobileSsoLoginResultRs.fromJson(json['rs'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MobileSsoLoginResultToJson(
  MobileSsoLoginResult instance,
) => <String, dynamic>{
  'code': instance.code,
  'msg': instance.msg,
  'rs': instance.rs.toJson(),
};

MobileSsoLoginResultLinksItem _$MobileSsoLoginResultLinksItemFromJson(
  Map<String, dynamic> json,
) => MobileSsoLoginResultLinksItem(
  rel: json['rel'] as String? ?? '',
  href: json['href'] as String? ?? '',
);

Map<String, dynamic> _$MobileSsoLoginResultLinksItemToJson(
  MobileSsoLoginResultLinksItem instance,
) => <String, dynamic>{'rel': instance.rel, 'href': instance.href};

MobileSsoLoginResultRs _$MobileSsoLoginResultRsFromJson(
  Map<String, dynamic> json,
) => MobileSsoLoginResultRs(
  grantingTicket: json['grantingTicket'] as String? ?? '',
  serviceTicket: json['serviceTicket'] as String? ?? '',
  tgtExpiredTime: (json['tgtExpiredTime'] as num?)?.toInt() ?? 0,
  role: json['role'],
  openid: json['openid'] as String? ?? '',
  nickname: json['nickname'],
  fullname: json['fullname'],
  username: json['username'],
  mobile: json['mobile'],
  email: json['email'],
  perms: json['perms'],
  isSsoLogin: json['isSsoLogin'] as String? ?? '',
  isCompleted: json['isCompleted'],
  openidHash: json['openidHash'] as String? ?? '',
  jwt: json['jwt'] as String? ?? '',
  rt: json['rt'] as String? ?? '',
  createTime: json['createTime'],
  status: (json['status'] as num?)?.toInt() ?? 0,
  source: json['source'],
  links:
      (json['links'] as List<dynamic>?)
          ?.map(
            (e) => MobileSsoLoginResultLinksItem.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$MobileSsoLoginResultRsToJson(
  MobileSsoLoginResultRs instance,
) => <String, dynamic>{
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
