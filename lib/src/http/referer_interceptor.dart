import 'package:dio/dio.dart';

/// 模仿浏览器行为的 Referer 拦截器
/// 优先使用最后一次 HTML 页面的 URL 作为 Referer
class RefererInterceptor extends Interceptor {
  String? _lastHtmlPageUrl;  // 最后一次 HTML 页面的 URL
  String? _lastRequestUrl;   // 最后一次请求的 URL
  final bool autoSetReferer;
  final String? defaultReferer;
  final List<String> htmlContentTypes;

  RefererInterceptor({
    this.autoSetReferer = true,
    this.defaultReferer,
    this.htmlContentTypes = const [
      'text/html',
      'application/xhtml+xml',
    ],
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (autoSetReferer) {
      // 如果请求头中没有设置 Referer
      if (!options.headers.containsKey('Referer') &&
          !options.headers.containsKey('referer')) {

        String? referer;

        // 1. 优先使用最后一次 HTML 页面的 URL 作为 Referer
        if (_lastHtmlPageUrl != null) {
          referer = _lastHtmlPageUrl;
        }
        // 2. 如果没有 HTML 页面，使用最后一次请求的 URL
        else if (_lastRequestUrl != null) {
          referer = _lastRequestUrl;
        }
        // 3. 如果都没有，使用默认 Referer
        else if (defaultReferer != null) {
          referer = defaultReferer;
        }
        // 4. 否则使用当前请求的 origin 作为 Referer
        else {
          final uri = options.uri;
          referer = '${uri.scheme}://${uri.host}';
          if ((uri.scheme == 'http' && uri.port != 80) ||
              (uri.scheme == 'https' && uri.port != 443)) {
            referer += ':${uri.port}';
          }
        }

        if (referer != null) {
          options.headers['Referer'] = referer;
        }
      }
    }

    // 保存当前请求的完整 URL
    _lastRequestUrl = _buildFullUrl(options.uri);

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 检查响应的 Content-Type 是否为 HTML
    final contentType = response.headers.value('content-type')?.toLowerCase();

    if (contentType != null && _isHtmlContent(contentType)) {
      // 保存这次 HTML 页面的 URL
      _lastHtmlPageUrl = _buildFullUrl(response.requestOptions.uri);
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 即使请求出错，也检查是否是 HTML 响应
    if (err.response != null) {
      final contentType = err.response!.headers.value('content-type')?.toLowerCase();

      if (contentType != null && _isHtmlContent(contentType)) {
        _lastHtmlPageUrl = _buildFullUrl(err.requestOptions.uri);
      }
    }

    super.onError(err, handler);
  }

  /// 检查是否为 HTML 内容
  bool _isHtmlContent(String contentType) {
    return htmlContentTypes.any((type) => contentType.contains(type));
  }

  /// 构建完整的 URL（不包含 query 参数和 fragment）
  String _buildFullUrl(Uri uri) {
    String url = '${uri.scheme}://${uri.host}';

    if ((uri.scheme == 'http' && uri.port != 80) ||
        (uri.scheme == 'https' && uri.port != 443)) {
      url += ':${uri.port}';
    }

    url += uri.path;

    return url;
  }

  /// 清除保存的 Referer
  void clearReferer() {
    _lastHtmlPageUrl = null;
    _lastRequestUrl = null;
  }

  /// 清除 HTML 页面 Referer
  void clearHtmlReferer() {
    _lastHtmlPageUrl = null;
  }

  /// 手动设置下一次请求的 HTML 页面 Referer
  void setHtmlReferer(String url) {
    _lastHtmlPageUrl = url;
  }

  /// 获取当前的 HTML 页面 Referer
  String? get currentHtmlReferer => _lastHtmlPageUrl;

  /// 获取当前的最后请求 URL
  String? get currentRequestUrl => _lastRequestUrl;
}