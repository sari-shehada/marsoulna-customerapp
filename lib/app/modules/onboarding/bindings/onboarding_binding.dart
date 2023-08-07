import 'package:get/get.dart';

import 'package:marsoulna/app/modules/onboarding/controllers/onboarding_page_view_controller.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingPageViewController>(
      () => OnboardingPageViewController(),
    );
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(),
    );
  }
}
