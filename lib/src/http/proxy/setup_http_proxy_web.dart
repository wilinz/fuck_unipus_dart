import 'package:dio/dio.dart';

/// HTTP proxy configuration implementation - Web platform
///
/// Web platform does not support custom proxy and certificate validation, which are managed by the browser.
/// This function does nothing on the Web platform.
void setupHttpProxy(
  Dio dio, {
  String? proxyUrl,
  bool allowBadCertificate = false,
  dynamic Function()? customClientFactory,
}) {
  // The following features are not supported on Web platform and are managed by the browser:
  // - proxyUrl: Proxy settings are configured by the browser or system
  // - allowBadCertificate: Certificate validation is managed by the browser
  // - customClientFactory: Web platform does not use HttpClient

  if (proxyUrl != null || allowBadCertificate || customClientFactory != null) {
    // Can print warning in development mode
    print('Warning: HTTP proxy settings are not supported on Web platform');
  }
}
