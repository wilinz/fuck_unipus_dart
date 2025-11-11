import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

/// HTTP proxy configuration implementation - IO platforms (mobile/desktop)
///
/// Configures HTTP proxy and certificate validation for Dio.
///
/// Supports HTTP/HTTPS proxy formats:
/// - Standard URL: `http://127.0.0.1:9000`, `https://127.0.0.1:9000`
/// - Simple format: `127.0.0.1:9000` (defaults to HTTP proxy)
///
/// Note: SOCKS proxies are not supported yet
void setupHttpProxy(
  Dio dio, {
  String? proxyUrl,
  bool allowBadCertificate = false,
  dynamic Function()? customClientFactory,
}) {
  if (dio.httpClientAdapter is! IOHttpClientAdapter) {
    throw Exception('Current Dio instance does not use IOHttpClientAdapter');
  }

  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    // Call custom factory or create default HttpClient
    HttpClient client;
    if (customClientFactory != null) {
      final result = customClientFactory();
      if (result is! HttpClient) {
        throw ArgumentError(
          'customClientFactory must return HttpClient, '
          'got: ${result.runtimeType}',
        );
      }
      client = result;
    } else {
      client = HttpClient();
    }

    // Setup proxy
    if (proxyUrl != null) {
      final proxyUri = Uri.parse(proxyUrl);
      _validateProxyScheme(proxyUri.scheme);
      final proxy = _formatProxyFromUri(proxyUri);
      client.findProxy = (uri) => proxy;
    }

    // Setup certificate validation
    if (allowBadCertificate) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    }

    return client;
  };
}

/// Validate proxy scheme
///
/// Throws [UnsupportedError] if the scheme is not supported
void _validateProxyScheme(String scheme) {
  final normalizedScheme = scheme.toLowerCase();
  if (normalizedScheme != 'http' && normalizedScheme != 'https') {
    throw UnsupportedError(
      'Unsupported proxy protocol: $scheme. '
      'Only HTTP and HTTPS proxies are supported. '
      'SOCKS proxies are not supported yet.',
    );
  }
}

/// Format Uri to PAC proxy string
///
/// Returns PAC format string like "PROXY 127.0.0.1:9000"
String _formatProxyFromUri(Uri uri) {
  final host = uri.host;
  final port = uri.hasPort ? uri.port : _getDefaultPort(uri.scheme);
  return 'PROXY $host:$port';
}

/// Get default port for proxy scheme
int _getDefaultPort(String scheme) {
  switch (scheme.toLowerCase()) {
    case 'http':
      return 80;
    case 'https':
      return 443;
    default:
      return 80;
  }
}