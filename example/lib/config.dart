import 'dart:io';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable_annotations/equatable_annotations.dart';
import 'package:json5/json5.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class AppConfig with EquatableMixin {
  AppConfig({
    required this.platform,
    required this.username,
    this.password,
    this.cookieDir = './cookies',
    this.userAgent,
    this.openAi,
    this.itest,
    this.unipus,
  });

  @JsonKey(name: 'platform', defaultValue: 'itest')
  final String platform; // "itest" or "unipus"

  @JsonKey(name: 'username', defaultValue: '')
  final String username;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: 'cookie_dir', defaultValue: './cookies')
  final String cookieDir;

  @JsonKey(name: 'user_agent')
  final String? userAgent;

  @JsonKey(name: 'open_ai')
  final OpenAiConfig? openAi;

  @JsonKey(name: 'itest')
  final ItestConfig? itest;

  @JsonKey(name: 'unipus')
  final UnipusConfig? unipus;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigToJson(this);

  factory AppConfig.emptyInstance() => AppConfig(
        platform: 'itest',
        username: '',
      );

  @override
  List<Object?> get props => _$props;

  static String generateTemplate() {
    final template = {
      // 运行平台: "itest" 或 "unipus"
      'platform': 'itest',

      // 用户名 (必填)
      'username': 'your_username',

      // 密码 (可选，不填则在运行时输入)
      'password': null,

      // Cookie 存储目录
      'cookie_dir': './cookies',

      // 浏览器 User Agent (可选)
      'user_agent': null,

      // OpenAI 配置
      'open_ai': {
        'api_key': 'your_openai_api_key',
        'base_url': 'https://api.openai.com',
        'model': 'gpt-5-mini',
      },

      // iTest 平台配置
      'itest': {
        // Logger OpenID (可选，自动生成)
        'logger_open_id': null,
        // 考试 ID (可选，不填则在运行时选择)
        'exam_id': null,
        // 是否自动提交答案
        'auto_submit': false,
      },

      // Unipus 平台配置
      'unipus': {
        // 课程 tutorial_id (可选，不填则在运行时输入)
        'tutorial_id': null,
      },
    };

    return JSON5.stringify(template, space: 2);
  }

  static Future<AppConfig> loadFromFile(String path) async {
    final file = File(path);

    if (!await file.exists()) {
      throw Exception('配置文件不存在: $path');
    }

    final content = await file.readAsString();
    final json = JSON5.parse(content) as Map<String, dynamic>;

    return AppConfig.fromJson(json);
  }

  static Future<void> generateTemplateFile(String path) async {
    final file = File(path);

    if (await file.exists()) {
      throw Exception('配置文件已存在: $path');
    }

    final template = generateTemplate();
    await file.writeAsString(template);
    print('配置文件模板已生成: $path');
  }
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class OpenAiConfig with EquatableMixin {
  OpenAiConfig({
    required this.apiKey,
    this.baseUrl = 'https://api.openai.com',
    this.model = 'gpt-5-mini',
  });

  @JsonKey(name: 'api_key', defaultValue: '')
  final String apiKey;

  @JsonKey(name: 'base_url', defaultValue: 'https://api.openai.com')
  final String baseUrl;

  @JsonKey(name: 'model', defaultValue: 'gpt-5-mini')
  final String model;

  factory OpenAiConfig.fromJson(Map<String, dynamic> json) =>
      _$OpenAiConfigFromJson(json);

  Map<String, dynamic> toJson() => _$OpenAiConfigToJson(this);

  factory OpenAiConfig.emptyInstance() => OpenAiConfig(
        apiKey: '',
      );

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class ItestConfig with EquatableMixin {
  ItestConfig({
    this.loggerOpenId,
    this.examId,
    this.autoSubmit = false,
  });

  @JsonKey(name: 'logger_open_id')
  final String? loggerOpenId;

  @JsonKey(name: 'exam_id')
  final String? examId;

  @JsonKey(name: 'auto_submit', defaultValue: false)
  final bool autoSubmit;

  factory ItestConfig.fromJson(Map<String, dynamic> json) =>
      _$ItestConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ItestConfigToJson(this);

  factory ItestConfig.emptyInstance() => ItestConfig();

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: true)
class UnipusConfig with EquatableMixin {
  UnipusConfig({
    this.tutorialId,
  });

  @JsonKey(name: 'tutorial_id')
  final String? tutorialId;

  factory UnipusConfig.fromJson(Map<String, dynamic> json) =>
      _$UnipusConfigFromJson(json);

  Map<String, dynamic> toJson() => _$UnipusConfigToJson(this);

  factory UnipusConfig.emptyInstance() => UnipusConfig();

  @override
  List<Object?> get props => _$props;
}