import 'package:dio/dio.dart';

class RefererInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.headers['referer'] != null) {
      options.headers['referer'] = options.uri.toString();
    }
    handler.next(options);
  }
}
