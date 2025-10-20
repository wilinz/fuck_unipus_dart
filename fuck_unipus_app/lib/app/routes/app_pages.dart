import 'package:get/get.dart';

import '../modules/course_detail/course_detail_binding.dart';
import '../modules/course_detail/course_detail_view.dart';
import '../modules/course_list/course_list_binding.dart';
import '../modules/course_list/course_list_view.dart';
import '../modules/leaf_detail/leaf_detail_binding.dart';
import '../modules/leaf_detail/leaf_detail_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.courses,
      page: () => const CourseListView(),
      binding: CourseListBinding(),
    ),
    GetPage(
      name: AppRoutes.courseDetail,
      page: () => const CourseDetailView(),
      binding: CourseDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.leafDetail,
      page: () => const LeafDetailView(),
      binding: LeafDetailBinding(),
    ),
  ];
}
