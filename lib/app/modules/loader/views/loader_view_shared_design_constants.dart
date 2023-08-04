import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

class LoaderViewSharedDesignConstants {
  //App Icon
  static double get appIconTopPosition => 195.responsiveFromHeight;
  static double get appIconDimension => 160.responsiveFromHeight;

  //App Text
  static double get appTitleTopPosition => 645.responsiveFromHeight;
  static double get appTitleFontSize => 28.responsiveFromTextSize;
  static Color get appTitleFontColor => Get.theme.colorScheme.primary;

  static TextStyle get appTitleTextStyle => TextStyle(
        fontSize: appTitleFontSize,
        color: appTitleFontColor,
        fontWeight: FontWeight.bold,
      );
}
