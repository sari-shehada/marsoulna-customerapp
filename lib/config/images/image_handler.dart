import 'package:flutter/material.dart';
import 'package:marsouly/config/images/themed_image_keys.dart';
part 'themed_image_mapper.dart';

class ImageHandler {
  static const String assetsPath = 'assets/';
  static const String darkModePath = '${assetsPath}dark/';
  static const String lightModePath = '${assetsPath}light/';
  static const String sharedImageFullPath = '${assetsPath}shared';

  static const String notFoundImage = '${sharedImageFullPath}notFound.png';

  String getThemedImagePath(ThemedImageKey key, BuildContext context) {
    String? themedImageName = _themedImageToPath[key];
    if (themedImageName == null) {
      return notFoundImage;
    }
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return (isDarkMode ? darkModePath : lightModePath) +
        (_themedImageToPath[key]!);
  }
}
