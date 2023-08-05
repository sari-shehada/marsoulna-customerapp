import 'package:get/get.dart';

import 'package:marsoulna/app/modules/landing/controllers/landing_animation_controller.dart';

import '../controllers/landing_controller.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LandingAnimationController>(
      LandingAnimationController(),
    );
    Get.lazyPut<LandingController>(
      () => LandingController(),
    );
  }
}
