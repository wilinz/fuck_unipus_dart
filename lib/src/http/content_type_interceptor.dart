import 'package:dio/dio.dart';

class JsonContentTypeInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // 获取返回的内容流
    final responseBodyStream = response.data;

    // 如果返回数据是Stream，我们就从Stream读取前几个字节
    if (responseBodyStream is Stream<List<int>>) {
      // 使用 await 读取流中的第一个数据块
      final firstBytes = await responseBodyStream.first;

      // 寻找第一个非空白字符
      int startIndex = 0;

      // 跳过前导空白字符（空格、制表符、换行符等）
      while (startIndex < firstBytes.length &&
          (firstBytes[startIndex] == 32 || // 空格
              firstBytes[startIndex] == 9 ||  // 制表符
              firstBytes[startIndex] == 10 || // 换行符
              firstBytes[startIndex] == 13)) { // 回车符
        startIndex++;
      }

      // 如果存在非空白字符
      if (startIndex < firstBytes.length) {
        // 判断第一个非空白字符是否是 '{' 或 '['
        if (firstBytes[startIndex] == 123 || firstBytes[startIndex] == 91) {
          // 设置 Content-Type 为 application/json
          response.headers.removeAll('content-type');
          response.headers.add('content-type', 'application/json');
        }
      }
    }

    // 继续传递响应
    return super.onResponse(response, handler);
  }
}