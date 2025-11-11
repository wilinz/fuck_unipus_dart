import 'package:web_socket_channel/web_socket_channel.dart';

// 条件导入：根据平台选择正确的实现
import 'websocket_connect_io.dart'
    if (dart.library.html) 'websocket_connect_web.dart';

export 'websocket_connect_io.dart'
    if (dart.library.html) 'websocket_connect_web.dart';

/// WebSocket 连接函数 - 跨平台
///
/// 自动根据当前平台选择正确的 WebSocket 实现：
/// - 非 Web 平台 (移动端/桌面端): 使用 IOWebSocketChannel，支持 protocols、headers、pingInterval、connectTimeout、customClient
/// - Web 平台: 使用 HtmlWebSocketChannel，支持 protocols、binaryType，其他参数由浏览器管理
///
/// 参数:
/// - [wsUrl]: WebSocket URL
/// - [protocols]: WebSocket 子协议列表 (所有平台)
/// - [headers]: HTTP headers (仅在非 Web 平台有效)
/// - [pingInterval]: Ping 间隔时间 (仅在非 Web 平台有效)
/// - [connectTimeout]: 连接超时时间 (仅在非 Web 平台有效)
/// - [customClient]: 自定义 HttpClient (仅在非 Web 平台有效，需传入 HttpClient 实例)
/// - [binaryType]: 二进制数据类型 (仅在 Web 平台有效，需传入 package:web_socket_channel/html.dart 的 BinaryType)
///
/// 返回: WebSocketChannel 实例
WebSocketChannel createWebSocketConnection(
  Uri wsUrl, {
  Iterable<String>? protocols,
  Map<String, dynamic>? headers,
  Duration? pingInterval,
  Duration? connectTimeout,
  Object? customClient,
  Object? binaryType,
}) {
  return connectWebSocket(
    wsUrl,
    protocols: protocols,
    headers: headers,
    pingInterval: pingInterval,
    connectTimeout: connectTimeout,
    customClient: customClient,
    binaryType: binaryType,
  );
}