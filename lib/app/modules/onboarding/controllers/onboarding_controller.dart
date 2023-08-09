import 'package:get/get.dart';

import 'onboarding_tab_view_controller.dart';

class OnboardingController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  OnboardingTabViewController get tabViewController =>
      Get.find<OnboardingTabViewController>();

  void back() {
    bool? result = tabViewController.animateToBack();
    if (result == false) {
      Get.back();
    }
  }

  void next() {
    bool? result = tabViewController.animateToNext();
    if (result == false) {
      //Add the transition to login
    }
  }

  Future<void> skip() async {}
}
