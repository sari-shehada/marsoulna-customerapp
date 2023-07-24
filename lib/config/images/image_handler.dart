import 'package:marsouly/config/images/image_keys.dart';
part 'shared_image_mapper.dart';

class ImageHandler {
  static const String assetsPath = 'assets/';
  static const String darkModePath = 'dark/';
  static const String lightModePath = 'light/';
  static const String sharedPath = 'shared/';

  static const String sharedImageFullPath = '$assetsPath$sharedPath';
  static String get notFoundSharedImagePath => 'notFound.png';
  String getSharedImagePath(SharedImageKey key) =>
      sharedImageFullPath +
      (_sharedImageToPath[key] ?? notFoundSharedImagePath);
}
