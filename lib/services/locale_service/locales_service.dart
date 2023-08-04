import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'locales_service_shared_prefs_handler.dart';

class LocalesService {
  final Locale fallbackLocale;
  Locale currentLocale;
  static late LocalesService instance;
  LocalesService({
    required this.fallbackLocale,
    required this.currentLocale,
  });

  static LocalesService init({String? fallbackLanguageCode}) {
    Locale fallbackLocale = Locale(fallbackLanguageCode ?? 'en');
    instance = LocalesService(
      fallbackLocale: fallbackLocale,
      currentLocale:
          LocalesServiceSharedPrefs.getLocale(fallbackLocale.languageCode),
    );
    return instance;
  }

  Future<Locale> setLocale({required Locale locale}) async {
    if (currentLocale == locale) {
      return currentLocale;
    }
    await LocalesServiceSharedPrefs.setLocale(locale.languageCode);
    await Get.updateLocale(locale);
    currentLocale = locale;
    return currentLocale;
  }
}
