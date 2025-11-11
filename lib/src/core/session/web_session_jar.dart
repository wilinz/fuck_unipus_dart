import 'dart:async';
import 'dart:convert';
import 'package:web/web.dart' as web;
import 'package:fuck_unipus/src/core/session/session_jar.dart';

/// Web-based implementation of SessionJar using localStorage
///
/// Stores session data in browser's localStorage, with each username
/// having its own key.
class WebSessionJar implements SessionJar {
  static const String _keyPrefix = 'fuck_unipus_session_';

  /// Create a new WebSessionJar
  WebSessionJar();

  /// Get the localStorage key for a specific user
  String _getSessionKey(String user) {
    return '$_keyPrefix$user';
  }

  @override
  Future<void> saveSession(
    String user,
    Map<String, dynamic> sessionData,
  ) async {
    final key = _getSessionKey(user);
    final jsonString = jsonEncode(sessionData);
    web.window.localStorage.setItem(key, jsonString);
  }

  @override
  Future<Map<String, dynamic>?> loadSession(String user) async {
    final key = _getSessionKey(user);
    final jsonString = web.window.localStorage.getItem(key);

    if (jsonString == null) {
      return null;
    }

    try {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;

      // Return null if the session data is empty
      if (json.isEmpty) {
        return null;
      }

      return json;
    } catch (e) {
      // If the data is corrupted, remove it and return null
      web.window.localStorage.removeItem(key);
      return null;
    }
  }

  @override
  Future<void> deleteSession(String user) async {
    final key = _getSessionKey(user);
    web.window.localStorage.removeItem(key);
  }

  @override
  Future<void> deleteAll() async {
    // Get all keys that start with our prefix
    final keysToRemove = <String>[];
    for (var i = 0; i < web.window.localStorage.length; i++) {
      final key = web.window.localStorage.key(i);
      if (key != null && key.startsWith(_keyPrefix)) {
        keysToRemove.add(key);
      }
    }

    // Remove all matching keys
    for (final key in keysToRemove) {
      web.window.localStorage.removeItem(key);
    }
  }
}