import 'dart:async';

/// Abstract interface for session persistence
///
/// Similar to CookieJar, this provides a standard interface for
/// saving and loading session information.
abstract class SessionJar {
  /// Save session data for a specific user
  ///
  /// Parameters:
  /// - [user]: The user identifier to associate with this session
  /// - [sessionData]: The session data to save
  Future<void> saveSession(String user, Map<String, dynamic> sessionData);

  /// Load session data for a specific user
  ///
  /// Parameters:
  /// - [user]: The user identifier to load session for
  ///
  /// Returns:
  /// - The saved session data, or null if no session exists
  Future<Map<String, dynamic>?> loadSession(String user);

  /// Delete session data for a specific user
  ///
  /// Parameters:
  /// - [user]: The user identifier to delete session for
  Future<void> deleteSession(String user);

  /// Delete all sessions
  Future<void> deleteAll();
}