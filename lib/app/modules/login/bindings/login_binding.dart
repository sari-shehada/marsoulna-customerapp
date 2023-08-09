import 'package:get/get.dart';

import 'package:marsoulna/app/modules/login/controllers/login_animation_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginAnimationController>(
      LoginAnimationController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
