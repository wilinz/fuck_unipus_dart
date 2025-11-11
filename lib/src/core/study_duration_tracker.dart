import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';
import '../websocket/websocket_connect.dart';

/// WebSocket 学习时长追踪器
///
/// 用于连接到 Unipus 学习平台的 WebSocket 服务器，追踪用户的学习时长。
/// 支持自动重连、心跳保持和学习进度上报。
///
/// 使用示例:
/// ```dart
/// final tracker = StudyDurationTracker(
///   websocketUrl: 'https://ucontent.unipus.cn/unipusio/?uuid=xxx&token=yyy',
///   leaf: 'u1g2',
///   tutorialId: 'course-v1:Unipus+nhce_3_rw_1+2020_09',
///   url: 'https://ucontent.unipus.cn/_pc_default/pc.html?...',
///   enableLogging: true,
/// );
///
/// await tracker.connect();
/// // 学习完成后
/// await tracker.close();
/// ```
class StudyDurationTracker {
  /// WebSocket URL，包含 uuid 和 token 参数
  /// 例如: "https://ucontent.unipus.cn/unipusio/?uuid=xxx&token=yyy"
  final String websocketUrl;

  /// 模块标识符 (例如: "u1g2")
  final String leaf;

  /// 模块组标识符 (例如: "course-v1:Unipus+nhce_3_rw_2+2018_09")
  final String tutorialId;

  /// 当前正在学习的页面 URL
  /// 格式: https://ucontent.unipus.cn/_pc_default/pc.html?...#/course-v1:Unipus+nhce_3_rw_1_sz+2020_09/courseware/u1/u1g1/u1g2/__main
  final String url;

  /// HTTP User-Agent 头
  final String? userAgent;

  /// HTTP Cookie 头
  final String? cookie;

  /// 接收到 WebSocket 消息时调用的回调函数
  final void Function(String message)? onMessage;

  /// 发生错误时调用的回调函数
  final void Function(dynamic error)? onError;

  /// 连接关闭时调用的回调函数
  final void Function()? onDone;

  /// 开始重连时调用的回调函数
  final void Function(int attempt)? onReconnecting;

  /// 重连成功时调用的回调函数
  final void Function()? onReconnected;

  /// 日志处理器回调函数
  final void Function(String message)? onLog;

  /// 是否启用日志 (默认: false)
  final bool enableLogging;

  /// 是否启用自动重连 (默认: true)
  final bool autoReconnect;

  /// 最大重连尝试次数 (默认: 5, 0表示无限重试)
  final int maxReconnectAttempts;

  /// 重连基础延迟时间，单位毫秒 (默认: 1000ms)
  /// 实际延迟 = baseReconnectDelay * (2 ^ attempt)
  final int baseReconnectDelay;

  /// 用于通信的 WebSocket 通道
  WebSocketChannel? _channel;

  /// 用于发送定期 ping 消息的计时器
  Timer? _pingTimer;

  /// 连接状态标志
  bool _isConnected = false;

  /// 从服务器 open 消息中接收到的会话 ID
  String? _sessionId;

  /// Ping 间隔时间，单位毫秒 (默认 25000ms = 25秒)
  /// 服务器在 open 消息中指定此值
  int _pingInterval = 25000;

  /// Ping 超时时间，单位毫秒 (默认 20000ms = 20秒)
  /// 服务器在 open 消息中指定此值
  int _pingTimeout = 20000;

  /// 从 websocketUrl 中提取的 uuid (用户唯一标识符)
  late final String _uuid;

  /// 从 websocketUrl 中提取的 token (身份验证令牌)
  late final String _token;

  /// 从 url 中提取的第一个标签，通常是单元标识符 (例如: "u1")
  late final String _tag1;

  /// 从 url 中提取的第二个标签，通常是单元组标识符 (例如: "u1g1")
  late final String _tag2;

  String? _tag3;

  /// Socket.IO 消息 ID 计数器，每次发送消息时递增
  int _messageId = 0;

  /// 最新的 start 事件数据，用于断线重连
  Map<String, dynamic>? _latestStartData;

  /// 当前重连尝试次数
  int _reconnectAttempt = 0;

  /// 重连定时器
  Timer? _reconnectTimer;

  /// 是否正在重连
  bool _isReconnecting = false;

  /// 是否已手动关闭连接 (手动关闭时不自动重连)
  bool _isManualClose = false;

