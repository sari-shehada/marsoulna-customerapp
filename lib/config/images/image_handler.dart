import 'package:marsouly/config/images/image_keys.dart';
part 'shared_image_mapper.dart';

class ImageHandler {
  static String get assetsPath => 'assets/';
  static String get darkModePath => 'dark/';
  static String get lightModePath => 'light/';
  static String get sharedPath => 'shared/';

  static String get sharedImageFullPath => '$assetsPath$sharedPath';
  static String get notFoundSharedImagePath => 'notFound.png';
  String getSharedImagePath(SharedImageKey key) =>
      sharedImageFullPath +
      (_sharedImageToPath[key] ?? notFoundSharedImagePath);
}
