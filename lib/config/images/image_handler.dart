import 'package:marsouly/config/images/themed_image_keys.dart';
part 'themed_image_mapper.dart';

class ImageHandler {
  static const String assetsPath = 'assets/';
  static const String sharedPath = 'shared/';
  static const String darkModePath = '${assetsPath}dark/';
  static const String lightModePath = '${assetsPath}light/';

  static const String sharedImageFullPath = '$assetsPath$sharedPath';
  static String get notFoundImage => '${sharedImageFullPath}notFound.png';

  String getThemedImagePath(ThemedImageKey key) {
    String? themedImageName = _themedImageToPath[key];
    if (themedImageName == null) {
      return notFoundImage;
    }
    return sharedImageFullPath + (_themedImageToPath[key]!);
  }
}
