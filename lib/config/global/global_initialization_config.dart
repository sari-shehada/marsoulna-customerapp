class GlobalInitializationConfig {
  static bool _alreadyInitialized = false;

  static Future<void> performInitialConfiguration() async {
    if (_alreadyInitialized) return;
    //TODO: Add initialization here
    _alreadyInitialized = true;
  }
}
