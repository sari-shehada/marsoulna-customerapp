import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:marsoulna/utils/bottom_sheet_utils/bottom_sheet_utils.dart';

import '../../../widgets/change_language_bottom_sheet.dart';

class LandingController extends GetxController {
  void toOnBoarding() {}

  Future<void> changeLanguage(BuildContext context) {
    return BottomSheetUtils.showBottomSheet(
      context: context,
      content: const ChangeLanguageBottomSheet(),
    );
  }
  //Add changing locale and theme
}
