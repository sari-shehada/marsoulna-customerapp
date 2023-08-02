import '../../services/theming_service/theming_service.dart';

import 'themed_image_keys.dart';

part 'themed_image_map.dart';

class ImageHandler {
  static const String assetsPath = 'assets/';
  static const String darkModePath = '${assetsPath}dark/';
  static const String lightModePath = '${assetsPath}light/';
  static const String sharedImageFullPath = '${assetsPath}shared/';

  static const String notFoundImage = '${sharedImageFullPath}notFound.png';

  static String getThemedImagePath(ThemedImageKey key) {
    String? themedImageName = _themedImageToPath[key];
    if (themedImageName == null) {
      return notFoundImage;
    }
    return (ThemingService.instance.isDarkMode ? darkModePath : lightModePath) +
        (_themedImageToPath[key]!);
  }
}
