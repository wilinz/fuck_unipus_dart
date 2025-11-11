import 'package:dio/dio.dart';

// 条件导入：根据平台选择正确的实现
import 'setup_http_proxy_io.dart'
    if (dart.library.html) 'setup_http_proxy_web.dart';

export 'setup_http_proxy_io.dart'
    if (dart.library.html) 'setup_http_proxy_web.dart';

/// HTTP proxy configuration function - Cross-platform
///
/// Automatically selects the correct implementation based on the current platform:
/// - Non-Web platforms (mobile/desktop): Configures Dio's HttpClient proxy and certificate validation
/// - Web platform: No operation (proxy and certificate are managed by the browser)
///
/// Parameters:
/// - [dio]: Dio instance
/// - [proxyUrl]: Proxy server address (IO platforms only). Supports the following formats:
///   - Standard URL: `http://127.0.0.1:9000`, `https://127.0.0.1:9000`
///   - Host:Port: `127.0.0.1:9000` (defaults to HTTP proxy)
///   - Note: SOCKS proxies are not supported yet
/// - [allowBadCertificate]: Whether to allow invalid certificates (IO platforms only, default: false)
/// - [customClientFactory]: Custom HttpClient factory function (IO platforms only)
///   - Must return dart:io HttpClient or its subclass
///   - Throws ArgumentError if other types are returned
///
/// Usage examples:
/// ```dart
/// // Setup HTTP proxy (simple format)
/// final dio = Dio();
/// configureHttpProxy(dio, proxyUrl: 'http://127.0.0.1:9000');
///
/// // Setup HTTP proxy (standard URL format)
/// configureHttpProxy(dio, proxyUrl: 'http://127.0.0.1:9000');
///
/// // Setup HTTPS proxy
/// configureHttpProxy(dio, proxyUrl: 'https://127.0.0.1:9000');
///
/// // Setup proxy and allow invalid certificates
/// configureHttpProxy(
///   dio,
///   proxyUrl: 'http://127.0.0.1:9000',
///   allowBadCertificate: true,
/// );
///
/// // Use custom HttpClient
/// configureHttpProxy(
///   dio,
///   customClientFactory: () {
///     final client = HttpClient();
///     client.connectionTimeout = Duration(seconds: 10);
///     return client;
///   },
/// );
/// ```
void configureHttpProxy(
  Dio dio, {
  String? proxyUrl,
  bool allowBadCertificate = false,
  dynamic Function()? customClientFactory,
}) {
  setupHttpProxy(
    dio,
    proxyUrl: proxyUrl,
    allowBadCertificate: allowBadCertificate,
    customClientFactory: customClientFactory,
  );
}