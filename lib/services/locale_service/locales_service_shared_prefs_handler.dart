import 'package:flutter/widgets.dart';
import 'package:marsouly/services/shared_prefs_service/shared_preferences_service.dart';

class LocalesServiceSharedPrefs {
  static Future<void> setLocale(String languageCode) async {
    await SharedPreferencesService.instance.setValue(
        key: _LocalesServiceSharedPrefsKeys.currentLocale, value: languageCode);
  }

  static Locale getLocale(String fallbackLocale) {
    String? res = SharedPreferencesService.instance
        .getValue<String>(key: _LocalesServiceSharedPrefsKeys.currentLocale);

    return Locale(res ?? fallbackLocale);
  }
}

enum _LocalesServiceSharedPrefsKeys {
  currentLocale,
}