  StudyDurationTracker({
    required this.websocketUrl,
    required this.leaf,
    required this.tutorialId,
    required this.url,
    this.userAgent,
    this.cookie,
    this.onMessage,
    this.onError,
    this.onDone,
    this.onReconnecting,
    this.onReconnected,
    this.onLog,
    this.enableLogging = false,
    this.autoReconnect = true,
    this.maxReconnectAttempts = 0,
    this.baseReconnectDelay = 1000,
  }) {
    // 从 websocketUrl 中提取 uuid 和 token
    final wsUri = Uri.parse(websocketUrl);
    _uuid = wsUri.queryParameters['uuid'] ?? '';
    _token = wsUri.queryParameters['token'] ?? '';

    if (url.contains("uexercise.unipus.cn")) {
      final uri = Uri.parse(url);
      _tag1 = uri.queryParameters['exerciseId']!;
      _tag2 = '-2';
      _tag3 = uri.queryParameters['exerciseType']!;
    } else {
      // 从 url 中提取 tag1 和 tag2
      // URL 格式: https://ucontent.unipus.cn/_pc_default/pc.html?...#/course-v1:Unipus+nhce_3_rw_1_sz+2020_09/courseware/u1/u1g1/u1g2/__main
      // 提取 courseware 后面的路径部分: /u1/u1g1/u1g2/__main
      // tag1 = u1, tag2 = u1g1
      final tags = _extractTagsFromUrl(url);
      _tag1 = tags.$1;
      _tag2 = tags.$2;
    }
  }

  String getClientFromUrl(String url) {
    if (url.contains("uexercise.unipus.cn")) {
      return "作业系统pc";
    }
    return "U校园pc";
  }

  /// 内部日志方法
  void _log(String message) {
    if (enableLogging) {
      if (onLog != null) {
        onLog!(message);
      } else {
        print('[StudyDurationTracker] $message');
      }
    }
  }

  /// 连接到 WebSocket 服务器
  Future<void> connect() async {
    try {
      _log('正在连接到 WebSocket: $websocketUrl');

      // 构建带有 Engine.IO 参数的 WebSocket URL
      // websocketUrl 已经包含了 uuid 和 token，只需添加 EIO 和 transport
      final wsUrl = Uri.parse(websocketUrl);

      // 构建 headers
      final headers = <String, String>{};
      if (userAgent != null) {
        headers['User-Agent'] = userAgent!;
      }
      if (cookie != null && cookie!.isNotEmpty) {
        headers['Cookie'] = cookie!;
      }

      _log('WebSocket URL: ${wsUrl.toString()}');
      _log('Headers: ${headers.keys.join(", ")}');

      // 使用跨平台的 WebSocket 连接函数
      _channel = createWebSocketConnection(wsUrl, headers: headers);

      // 监听消息
      _channel!.stream.listen(
        _handleMessage,
        onError: (error) {
          _isConnected = false;
          onError?.call(error);
          _attemptReconnect();
        },
        onDone: () {
          final wasConnected = _isConnected;
          _isConnected = false;
          _pingTimer?.cancel();
          onDone?.call();

          // 只有在之前已连接且不是手动关闭的情况下才重连
          if (wasConnected && !_isManualClose) {
            _attemptReconnect();
          }
        },
        cancelOnError: true,
      );
    } catch (e) {
      onError?.call(e);
      _attemptReconnect();
    }
  }

