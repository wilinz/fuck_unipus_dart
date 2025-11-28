import 'dart:math';

/// Mobile App Configuration
///
/// Encapsulates all mobile app-specific headers and device information.
/// The User-Agent is automatically generated from appProd, osVer, clientVer, and model.
class MobileAppConfig {
  /// Device token for push notifications
  final String deviceToken;

  /// Unique device identifier
  final String deviceId;

  /// Universal device ID
  final String udid;

  /// Operating system name (e.g., "android", "ios")
  final String os;

  /// Operating system version (e.g., "android13")
  final String osVer;

  /// Device model (e.g., "22021211RC")
  final String model;

  /// App version (e.g., "1.0")
  final String appVer;

  /// App product name (e.g., "ucampus-student")
  final String appProd;

  /// JavaScript version models (e.g., "ucontent uex expm")
  final String jsVerModels;

  /// JavaScript version (e.g., "209547 209601 280")
  final String jsVer;

  /// Client version (e.g., "300130")
  final String clientVer;

  /// Application ID (e.g., "5")
  final String appId;

  MobileAppConfig({
    this.deviceToken = "",
    this.deviceId = "",
    this.udid = "",
    this.os = "android",
    this.osVer = "android13",
    this.model = "22021211RC",
    this.appVer = "1.0",
    this.appProd = "ucampus-student",
    this.jsVerModels = "ucontent uex expm",
    this.jsVer = "209547 209601 280",
    this.clientVer = "300130",
    this.appId = "5",
  });

  /// Generate User-Agent string from app configuration
  ///
  /// Format: "{appProd} {osVer} {clientVer} {model}"
  /// Example: "ucampus-student android13 300130 22021211RC"
  String get userAgent => "$appProd $osVer $clientVer $model";

  /// Create default Android configuration
  factory MobileAppConfig.defaultAndroid({
    String? deviceToken,
    String? deviceId,
    String? udid,
  }) {
    return MobileAppConfig(
      deviceToken: deviceToken ?? "",
      deviceId: deviceId ?? "",
      udid: udid ?? "",
    );
  }

  /// Create default iOS configuration
  factory MobileAppConfig.defaultIOS({
    String? deviceToken,
    String? deviceId,
    String? udid,
  }) {
    return MobileAppConfig(
      deviceToken: deviceToken ?? "",
      deviceId: deviceId ?? "",
      udid: udid ?? "",
      os: "ios",
      osVer: "ios16",
      model: "iPhone14,3",
    );
  }

  /// Create a random mobile app configuration
  ///
  /// Generates device identifiers and model info so each user can have a stable
  /// mobile fingerprint persisted across runs.
  factory MobileAppConfig.random({bool ios = false}) {
    final random = Random();

    String randomHex(int length) {
      const chars = '0123456789abcdef';
      return List.generate(length, (_) => chars[random.nextInt(chars.length)])
          .join();
    }

    String randomDigits(int length) {
      const digits = '0123456789';
      return List.generate(length, (_) => digits[random.nextInt(digits.length)])
          .join();
    }

    String randomUpper(int length) {
      const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      return List.generate(length, (_) => letters[random.nextInt(letters.length)])
          .join();
    }

    String randomAndroidModel() {
      final brand = [
        'samsung',
        'xiaomi',
        'redmi',
        'oppo',
        'vivo',
        'oneplus',
        'huawei',
      ][random.nextInt(7)];

      switch (brand) {
        case 'samsung':
          // Example: SM-S918B
          return "SM-${randomUpper(1)}${randomDigits(3)}${randomUpper(1)}";
        case 'xiaomi':
          // Example: M2012K11AC
          return "M2${randomDigits(3)}${randomUpper(1)}${randomDigits(2)}${randomUpper(1)}${randomUpper(1)}";
        case 'redmi':
          // Example: 22021211RC
          return "22${randomDigits(7)}${randomUpper(1)}${randomUpper(1)}";
        case 'oppo':
          // Example: CPH2401
          return "CPH${randomDigits(4)}";
        case 'vivo':
          // Example: V2149A
          return "V${randomDigits(4)}${randomUpper(1)}";
        case 'oneplus':
          // Example: NE2210
          return "NE${randomDigits(4)}";
        case 'huawei':
          // Example: PAR-LX9
          return "${randomUpper(3)}-${randomUpper(1)}${randomUpper(1)}${randomDigits(1)}";
        default:
          return "SM-${randomUpper(1)}${randomDigits(3)}${randomUpper(1)}";
      }
    }

    String randomIOSModel() {
      final family = random.nextInt(4) + 13; // 13-16
      final variant = random.nextInt(4) + 1; // 1-4
      return "iPhone$family,$variant";
    }

    return MobileAppConfig(
      deviceToken: randomHex(64),
      deviceId: randomHex(32),
      udid: randomHex(32),
      os: ios ? "ios" : "android",
      osVer: ios ? "ios${random.nextInt(4) + 14}" : "android${random.nextInt(5) + 10}",
      model: ios ? randomIOSModel() : randomAndroidModel(),
    );
  }

