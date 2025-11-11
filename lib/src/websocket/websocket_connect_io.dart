import 'dart:io';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// WebSocket 连接实现 - IO 平台 (移动端/桌面端)
///
/// 使用 IOWebSocketChannel 来创建 WebSocket 连接，支持所有 IO 平台参数
WebSocketChannel connectWebSocket(
  Uri wsUrl, {
  Iterable<String>? protocols,
  Map<String, dynamic>? headers,
  Duration? pingInterval,
  Duration? connectTimeout,
  Object? customClient,
  Object? binaryType,
}) {
  // IO 平台不支持 binaryType 参数，该参数会被忽略
  return IOWebSocketChannel.connect(
    wsUrl,
    protocols: protocols,
    headers: headers,
    pingInterval: pingInterval,
    connectTimeout: connectTimeout,
    customClient: customClient as HttpClient?,
  );
}