import 'package:flutter/material.dart';

import '../../services/shared_prefs_service/shared_preferences_service.dart';
import '../../services/theming_service/theming_service.dart';

class GlobalConfig {
  static bool _alreadyInitialized = false;

  static Future<void> performInitialConfiguration() async {
    if (_alreadyInitialized) return;
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPreferencesService.init();
    ThemingService.init();
    _alreadyInitialized = true;
  }
}