  /// Copy with method for updating specific fields
  MobileAppConfig copyWith({
    String? deviceToken,
    String? deviceId,
    String? udid,
    String? os,
    String? osVer,
    String? model,
    String? appVer,
    String? appProd,
    String? jsVerModels,
    String? jsVer,
    String? clientVer,
    String? appId,
  }) {
    return MobileAppConfig(
      deviceToken: deviceToken ?? this.deviceToken,
      deviceId: deviceId ?? this.deviceId,
      udid: udid ?? this.udid,
      os: os ?? this.os,
      osVer: osVer ?? this.osVer,
      model: model ?? this.model,
      appVer: appVer ?? this.appVer,
      appProd: appProd ?? this.appProd,
      jsVerModels: jsVerModels ?? this.jsVerModels,
      jsVer: jsVer ?? this.jsVer,
      clientVer: clientVer ?? this.clientVer,
      appId: appId ?? this.appId,
    );
  }

  /// Build HTTP headers map
  Map<String, String> toHeaders() {
    return {
      'uni-device-token': deviceToken,
      'uni-device-id': deviceId,
      'uni-udid': udid,
      'uni-os': os,
      'uni-os-ver': osVer,
      'uni-model': model,
      'uni-app-ver': appVer,
      'uni-app-prod': appProd,
      'uni-js-ver-models': jsVerModels,
      'uni-js-ver': jsVer,
      'uni-client-ver': clientVer,
      'appId': appId,
    };
  }

  factory MobileAppConfig.fromJson(Map<String, dynamic> json) {
    return MobileAppConfig(
      deviceToken: json['deviceToken'] as String? ?? "",
      deviceId: json['deviceId'] as String? ?? "",
      udid: json['udid'] as String? ?? "",
      os: json['os'] as String? ?? "android",
      osVer: json['osVer'] as String? ?? "android13",
      model: json['model'] as String? ?? "22021211RC",
      appVer: json['appVer'] as String? ?? "1.0",
      appProd: json['appProd'] as String? ?? "ucampus-student",
      jsVerModels: json['jsVerModels'] as String? ?? "ucontent uex expm",
      jsVer: json['jsVer'] as String? ?? "209547 209601 280",
      clientVer: json['clientVer'] as String? ?? "300130",
      appId: json['appId'] as String? ?? "5",
    );
  }

  Map<String, dynamic> toJson() => {
        'deviceToken': deviceToken,
        'deviceId': deviceId,
        'udid': udid,
        'os': os,
        'osVer': osVer,
        'model': model,
        'appVer': appVer,
        'appProd': appProd,
        'jsVerModels': jsVerModels,
        'jsVer': jsVer,
        'clientVer': clientVer,
        'appId': appId,
      };
}
