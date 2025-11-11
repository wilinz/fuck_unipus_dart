import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:fuck_unipus/src/core/session/session_jar.dart';

/// File-based implementation of SessionJar
///
/// Stores session data in JSON files, with each username having
/// its own directory, similar to PersistCookieJar.
class PersistSessionJar implements SessionJar {
  final String storagePath;

  /// Create a new PersistSessionJar
  ///
  /// Parameters:
  /// - [storagePath]: The root directory path where sessions will be stored
  PersistSessionJar({required this.storagePath});

  /// Get the session file path for a specific user
  File _getSessionFile(String user) {
    final userDir = Directory(path.join(storagePath, user));
    return File(path.join(userDir.path, 'session.json'));
  }

  @override
  Future<void> saveSession(
    String user,
    Map<String, dynamic> sessionData,
  ) async {
    final sessionFile = _getSessionFile(user);

    // Create directory if it doesn't exist
    if (!await sessionFile.parent.exists()) {
      await sessionFile.parent.create(recursive: true);
    }

    // Write session data to file
    await sessionFile.writeAsString(
      jsonEncode(sessionData),
      flush: true,
    );
  }

  @override
  Future<Map<String, dynamic>?> loadSession(String user) async {
    final sessionFile = _getSessionFile(user);

    if (!await sessionFile.exists()) {
      return null;
    }

    try {
      final content = await sessionFile.readAsString();
      final json = jsonDecode(content) as Map<String, dynamic>;

      // Return null if the session file is empty
      if (json.isEmpty) {
        return null;
      }

      return json;
    } catch (e) {
      // If the file is corrupted, delete it and return null
      try {
        await sessionFile.delete();
      } catch (_) {}
      return null;
    }
  }

  @override
  Future<void> deleteSession(String user) async {
    final sessionFile = _getSessionFile(user);

    if (await sessionFile.exists()) {
      await sessionFile.delete();
    }

    // Also try to delete the user directory if it's empty
    final userDir = sessionFile.parent;
    if (await userDir.exists()) {
      try {
        final isEmpty = await userDir.list().isEmpty;
        if (isEmpty) {
          await userDir.delete();
        }
      } catch (_) {
        // Ignore errors when checking/deleting directory
      }
    }
  }

  @override
  Future<void> deleteAll() async {
    final rootDir = Directory(storagePath);

    if (await rootDir.exists()) {
      await for (final entity in rootDir.list()) {
        if (entity is Directory) {
          try {
            await entity.delete(recursive: true);
          } catch (_) {
            // Ignore errors when deleting directories
          }
        }
      }
    }
  }
}
