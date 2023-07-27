import 'package:flutter/material.dart';

import '../shared_prefs_service/shared_preferences_service.dart';

class ThemingServiceSharedPrefsHandler {
  static ThemeMode getCurrentThemeMode() {
    int? index = SharedPreferencesService.instance
        .getValue<int>(key: ThemingServiceSharedPrefsEnum.currentThemeMode);
    return index == null ? ThemeMode.system : ThemeMode.values[index];
  }

  static Future<void> setCurrentThemeMode(ThemeMode mode) async {
    await SharedPreferencesService.instance.setValue<int>(
      key: ThemingServiceSharedPrefsEnum.currentThemeMode,
      value: mode.index,
    );
  }
}

enum ThemingServiceSharedPrefsEnum {
  currentThemeMode,
}
