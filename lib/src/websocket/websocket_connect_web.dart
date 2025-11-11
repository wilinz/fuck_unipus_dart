import 'package:web_socket_channel/html.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// WebSocket 连接实现 - Web 平台
///
/// 使用 HtmlWebSocketChannel 来创建 WebSocket 连接
/// 注意: Web 平台支持 protocols 和 binaryType 参数，其他参数会被忽略
/// - headers: 由浏览器自动管理 (Cookie、User-Agent 等)
/// - pingInterval: 由浏览器自动管理
/// - connectTimeout: 由浏览器自动管理
/// - customClient: Web 平台不适用
WebSocketChannel connectWebSocket(
  Uri wsUrl, {
  Iterable<String>? protocols,
  Map<String, dynamic>? headers,
  Duration? pingInterval,
  Duration? connectTimeout,
  Object? customClient,
  Object? binaryType,
}) {
  // Web 平台的 WebSocket 支持 protocols 和 binaryType 参数
  // 浏览器会自动管理其他所有配置
  // binaryType 应该是 package:web_socket_channel 定义的 BinaryType 枚举
  return HtmlWebSocketChannel.connect(
    wsUrl,
    protocols: protocols,
    binaryType: binaryType as BinaryType?,
  );
}