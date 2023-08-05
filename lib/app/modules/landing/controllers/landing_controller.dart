import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/app/modules/landing/controllers/landing_animation_controller.dart';
import 'package:marsoulna/app/routes/app_pages.dart';

import 'package:marsoulna/utils/bottom_sheet_utils/bottom_sheet_utils.dart';

import '../../../widgets/change_language_bottom_sheet.dart';

class LandingController extends GetxController {
  RxBool isChangeLanguageSheetOpen = false.obs;
  Future<void> toOnBoarding() async {
    await Get.find<LandingAnimationController>().reverseAnimation();
    //TODO: Consider moving to navigation controller
    Get.offAllNamed(Routes.ONBOARDING);
  }

  Future<void> changeLanguage(BuildContext context) async {
    isChangeLanguageSheetOpen.value = true;
    await BottomSheetUtils.showBottomSheet(
      context: context,
      content: const ChangeLanguageBottomSheet(),
    );
    isChangeLanguageSheetOpen.value = false;
  }
}