  /// 处理接收到的 WebSocket 消息
  void _handleMessage(dynamic message) {
    final messageStr = message.toString();
    _log('收到消息: $messageStr');
    onMessage?.call(messageStr);

    // 解析 Engine.IO 协议消息
    if (messageStr.startsWith('0')) {
      // 服务器发送: Open 消息，包含会话配置
      // 样例: 0{"sid":"-Y4PJnFtC2CX0JdJBD5M","upgrades":[],"pingInterval":25000,"pingTimeout":20000}
      final jsonStr = messageStr.substring(1);
      final data = jsonDecode(jsonStr) as Map<String, dynamic>;
      _sessionId = data['sid'] as String?;
      _pingInterval = data['pingInterval'] as int? ?? 25000;
      _pingTimeout = data['pingTimeout'] as int? ?? 20000;

      _log(
        '收到 Open 消息: sid=$_sessionId, pingInterval=$_pingInterval, pingTimeout=$_pingTimeout',
      );

      // 启动 ping 定时器
      _startPingTimer();

      // 收到 open 消息后，等待服务器发送 Socket.IO 连接确认 (40)
    } else if (messageStr == '40') {
      // 服务器发送: Socket.IO 连接确认
      // 收到: 40
      _log('收到 Socket.IO 连接确认');
      // 现在客户端可以连接到命名空间
      _connectToNamespace();
    } else if (messageStr.startsWith('40/userActivities,')) {
      // 服务器发送: 命名空间已连接
      // 收到: 40/userActivities,
      _log('命名空间已连接');
      _isConnected = true;
      _sendStartEvent();
    } else if (messageStr.startsWith('43/userActivities,')) {
      // 服务器发送: 响应 start 事件
      // 样例: 43/userActivities,0[{"code":0,"msg":"ok","concurrent":1}]
      final match = RegExp(
        r'43/userActivities,\d+([\s\S]+)',
      ).firstMatch(messageStr);
      if (match == null) {
        _log('解析 Start 事件响应失败: 消息格式不匹配');
        return;
      }
      final jsonStr = match.group(1)!;
      try {
        final data = jsonDecode(jsonStr);
        if (data is List && data.isNotEmpty) {
          final response = data[0] as Map<String, dynamic>;
          if (response['code'] == 0) {
            _log('Start 事件响应成功: $response');
          } else {
            _log('Start 事件响应失败: $response');
          }
        }
      } catch (e) {
        _log('解析 Start 事件响应失败: $e');
      }
    } else if (messageStr == '3') {
      // 服务器发送: Pong 响应 - 连接仍活跃
      // 客户端发送 ping (2), 服务器响应 pong (3)
      _log('收到 Pong');
    }
  }

  /// 启动 ping 定时器
  void _startPingTimer() {
    _pingTimer?.cancel();
    _pingTimer = Timer.periodic(Duration(milliseconds: _pingInterval), (timer) {
      if (_isConnected) {
        _sendPing();
      }
    });
  }

  /// 发送 ping 消息
  ///
  /// 发送: 2
  void _sendPing() {
    _log('发送 Ping');
    _channel?.sink.add('2');
  }

  /// 连接到 /userActivities 命名空间
  ///
  /// 发送样例: 40/userActivities?uuid=xxxxx&token=yyyyy,
  void _connectToNamespace() {
    // 使用认证参数连接到 /userActivities 命名空间
    final namespaceMsg = '40/userActivities?uuid=$_uuid&token=$_token,';
    _log('连接到命名空间: $namespaceMsg');
    _channel?.sink.add(namespaceMsg);
  }

  /// 发送 start 事件 (内部使用)
  ///
  /// 在命名空间连接成功后自动调用
  /// 重连时会重置消息 ID 并使用最新保存的 start 数据
  void _sendStartEvent() {
    // 重连时重置消息 ID 为 0
    _messageId = 0;

    // 如果有保存的最新 start 数据，使用它；否则使用初始参数
    if (_latestStartData != null) {
      sendStart(
        newLeaf: _latestStartData!['module'],
        newUrl: _latestStartData!['url'],
      );
    } else {
      sendStart();
    }
  }

  /// 发送 start 事件以开始或更新学习时长追踪
  ///
  /// 可以多次调用此方法来更新当前学习的模块和页面
  ///
  /// 参数:
  /// - [newModule]: 新的模块标识符 (可选，不传则使用初始化时的 module)
  /// - [newUrl]: 新的页面 URL (可选，不传则使用初始化时的 url)
  ///
  /// 发送样例:
  /// 42/userActivities,2["start",{"client":"U校园pc","module":"u1g7","moduleGroup":"course-v1:Unipus+nhce_3_rw_1_sz+2020_09","url":"https://ucontent.unipus.cn/...","tag1":"u1","tag2":"u1g3","timer":1761521482151}]
  /// 42/userActivities,3["start",{"client":"U校园pc","module":"u1g8","moduleGroup":"course-v1:Unipus+nhce_3_rw_1_sz+2020_09","url":"https://ucontent.unipus.cn/...","tag1":"u1","tag2":"u1g3","timer":1761521482903}]
  void sendStart({String? newLeaf, String? newUrl}) {
    if (!_isConnected) {
      throw Exception('WebSocket is not connected');
    }

    // 使用新的参数或默认参数
    final currentModule = newLeaf ?? leaf;
    final currentUrl = newUrl ?? url;

    // 如果提供了新的 URL，需要重新提取 tag1 和 tag2
    String currentTag1 = _tag1;
    String currentTag2 = _tag2;

    if (newUrl != null) {
      final tags = _extractTagsFromUrl(newUrl);
      currentTag1 = tags.$1;
      currentTag2 = tags.$2;
    }

    // 构建 start 事件数据
    final eventData = {
      'client': getClientFromUrl(currentUrl),
      'module': currentModule,
      'moduleGroup': tutorialId,
      'url': currentUrl,
      'tag1': currentTag1,
      'tag2': currentTag2,
      if (_tag3 != null) 'tag3': _tag3,
      'timer': DateTime.now().millisecondsSinceEpoch,
    };

    // 保存最新的 start 数据，用于断线重连
    _latestStartData = {'module': currentModule, 'url': currentUrl};

    // 使用消息 ID 并递增
    final eventMsg =
        '42/userActivities,$_messageId["start",${jsonEncode(eventData)}]';
    _messageId++;

    _log(
      '发送 Start 事件: module=$currentModule, tag1=$currentTag1, tag2=$currentTag2, msg=$eventMsg',
    );
    _channel?.sink.add(eventMsg);
  }

