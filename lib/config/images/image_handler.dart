import 'package:marsouly/config/images/themed_image_keys.dart';
part 'themed_image_mapper.dart';

class ImageHandler {
  static const String assetsPath = 'assets/';
  static const String darkModePath = '${assetsPath}dark/';
  static const String lightModePath = '${assetsPath}light/';
  static const String sharedImageFullPath = '${assetsPath}shared/';

  static const String notFoundImage = '${sharedImageFullPath}notFound.png';

  String getThemedImagePath(ThemedImageKey key, bool isDarkMode) {
    String? themedImageName = _themedImageToPath[key];
    if (themedImageName == null) {
      return notFoundImage;
    }
    return (isDarkMode ? darkModePath : lightModePath) +
        (_themedImageToPath[key]!);
  }
}
