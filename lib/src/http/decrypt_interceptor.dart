import 'package:dio/dio.dart';
import 'dart:convert';

import '../core/decrypt.dart';

class DecryptInterceptor extends Interceptor {

  bool isUnipusEncryptedResponse(String url, String? contentType) {
    return url.startsWith("https://ucontent.unipus.cn/course/api/v3/content/course-v1") &&
        (contentType?.startsWith("application/json") ?? false);
  }

  String? tryDecryptContent(Map<String, dynamic> json) {
    String? contentStr = json['content'];
    String? kStr = json['k'];
    
    if (contentStr != null && kStr != null) {
      var decrypted = decryptUnipusContent(contentStr, kStr);
      return decrypted;
    }
    return null;
  }

  @override
  Future<Response> onResponse(
      Response response, ResponseInterceptorHandler handler) async {

    String urlStr = response.requestOptions.uri.toString();
    String? contentType = response.headers.value('content-type');

    if (!isUnipusEncryptedResponse(urlStr, contentType)) {
      handler.next(response);
      return response;
    }

    String? decryptedContent = tryDecryptContent(response.data);
    response.data = jsonDecode(decryptedContent ?? "{}");

    handler.next(response);
    return response;
  }
}