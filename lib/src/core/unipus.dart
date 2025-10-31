import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:fuck_unipus/src/model/unipus/user_info/user_info.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:fuck_unipus/fuck_unipus.dart';
import 'package:html/parser.dart';

class Unipus extends BaseClient {
  static const String unipusService = "https://u.unipus.cn/user/comm/login";
  UnipusSessionInfo? sessionInfo;
  StudyDurationTracker? studyDurationTracker;

  static Future<Unipus> newInstance({
    required CookieJar cookieJar,
    String? userAgent,
  }) async {
    final unipus = Unipus._();
    await unipus._init(cookieJar: cookieJar, userAgent: userAgent);
    return unipus;
  }

  Unipus._();

  Future<void> _init({required CookieJar cookieJar, String? userAgent}) async {
    await super.initDio(cookieJar: cookieJar, userAgent: userAgent);
    final tokenInterceptor = InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (sessionInfo?.token != null) {
          options.headers['x-annotator-auth-token'] = sessionInfo!.token;
        }
        return handler.next(options);
      },
    );

    dio.interceptors.addAll([tokenInterceptor, UnipusDecryptInterceptor()]);
  }

  Future<UserInfo> getUserInfo({required String openId}) async {
    final random = Random();
    final callback =
        'jsonp_${DateTime.timestamp().millisecondsSinceEpoch}_${10000 + random.nextInt(90000)}';

    final response = await dio.get(
      'https://ucamapi.unipus.cn/rpc/api/user-info',
      queryParameters: {'openId': openId, 'source': 0, 'callback': callback},
    );

    return UserInfo.fromJson(response.data);
  }

  Future<List<UnipusClassBlock>> getCourses() async {
    final response = await dio.get('/user/student');
    return parseCoursesToJson(response.data);
  }

  Future<Map<String, dynamic>> getCourseProgress(String tutorialId) async {
    final openid = sessionInfo?.openid;
    if (openid == null) {
      throw Exception('Session openid is not available');
    }

    final url =
        'https://ucontent.unipus.cn/course/api/v2/course_progress/$tutorialId/$openid/default/';

    try {
      final response = await dio.get(url);
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch course progress: $e');
    }
  }

  Future<Map<String, dynamic>> getCourseProgressLeaf(
    String tutorialId,
    String leaf,
  ) async {
    final openid = sessionInfo?.openid;
    if (openid == null) {
      throw Exception('Session openid is not available');
    }

    final url =
        'https://ucontent.unipus.cn/course/api/v2/course_progress/$tutorialId/$leaf/$openid/default/';

    try {
      final response = await dio.get(url);

      // 解析 JSON 数据
      final data = response.data;
      return data;
    } catch (e) {
      throw Exception('Failed to fetch course progress leaf: $e');
    }
  }

  Future<(Map<String, dynamic>, Map<String, dynamic>)> getCourseDetail(
    String tutorialId,
  ) async {
    final url =
        'https://ucontent.unipus.cn/course/api/course/$tutorialId/default/';

    try {
      final response = await dio.get(url);

      // 解析 JSON 数据
      final data = response.data as Map<String, dynamic>;

      // 获取 "course" 字段
      final course = jsonDecode(data['course']) as Map<String, dynamic>;

      return (data, course);
    } catch (e) {
      throw Exception('Failed to fetch course detail: $e');
    }
  }

  Future<Map<String, dynamic>> getCourseLeafContent(
    String tutorialId,
    String leaf,
  ) async {
    final url =
        'https://ucontent.unipus.cn/course/api/v3/content/$tutorialId/$leaf/default/';

    try {
      final response = await dio.get(url);
      final data = response.data;
      return data;
    } catch (e) {
      throw Exception('Failed to fetch course leaf content: $e');
    }
  }

  Future<Map<String, dynamic>> getCourseSummary(
    String tutorialId,
    String leaf,
  ) async {
    final url =
        'https://ucontent.unipus.cn/course/api/pc/summary/$tutorialId/$leaf/default/';

    try {
      final response = await dio.get(url);
      final data = response.data;

      return data;
    } catch (e) {
      throw Exception('Failed to fetch course summary: $e');
    }
  }

  Future<Map<String, dynamic>> submitAnswer({
    required String tutorialId,
    required String leaf,
    required Map<String, dynamic> answer,
  }) async {
    final response = await dio.post(
      'https://ucontent.unipus.cn/course/api/v3/submit/$tutorialId/$leaf/',
      data: answer,
      options: Options(responseType: ResponseType.plain)
    );

    return jsonDecode(response.data);
  }

  static Map<String, dynamic> genAnswerBySummary(Map<String, dynamic> summary) {
    // 从输入中提取 summary 数据
    final summaryData = summary['summary'] as Map<String, dynamic>;
    final questionsList = summaryData['questionsList'] as List<dynamic>;

    // 构造 answers 对象
    final answers = <String, dynamic>{};

    for (int i = 0; i < questionsList.length; i++) {
      answers[i.toString()] = {
        // 'student_answer': null,
        'isDone': true,
        'version': 'v2',
        // 'rule': null,
        // 'user_answer': null,
        'score': 1,
      };
    }

    // 构造 specific_scores 数组
    final specificScores = List<dynamic>.filled(questionsList.length, null);

    // 构造输出对象
    return {
      'enable_mistake': false,
      'version': 'default',
      'record_version': '1761423350',
      'state': '',
      'specific_scores': specificScores,
      'answers': answers,
    };
  }

  // @visibleForTesting
  // static Map<String, dynamic> buildStateFromSummary({
  //   required Map<String, dynamic> summary,
  //   required String studentAnswer,
  //   double? score,
  // }) {
  //   final rawSummary = summary['summary'] as Map<String, dynamic>? ?? {};
  //   final indexMap = rawSummary['indexMap'] as Map<String, dynamic>? ?? {};
  //   final version = rawSummary['version']?.toString() ?? 'default';
  //
  //   final state = <String, dynamic>{'version': version};
  //
  //   indexMap.forEach((pageKey, pageNodes) {
  //     if (pageNodes is Map) {
  //       final pageState = <String, dynamic>{};
  //       pageNodes.forEach((componentKey, componentValue) {
  //         if (componentValue is Map) {
  //           final offset = 0;
  //           final mappedKey = '${componentKey}_$offset';
  //           pageState[mappedKey] = {
  //             'student_answers': {
  //               '0': studentAnswer,
  //             },
  //           };
  //         }
  //       });
  //       if (pageState.isNotEmpty) {
  //         state[pageKey] = pageState;
  //       }
  //     }
  //   });
  //
  //   state['__EXTEND_DATA__'] = {
  //     '__SUMMARY__': {
  //       'answerList': {
  //         '0': {
  //           'student_answer': studentAnswer,
  //           'isDone': true,
  //           'version': 'v2',
  //           'isRight': true,
  //           'score': score ?? 0,
  //           'signature': '',
  //           'rule': 'subjective',
  //           'pct': 1,
  //         },
  //       },
  //     },
  //   };
  //
  //   return state;
  // }
  //
  // @visibleForTesting
  // static Map<String, dynamic> buildAnswersFromState(Map<String, dynamic> state) {
  //   final extend = state['__EXTEND_DATA__'] as Map<String, dynamic>?;
  //   final summary = extend?['__SUMMARY__'] as Map<String, dynamic>?;
  //   final answerList = summary?['answerList'] as Map<String, dynamic>? ?? {};
  //   return answerList.map((key, value) => MapEntry(key, value));
  // }

  // purecontent
  Future<String> postProgress({
    required String tutorialId,
    required String leaf,
    String version = 'default',
  }) async {
    final payload = {
      'status': 1,
      'rid': 'flowengine:studyStatus:1:$leaf',
      'groupId': leaf,
      'version': version,
    };
    final response = await dio.post(
      'https://ucontent.unipus.cn/api/mobile/user_group/$tutorialId/$leaf/progress/',
      data: payload,
      options: Options(responseType: ResponseType.plain)
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getCourseLeafQuestions(
    String tutorialId,
    String leaf,
  ) async {
    final url =
        'https://ucontent.unipus.cn/course/api/pc/group/$tutorialId/$leaf/default/';

    dynamic data;
    try {
      final response = await dio.get(url);
      data = response.data;

      // 获取 "group" 字段，如果存在则返回解析后的数据
      if (data['group'] != null) {
        return jsonDecode(data['group']);
      }

      return data;
    } catch (e) {
      print(data);
      throw Exception('Failed to fetch course leaf questions: $e');
    }
  }

  @override
  String baseUrl = "https://u.unipus.cn";

  @override
  String service = unipusService;

  @override
  Future<bool> checkLoginAndSetupSession() async {
    final response = await dio.get('/user/student');
    final isAuthorized = response.data.contains('我的班课');

    if (isAuthorized) {
      sessionInfo = _extractSessionInfo(response.data);
    }
    return isAuthorized;
  }

  UnipusSessionInfo _extractSessionInfo(String html) {
    final document = parse(html);
    final name =
        document
            .querySelector('div.content_left_top_info_welcome label')
            ?.text
            .trim() ??
        '';

    // final client = _extractJsVariable(html, 'client');
    return UnipusSessionInfo(
      name: name,
      token: _extractJsVariable(html, 'token'),
      openid: _extractJsVariable(html, 'openId'),
      websocketUrl: _extractJsVariable(
        html,
        'wsURL',
      ), // wsURL:"https://ucontent.unipus.cn",
    );
  }

  String _extractJsVariable(String html, String variable) {
    final regex = RegExp('$variable:.*?"(.+?)"');
    return regex.firstMatch(html)?.group(1) ?? '';
  }

  /// 连接到学习时长追踪 WebSocket
  ///
  /// 参数:
  /// - [leaf]: 模块标识符 (例如: "u1g2")
  /// - [tutorialId]: 模块组标识符 (例如: "course-v1:Unipus+nhce_3_rw_2+2018_09")
  /// - [url]: 当前学习页面的 URL (会自动从中提取 tag1 和 tag2)
  /// - [client]: 客户端标识符 (默认: "U校园pc")
  /// - [onMessage]: 接收消息时的回调函数
  /// - [onError]: 发生错误时的回调函数
  /// - [onDone]: 连接关闭时的回调函数
  Future<StudyDurationTracker> connectStudyDurationTracker({
    required String leaf,
    required String tutorialId,
    required String pageUrl,
    String client = "U校园pc",
    void Function(String message)? onMessage,
    void Function(dynamic error)? onError,
    void Function()? onDone,
  }) async {
    if (sessionInfo == null) {
      throw Exception('Session info is not available. Please login first.');
    }

    // 获取 User-Agent
    final userAgent = dio.options.headers['User-Agent'] as String?;

    // 获取 Cookie
    var wsUri = Uri.parse('wss://ucontent.unipus.cn/unipusio/');

    Map<String, dynamic>? queryParameters = Map.of(wsUri.queryParameters);
    queryParameters['uuid'] = sessionInfo!.openid;
    queryParameters['token'] = sessionInfo!.token;
    queryParameters['transport'] = 'websocket';
    queryParameters['EIO'] = '3';

    wsUri = wsUri.replace(scheme: "wss", queryParameters: queryParameters);

    final cookies = await cookieJar.loadForRequest(wsUri);
    final cookieHeader = cookies.map((c) => '${c.name}=${c.value}').join('; ');


    final tracker = StudyDurationTracker(
      websocketUrl: wsUri.toString(),
      leaf: leaf,
      tutorialId: tutorialId,
      url: pageUrl,
      client: client,
      userAgent: userAgent,
      cookie: cookieHeader,
      onMessage: onMessage,
      onError: onError,
      onDone: onDone,
      enableLogging: true,
    );

    studyDurationTracker = tracker;

    await tracker.connect();
    return tracker;
  }

  static String buildStudyPageUrl({
    // required String classId,
    // required String schoolId,
    required String tutorialId,
    required String leafPath,
  }) {
    final url =
        // "https://ucontent.unipus.cn/_pc_default/pc.html?cid=$classId&appid=5&schId=$schoolId#/$tutorialId/courseware$leafPath/__main";
        "https://ucontent.unipus.cn/_pc_default/pc.html#/$tutorialId/courseware$leafPath/p_1";
    return url;
  }

}

/// 学习时长追踪 WebSocket 客户端
///
/// 该类实现了 Socket.IO 协议 (Engine.IO v3) 用于追踪 Unipus 平台上的用户学习活动
///
/// 协议流程 (正确的消息顺序):
/// 1. 客户端: 使用 uuid、token 和 Engine.IO 参数连接到 WebSocket 服务器
/// 2. 服务器→客户端: 发送 open 消息 (0{...}) 包含 sid、pingInterval、pingTimeout
/// 3. 服务器→客户端: 发送 Socket.IO 连接确认 (40)
/// 4. 客户端→服务器: 连接到 /userActivities 命名空间 (40/userActivities?uuid=...&token=...,)
/// 5. 服务器→客户端: 命名空间连接确认 (40/userActivities,)
/// 6. 客户端→服务器: 发送 "start" 事件 (42/userActivities,0["start",{...}])
/// 7. 服务器→客户端: 响应 start 事件 (43/userActivities,0[{...}])
/// 8. 保持连接: 客户端定期发送 ping (2)，服务器响应 pong (3)
///
/// 消息类型 (Engine.IO):
/// - 0: open - 服务器发送会话信息，包括 sid、pingInterval、pingTimeout
/// - 2: ping - 客户端发送以保持连接活跃
/// - 3: pong - 服务器响应 ping
/// - 40: Socket.IO 连接/确认
/// - 42: Socket.IO 事件 (例如 "start")
/// - 43: Socket.IO 确认 (acknowledgment)
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

  /// 客户端标识符 (默认: "U校园pc")
  final String client;

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
  IOWebSocketChannel? _channel;

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
    this.client = "U校园pc",
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

    // 从 url 中提取 tag1 和 tag2
    // URL 格式: https://ucontent.unipus.cn/_pc_default/pc.html?...#/course-v1:Unipus+nhce_3_rw_1_sz+2020_09/courseware/u1/u1g1/u1g2/__main
    // 提取 courseware 后面的路径部分: /u1/u1g1/u1g2/__main
    // tag1 = u1, tag2 = u1g1
    final hashIndex = url.indexOf('#');
    if (hashIndex != -1) {
      final fragment = url.substring(hashIndex + 1);
      // fragment 格式: /course-v1:Unipus+nhce_3_rw_1_sz+2020_09/courseware/u1/u1g1/u1g2/__main
      final coursewareIndex = fragment.indexOf('/courseware/');
      if (coursewareIndex != -1) {
        final pathAfterCourseware = fragment.substring(
          coursewareIndex + '/courseware/'.length,
        );
        // pathAfterCourseware: u1/u1g1/u1g2/__main
        final pathParts = pathAfterCourseware.split('/');
        if (pathParts.length >= 2) {
          _tag1 = pathParts[0]; // u1
          _tag2 = pathParts[1]; // u1g1
        } else {
          _tag1 = '-1';
          _tag2 = '-1';
        }
      } else {
        _tag1 = '-1';
        _tag2 = '-1';
      }
    } else {
      _tag1 = '-1';
      _tag2 = '-1';
    }
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

      // 使用 IOWebSocketChannel.connect 来设置 headers
      _channel = IOWebSocketChannel.connect(wsUrl, headers: headers);

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

      _log('收到 Open 消息: sid=$_sessionId, pingInterval=$_pingInterval, pingTimeout=$_pingTimeout');

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
      final match = RegExp(r'43/userActivities,\d+([\s\S]+)').firstMatch(messageStr);
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
      'client': client,
      'module': currentModule,
      'moduleGroup': tutorialId,
      'url': currentUrl,
      'tag1': currentTag1,
      'tag2': currentTag2,
      'timer': DateTime.now().millisecondsSinceEpoch,
    };

    // 保存最新的 start 数据，用于断线重连
    _latestStartData = {'module': currentModule, 'url': currentUrl};

    // 使用消息 ID 并递增
    final eventMsg =
        '42/userActivities,$_messageId["start",${jsonEncode(eventData)}]';
    _messageId++;

    _log('发送 Start 事件: module=$currentModule, tag1=$currentTag1, tag2=$currentTag2, msg=$eventMsg');
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

    _log('准备重连 (尝试 $_reconnectAttempt/${maxReconnectAttempts > 0 ? maxReconnectAttempts : "∞"})，延迟 ${delay}ms');

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
