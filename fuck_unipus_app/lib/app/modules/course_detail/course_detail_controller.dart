import 'package:get/get.dart';

import '../../data/unipus_service.dart';
import '../../routes/app_routes.dart';
import '../leaf_detail/leaf_detail_args.dart';
import 'course_detail_args.dart';
import 'course_unit_node.dart';

class CourseDetailController extends GetxController {
  CourseDetailController() : _service = Get.find<UnipusService>();

  final UnipusService _service;

  late final CourseDetailArgs args;

  final RxBool isLoading = false.obs;
  final RxnString errorMessage = RxnString();
  final RxList<CourseUnitNode> nodes = <CourseUnitNode>[].obs;
  final RxMap<String, dynamic> leafProgress = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
    final rawArgs = Get.arguments;
    if (rawArgs is CourseDetailArgs) {
      args = rawArgs;
    } else {
      throw ArgumentError('缺少课程参数');
    }
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      final progress = await _service.fetchCourseProgress(args.tutorialId);
      final progressUnits = _extractUnits(progress);
      final leaves = <String, dynamic>{};

      for (final entry in progressUnits.entries) {
        final leafProgressResponse = await _service.fetchCourseProgressLeaf(
          args.tutorialId,
          entry.key,
        );
        leaves.addAll(_extractLeafs(leafProgressResponse));
      }

      leafProgress.assignAll(leaves);

      final detail = await _service.fetchCourseDetail(args.tutorialId);
      final units = _extractUnitList(detail.$2);

      nodes.assignAll(_buildNodes(units, leaves, const []));
    } catch (e) {
      errorMessage.value = _formatError(e);
    } finally {
      isLoading.value = false;
    }
  }

  void openLeaf(CourseUnitNode node) {
    if (node.url.isEmpty) {
      return;
    }

    Get.toNamed(
      AppRoutes.leafDetail,
      arguments: LeafDetailArgs(
        tutorialId: args.tutorialId,
        url: node.url,
        title: node.title,
        indexPath: node.indexPath,
        required: node.required,
        passed: node.passed,
      ),
    );
  }

  Map<String, dynamic> _extractLeafs(Map<String, dynamic> response) {
    final rt = response['rt'];
    if (rt is Map<String, dynamic>) {
      final leafs = rt['leafs'];
      if (leafs is Map) {
        return Map<String, dynamic>.from(leafs as Map);
      }
    }
    return {};
  }

  Map<String, dynamic> _extractUnits(Map<String, dynamic> response) {
    final rt = response['rt'];
    if (rt is Map<String, dynamic>) {
      final units = rt['units'];
      if (units is Map) {
        return Map<String, dynamic>.from(units as Map);
      }
    }
    return {};
  }

  List<Map<String, dynamic>> _extractUnitList(Map<String, dynamic> detail) {
    final units = detail['units'];
    if (units is List) {
      return units
          .whereType<Map>()
          .map((e) => Map<String, dynamic>.from(e as Map))
          .toList();
    }
    return <Map<String, dynamic>>[];
  }

  List<CourseUnitNode> _buildNodes(
    List<Map<String, dynamic>> units,
    Map<String, dynamic> leafs,
    List<int> prefix,
  ) {
    final items = <CourseUnitNode>[];
    for (var i = 0; i < units.length; i++) {
      final unit = units[i];
      final title = unit['name']?.toString() ?? '<未命名>'; 
      final url = unit['url']?.toString() ?? '';
      final indexPath = List<int>.from(prefix)..add(i + 1);
      final progress = leafs[url];
      final required = _isRequired(progress);
      final passed = _isPassed(progress);

      final childrenRaw = unit['children'];
      final childrenUnits = <Map<String, dynamic>>[];
      if (childrenRaw is List) {
        for (final child in childrenRaw) {
          if (child is Map) {
            childrenUnits.add(Map<String, dynamic>.from(child as Map));
          }
        }
      }

      final children = _buildNodes(childrenUnits, leafs, indexPath);
      items.add(
        CourseUnitNode(
          title: title,
          url: url,
          indexPath: indexPath,
          required: required,
          passed: passed,
          children: children,
        ),
      );
    }
    return items;
  }

  bool _isRequired(dynamic progress) {
    if (progress is Map) {
      final strategies = progress['strategies'];
      if (strategies is Map && strategies['required'] == true) {
        return true;
      }
    }
    return false;
  }

  bool _isPassed(dynamic progress) {
    if (progress is Map) {
      final state = progress['state'];
      if (state is Map) {
        final passValue = state['pass'];
        if (passValue is int) {
          return passValue != 0;
        }
        if (passValue is bool) {
          return passValue;
        }
      }
    }
    return false;
  }

  String _formatError(Object error) {
    final text = error.toString();
    final index = text.indexOf(': ');
    if (index != -1) {
      return text.substring(index + 2).trim();
    }
    return text;
  }
}