  /// 从 URL 中提取 tag1 和 tag2
  ///
  /// 返回: (tag1, tag2)
  (String, String) _extractTagsFromUrl(String urlString) {
    final hashIndex = urlString.indexOf('#');
    if (hashIndex != -1) {
      final fragment = urlString.substring(hashIndex + 1);
      final coursewareIndex = fragment.indexOf('/courseware/');
      if (coursewareIndex != -1) {
        final pathAfterCourseware = fragment.substring(
          coursewareIndex + '/courseware/'.length,
        );
        final pathParts = pathAfterCourseware.split('/');
        if (pathParts.length >= 2) {
          return (pathParts[0], pathParts[1]);
        }
      }
    }
    return ('-1', '-1');
  }

  /// 向服务器发送自定义事件
  ///
  /// 发送样例: 42/userActivities,0["eventName",{"key":"value"}]
  void sendEvent(String event, Map<String, dynamic> data) {
    if (!_isConnected) {
      throw Exception('WebSocket is not connected');
    }
    final eventMsg =
        '42/userActivities,$_messageId["$event",${jsonEncode(data)}]';
    _messageId++;

    _log('发送自定义事件: $eventMsg');
    _channel?.sink.add(eventMsg);
  }

  /// 尝试重连到 WebSocket 服务器
  ///
  /// 使用指数退避策略 (exponential backoff)
  /// 延迟时间 = baseReconnectDelay * (2 ^ attempt)
  void _attemptReconnect() {
    // 如果未启用自动重连或已在重连中，则不执行
    if (!autoReconnect || _isReconnecting) {
      return;
    }

    // 检查是否超过最大重连次数 (0 表示无限重试)
    if (maxReconnectAttempts > 0 && _reconnectAttempt >= maxReconnectAttempts) {
      _log('已达到最大重连次数 ($maxReconnectAttempts)，停止重连');
      return;
    }

    _isReconnecting = true;
    _reconnectAttempt++;

    // 计算延迟时间: 指数退避
    // 第1次: 1000ms, 第2次: 2000ms, 第3次: 4000ms, 第4次: 8000ms, 第5次: 16000ms
    final delay = baseReconnectDelay * (1 << (_reconnectAttempt - 1));

    _log(
      '准备重连 (尝试 $_reconnectAttempt/${maxReconnectAttempts > 0 ? maxReconnectAttempts : "∞"})，延迟 ${delay}ms',
    );

    // 通知开始重连
    onReconnecting?.call(_reconnectAttempt);

    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(Duration(milliseconds: delay), () async {
      try {
        await connect();

        // 重连成功
        _reconnectAttempt = 0;
        _isReconnecting = false;
        _log('重连成功');
        onReconnected?.call();
      } catch (e) {
        // 重连失败，会在 connect() 的 catch 中再次调用 _attemptReconnect
        _log('重连失败: $e');
        _isReconnecting = false;
      }
    });
  }

  /// 检查 WebSocket 是否已连接
  bool get isConnected => _isConnected;

  /// 关闭 WebSocket 连接
  ///
  /// 设置 [manual] 为 true 时表示手动关闭，不会自动重连
  Future<void> close({bool manual = true}) async {
    _isManualClose = manual;
    _reconnectTimer?.cancel();
    _pingTimer?.cancel();
    _isConnected = false;

    _log('关闭 WebSocket 连接 (manual=$manual)');
    await _channel?.sink.close();
  }
}