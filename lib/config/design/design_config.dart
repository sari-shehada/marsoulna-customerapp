import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsouly/extensions/responsiveness_extensions.dart';

class DesignConfig {
  static final topPaddingWithAppBar = Get.mediaQuery.padding.top +
      kToolbarHeight.responsiveFromHeight +
      10.responsiveFromHeight;
}
