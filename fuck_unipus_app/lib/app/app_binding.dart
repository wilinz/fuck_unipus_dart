import 'package:get/get.dart';

import 'data/unipus_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UnipusService>(UnipusService(), permanent: true);
  }
}
