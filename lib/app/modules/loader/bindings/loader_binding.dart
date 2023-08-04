import 'package:get/get.dart';

import '../controllers/loader_controller.dart';

class LoaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoaderController>(
      LoaderController(),
    );
  }
}
