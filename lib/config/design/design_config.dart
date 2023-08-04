import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../extensions/responsiveness_extensions.dart';

class DesignConfig {
  static const Size designSize = Size(390, 844);
  static final double topPaddingWithAppBar =
      Get.mediaQuery.padding.top + (kToolbarHeight + 10).responsiveFromHeight;
  static final double deviceTopPadding = Get.mediaQuery.padding.top;
  static final double deviceBottomPadding = Get.mediaQuery.padding.bottom;
}
