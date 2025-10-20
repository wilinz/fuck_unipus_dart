import 'package:get/get.dart';

import 'package:fuck_unipus/fuck_unipus.dart';

import '../../data/unipus_service.dart';
import '../../routes/app_routes.dart';
import '../course_detail/course_detail_args.dart';

class CourseListController extends GetxController {
  CourseListController() : _service = Get.find<UnipusService>();

  final UnipusService _service;

  final RxBool isLoading = false.obs;
  final RxnString errorMessage = RxnString();
  final RxList<UnipusClassBlock> classes = <UnipusClassBlock>[].obs;
  final Rxn<UnipusSessionInfo> sessionInfo = Rxn<UnipusSessionInfo>();

  @override
  void onInit() {
    super.onInit();
    sessionInfo.value = _service.sessionInfo;
    loadCourses();
  }

  Future<void> loadCourses() async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      final result = await _service.fetchCourses();
      print(result);
      classes.assignAll(result);
      sessionInfo.value = _service.sessionInfo;
    } catch (e) {
      errorMessage.value = _formatError(e);
    } finally {
      isLoading.value = false;
    }
  }

  void openCourse(
    UnipusClassBlock classBlock,
    UnipusClassBlockCoursesItem course,
  ) {
    final tutorialId = course.tutorialId;
    if (tutorialId == null || tutorialId.isEmpty) {
      errorMessage.value = '未找到 tutorial_id';
      return;
    }

    Get.toNamed(
      AppRoutes.courseDetail,
      arguments: CourseDetailArgs(
        tutorialId: tutorialId,
        courseName: course.courseName ?? '未命名课程',
        className: classBlock.className,
        status: course.status,
      ),
    );
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
