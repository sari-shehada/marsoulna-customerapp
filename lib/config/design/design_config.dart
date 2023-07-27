import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../extensions/responsiveness_extensions.dart';

class DesignConfig {
  static const Size designSize = Size(390, 844);
  static final topPaddingWithAppBar = Get.mediaQuery.padding.top +
      kToolbarHeight.responsiveFromHeight +
      10.responsiveFromHeight;
}
