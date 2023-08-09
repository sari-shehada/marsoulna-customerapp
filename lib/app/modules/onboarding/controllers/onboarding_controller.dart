import 'package:get/get.dart';
import 'package:marsoulna/app/routes/app_pages.dart';

import '../../../../config/navigation_keys/navigation_keys_config.dart';
import 'onboarding_tab_view_controller.dart';

class OnboardingController extends GetxController {
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
      toLoginPage();
    }
  }

  void toLoginPage() {
    //TODO: add shared prefs handling
    Get.offAllNamed(
      Routes.LOGIN,
      parameters: {
        NavigationKeysConfig.fromOnboarding: true.toString(),
      },
    );
  }

  Future<void> skip() async {
    toLoginPage();
  }
}
