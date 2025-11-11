// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppConfigCWProxy {
  AppConfig platform(String platform);

  AppConfig username(String username);

  AppConfig password(String? password);

  AppConfig cookieDir(String cookieDir);

  AppConfig userAgent(String? userAgent);

  AppConfig openAi(OpenAiConfig? openAi);

  AppConfig itest(ItestConfig? itest);

  AppConfig unipus(UnipusConfig? unipus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  AppConfig call({
    String platform,
    String username,
    String? password,
    String cookieDir,
    String? userAgent,
    OpenAiConfig? openAi,
    ItestConfig? itest,
    UnipusConfig? unipus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppConfig.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppConfig.copyWith.fieldName(...)`
class _$AppConfigCWProxyImpl implements _$AppConfigCWProxy {
  const _$AppConfigCWProxyImpl(this._value);

  final AppConfig _value;

  @override
  AppConfig platform(String platform) => this(platform: platform);

  @override
  AppConfig username(String username) => this(username: username);

  @override
  AppConfig password(String? password) => this(password: password);

  @override
  AppConfig cookieDir(String cookieDir) => this(cookieDir: cookieDir);

  @override
  AppConfig userAgent(String? userAgent) => this(userAgent: userAgent);

  @override
  AppConfig openAi(OpenAiConfig? openAi) => this(openAi: openAi);

  @override
  AppConfig itest(ItestConfig? itest) => this(itest: itest);

  @override
  AppConfig unipus(UnipusConfig? unipus) => this(unipus: unipus);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  AppConfig call({
    Object? platform = const $CopyWithPlaceholder(),
    Object? username = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? cookieDir = const $CopyWithPlaceholder(),
    Object? userAgent = const $CopyWithPlaceholder(),
    Object? openAi = const $CopyWithPlaceholder(),
    Object? itest = const $CopyWithPlaceholder(),
    Object? unipus = const $CopyWithPlaceholder(),
  }) {
    return AppConfig(
      platform:
          platform == const $CopyWithPlaceholder()
              ? _value.platform
              // ignore: cast_nullable_to_non_nullable
              : platform as String,
      username:
          username == const $CopyWithPlaceholder()
              ? _value.username
              // ignore: cast_nullable_to_non_nullable
              : username as String,
      password:
          password == const $CopyWithPlaceholder()
              ? _value.password
              // ignore: cast_nullable_to_non_nullable
              : password as String?,
      cookieDir:
          cookieDir == const $CopyWithPlaceholder()
              ? _value.cookieDir
              // ignore: cast_nullable_to_non_nullable
              : cookieDir as String,
      userAgent:
          userAgent == const $CopyWithPlaceholder()
              ? _value.userAgent
              // ignore: cast_nullable_to_non_nullable
              : userAgent as String?,
      openAi:
          openAi == const $CopyWithPlaceholder()
              ? _value.openAi
              // ignore: cast_nullable_to_non_nullable
              : openAi as OpenAiConfig?,
      itest:
          itest == const $CopyWithPlaceholder()
              ? _value.itest
              // ignore: cast_nullable_to_non_nullable
              : itest as ItestConfig?,
      unipus:
          unipus == const $CopyWithPlaceholder()
              ? _value.unipus
              // ignore: cast_nullable_to_non_nullable
              : unipus as UnipusConfig?,
    );
  }
}

extension $AppConfigCopyWith on AppConfig {
  /// Returns a callable class that can be used as follows: `instanceOfAppConfig.copyWith(...)` or like so:`instanceOfAppConfig.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppConfigCWProxy get copyWith => _$AppConfigCWProxyImpl(this);
}

abstract class _$OpenAiConfigCWProxy {
  OpenAiConfig apiKey(String apiKey);

  OpenAiConfig baseUrl(String baseUrl);

  OpenAiConfig model(String model);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OpenAiConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OpenAiConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  OpenAiConfig call({String apiKey, String baseUrl, String model});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOpenAiConfig.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOpenAiConfig.copyWith.fieldName(...)`
class _$OpenAiConfigCWProxyImpl implements _$OpenAiConfigCWProxy {
  const _$OpenAiConfigCWProxyImpl(this._value);

  final OpenAiConfig _value;

  @override
  OpenAiConfig apiKey(String apiKey) => this(apiKey: apiKey);

  @override
  OpenAiConfig baseUrl(String baseUrl) => this(baseUrl: baseUrl);

  @override
  OpenAiConfig model(String model) => this(model: model);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OpenAiConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OpenAiConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  OpenAiConfig call({
    Object? apiKey = const $CopyWithPlaceholder(),
    Object? baseUrl = const $CopyWithPlaceholder(),
    Object? model = const $CopyWithPlaceholder(),
  }) {
    return OpenAiConfig(
      apiKey:
          apiKey == const $CopyWithPlaceholder()
              ? _value.apiKey
              // ignore: cast_nullable_to_non_nullable
              : apiKey as String,
      baseUrl:
          baseUrl == const $CopyWithPlaceholder()
              ? _value.baseUrl
              // ignore: cast_nullable_to_non_nullable
              : baseUrl as String,
      model:
          model == const $CopyWithPlaceholder()
              ? _value.model
              // ignore: cast_nullable_to_non_nullable
              : model as String,
    );
  }
}

extension $OpenAiConfigCopyWith on OpenAiConfig {
  /// Returns a callable class that can be used as follows: `instanceOfOpenAiConfig.copyWith(...)` or like so:`instanceOfOpenAiConfig.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OpenAiConfigCWProxy get copyWith => _$OpenAiConfigCWProxyImpl(this);
}

abstract class _$ItestConfigCWProxy {
  ItestConfig loggerOpenId(String? loggerOpenId);

  ItestConfig examId(String? examId);

  ItestConfig autoSubmit(bool autoSubmit);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItestConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItestConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  ItestConfig call({String? loggerOpenId, String? examId, bool autoSubmit});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfItestConfig.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfItestConfig.copyWith.fieldName(...)`
class _$ItestConfigCWProxyImpl implements _$ItestConfigCWProxy {
  const _$ItestConfigCWProxyImpl(this._value);

  final ItestConfig _value;

  @override
  ItestConfig loggerOpenId(String? loggerOpenId) =>
      this(loggerOpenId: loggerOpenId);

  @override
  ItestConfig examId(String? examId) => this(examId: examId);

  @override
  ItestConfig autoSubmit(bool autoSubmit) => this(autoSubmit: autoSubmit);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItestConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItestConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  ItestConfig call({
    Object? loggerOpenId = const $CopyWithPlaceholder(),
    Object? examId = const $CopyWithPlaceholder(),
    Object? autoSubmit = const $CopyWithPlaceholder(),
  }) {
    return ItestConfig(
      loggerOpenId:
          loggerOpenId == const $CopyWithPlaceholder()
              ? _value.loggerOpenId
              // ignore: cast_nullable_to_non_nullable
              : loggerOpenId as String?,
      examId:
          examId == const $CopyWithPlaceholder()
              ? _value.examId
              // ignore: cast_nullable_to_non_nullable
              : examId as String?,
      autoSubmit:
          autoSubmit == const $CopyWithPlaceholder()
              ? _value.autoSubmit
              // ignore: cast_nullable_to_non_nullable
              : autoSubmit as bool,
    );
  }
}

extension $ItestConfigCopyWith on ItestConfig {
  /// Returns a callable class that can be used as follows: `instanceOfItestConfig.copyWith(...)` or like so:`instanceOfItestConfig.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ItestConfigCWProxy get copyWith => _$ItestConfigCWProxyImpl(this);
}

abstract class _$UnipusConfigCWProxy {
  UnipusConfig tutorialId(String? tutorialId);

  UnipusConfig reviewMode(bool reviewMode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnipusConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnipusConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  UnipusConfig call({String? tutorialId, bool reviewMode});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUnipusConfig.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUnipusConfig.copyWith.fieldName(...)`
class _$UnipusConfigCWProxyImpl implements _$UnipusConfigCWProxy {
  const _$UnipusConfigCWProxyImpl(this._value);

  final UnipusConfig _value;

  @override
  UnipusConfig tutorialId(String? tutorialId) => this(tutorialId: tutorialId);

  @override
  UnipusConfig reviewMode(bool reviewMode) => this(reviewMode: reviewMode);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnipusConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnipusConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  UnipusConfig call({
    Object? tutorialId = const $CopyWithPlaceholder(),
    Object? reviewMode = const $CopyWithPlaceholder(),
  }) {
    return UnipusConfig(
      tutorialId:
          tutorialId == const $CopyWithPlaceholder()
              ? _value.tutorialId
              // ignore: cast_nullable_to_non_nullable
              : tutorialId as String?,
      reviewMode:
          reviewMode == const $CopyWithPlaceholder()
              ? _value.reviewMode
              // ignore: cast_nullable_to_non_nullable
              : reviewMode as bool,
    );
  }
}

extension $UnipusConfigCopyWith on UnipusConfig {
  /// Returns a callable class that can be used as follows: `instanceOfUnipusConfig.copyWith(...)` or like so:`instanceOfUnipusConfig.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UnipusConfigCWProxy get copyWith => _$UnipusConfigCWProxyImpl(this);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$AppConfigEquatableAnnotations on AppConfig {
  List<Object?> get _$props => [
    platform,
    username,
    password,
    cookieDir,
    userAgent,
    openAi,
    itest,
    unipus,
  ];
}

extension _$OpenAiConfigEquatableAnnotations on OpenAiConfig {
  List<Object?> get _$props => [apiKey, baseUrl, model];
}

extension _$ItestConfigEquatableAnnotations on ItestConfig {
  List<Object?> get _$props => [loggerOpenId, examId, autoSubmit];
}

extension _$UnipusConfigEquatableAnnotations on UnipusConfig {
  List<Object?> get _$props => [tutorialId, reviewMode];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => AppConfig(
  platform: json['platform'] as String? ?? 'itest',
  username: json['username'] as String? ?? '',
  password: json['password'] as String?,
  cookieDir: json['cookie_dir'] as String? ?? './cookies',
  userAgent: json['user_agent'] as String?,
  openAi:
      json['open_ai'] == null
          ? null
          : OpenAiConfig.fromJson(json['open_ai'] as Map<String, dynamic>),
  itest:
      json['itest'] == null
          ? null
          : ItestConfig.fromJson(json['itest'] as Map<String, dynamic>),
  unipus:
      json['unipus'] == null
          ? null
          : UnipusConfig.fromJson(json['unipus'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
  'platform': instance.platform,
  'username': instance.username,
  'password': instance.password,
  'cookie_dir': instance.cookieDir,
  'user_agent': instance.userAgent,
  'open_ai': instance.openAi?.toJson(),
  'itest': instance.itest?.toJson(),
  'unipus': instance.unipus?.toJson(),
};

OpenAiConfig _$OpenAiConfigFromJson(Map<String, dynamic> json) => OpenAiConfig(
  apiKey: json['api_key'] as String? ?? '',
  baseUrl: json['base_url'] as String? ?? 'https://api.openai.com',
  model: json['model'] as String? ?? 'gpt-5-mini',
);

Map<String, dynamic> _$OpenAiConfigToJson(OpenAiConfig instance) =>
    <String, dynamic>{
      'api_key': instance.apiKey,
      'base_url': instance.baseUrl,
      'model': instance.model,
    };

ItestConfig _$ItestConfigFromJson(Map<String, dynamic> json) => ItestConfig(
  loggerOpenId: json['logger_open_id'] as String?,
  examId: json['exam_id'] as String?,
  autoSubmit: json['auto_submit'] as bool? ?? false,
);

Map<String, dynamic> _$ItestConfigToJson(ItestConfig instance) =>
    <String, dynamic>{
      'logger_open_id': instance.loggerOpenId,
      'exam_id': instance.examId,
      'auto_submit': instance.autoSubmit,
    };

UnipusConfig _$UnipusConfigFromJson(Map<String, dynamic> json) => UnipusConfig(
  tutorialId: json['tutorial_id'] as String?,
  reviewMode: json['review_mode'] as bool? ?? false,
);

Map<String, dynamic> _$UnipusConfigToJson(UnipusConfig instance) =>
    <String, dynamic>{
      'tutorial_id': instance.tutorialId,
      'review_mode': instance.reviewMode,
    };
