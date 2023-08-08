import 'package:get/get.dart';

import 'package:marsoulna/app/modules/onboarding/controllers/onboarding_tab_view_controller.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingTabViewController>(
      () => OnboardingTabViewController(),
    );
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(),
    );
  }
}
