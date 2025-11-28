import 'dart:convert';
import 'dart:io';

import 'package:fuck_unipus/src/core/config/mobile_app_config.dart';

/// Unified JSON-based storage for user-specific persistent data.
class UserPersistentStore {
  UserPersistentStore({this.path = './user_data.json'});

  final String path;

  Future<Map<String, dynamic>> _readStore() async {
    final file = File(path);
    if (!await file.exists()) {
      return {};
    }
    try {
      final content = await file.readAsString();
      if (content.trim().isEmpty) return {};
      final decoded = jsonDecode(content);
      return decoded is Map<String, dynamic> ? decoded : {};
    } catch (_) {
      return {};
    }
  }

  Future<void> _writeStore(Map<String, dynamic> data) async {
    final file = File(path);
    if (!await file.parent.exists()) {
      await file.parent.create(recursive: true);
    }
    final encoder = const JsonEncoder.withIndent('  ');
    await file.writeAsString(encoder.convert(data), flush: true);
  }

  Future<Map<String, dynamic>> _ensureUserNode(
    Map<String, dynamic> store,
    String username,
  ) async {
    final users = (store['users'] as Map<String, dynamic>?) ?? {};
    store['users'] = users;
    final userNode = (users[username] as Map<String, dynamic>?) ?? {};
    users[username] = userNode;
    return userNode;
  }

  Future<String?> loadLoggerOpenId(String username) async {
    final store = await _readStore();
    final users = store['users'] as Map<String, dynamic>?;
    final userNode = users?[username] as Map<String, dynamic>?;
    return userNode?['logger_open_id'] as String?;
  }

  Future<void> saveLoggerOpenId(String username, String openId) async {
    final store = await _readStore();
    final userNode = await _ensureUserNode(store, username);
    userNode['logger_open_id'] = openId;
    await _writeStore(store);
  }

  Future<MobileAppConfig?> loadMobileAppConfig(String username) async {
    final store = await _readStore();
    final users = store['users'] as Map<String, dynamic>?;
    final userNode = users?[username] as Map<String, dynamic>?;
    final raw = userNode?['mobile_app_config'];
    if (raw is Map<String, dynamic>) {
      return MobileAppConfig.fromJson(raw);
    }
    return null;
  }

  Future<void> saveMobileAppConfig(
    String username,
    MobileAppConfig config,
  ) async {
    final store = await _readStore();
    final userNode = await _ensureUserNode(store, username);
    userNode['mobile_app_config'] = config.toJson();
    await _writeStore(store);
  }
}
