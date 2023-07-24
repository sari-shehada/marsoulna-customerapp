class ImageHandler {
  static String get assetsPath => 'assets/';
  static String get darkModePath => 'light/';
  static String get lightModePath => 'dark/';
  static String get sharedPath => 'shared/';

  static String get sharedImageFullPath => '$assetsPath$sharedPath';

  String getSharedImagePath(String key) => sharedImageFullPath + key;
}
