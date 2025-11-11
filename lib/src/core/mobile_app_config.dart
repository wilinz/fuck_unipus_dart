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
      'Content-Type': 'text/plain;charset=utf-8',
    };
  }
}