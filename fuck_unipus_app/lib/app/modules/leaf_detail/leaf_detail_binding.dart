import 'package:get/get.dart';

import 'leaf_detail_controller.dart';

class LeafDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeafDetailController>(() => LeafDetailController());
  }
}
