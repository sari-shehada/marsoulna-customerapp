import 'package:flutter/material.dart';

import '../shared_prefs_service/shared_preferences_service.dart';

class ThemingServiceSharedPrefsHandler {
  static ThemeMode getCurrentThemeMode() {
    int? index = SharedPreferencesService.instance
        .getInt(SharedPrefsKey.currentThemeMode);
    return index == null ? ThemeMode.system : ThemeMode.values[index];
  }

  static Future<void> setCurrentThemeMode(ThemeMode mode) async {
    await SharedPreferencesService.instance.setInt(
      SharedPrefsKey.currentThemeMode,
      mode.index,
    );
  }
}
