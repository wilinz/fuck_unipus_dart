import 'dart:async';
import 'dart:convert';
import 'package:fuck_unipus/src/core/base_client.dart';

import '../http/decrypt_interceptor.dart';
import '../model/captcha_response/captcha_response.dart';
import '../model/class_block/class_block.dart';
import 'html_parser.dart';

typedef CaptchaHandler =
    Future<String> Function(CaptchaResponse captchaResponse);

class Unipus extends BaseClient {
  static const String unipusService = "https://u.unipus.cn/user/comm/login";

  static Future<Unipus> newInstance({
    required String cookieDir,
    String cookieSubDir = "default",
  }) async {
    final unipus = Unipus._();
    await unipus._init(
      service: unipusService,
      cookieDir: cookieDir,
      cookieSubDir: cookieSubDir,
    );
    return unipus;
  }

  Unipus._();

  Future<void> _init({
    required String service,
    required String cookieDir,
    required String cookieSubDir,
  }) async {
    await super.initDio(
      service: service,
      cookieDir: cookieDir,
      cookieSubDir: cookieSubDir,
    );
    dio.interceptors.add(UnipusDecryptInterceptor());
  }

  Future<List<ClassBlock>> getCourses() async {
    final response = await dio.get('/user/student?school_id=10196');
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

  Future<Map<String, dynamic>> getCourseLeafQuestions(
    String tutorialId,
    String leaf,
  ) async {
    final url =
        'https://ucontent.unipus.cn/course/api/pc/group/$tutorialId/$leaf/default/';

    try {
      final response = await dio.get(url);
      final data = response.data;

      // 获取 "group" 字段，如果存在则返回解析后的数据
      if (data['group'] != null) {
        return jsonDecode(data['group']);
      }

      return data;
    } catch (e) {
      throw Exception('Failed to fetch course leaf questions: $e');
    }
  }
}
