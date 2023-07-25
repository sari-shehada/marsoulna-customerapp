import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marsouly/config/themes/themes.dart';
import 'package:marsouly/services/shared_prefs_service/shared_preferences_service.dart';
import 'package:marsouly/services/theming_service/theming_service.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  ThemingService.init();
  runApp(
    GetMaterialApp(
      title: 'Application',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemingService.instance.currentThemeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
    ),
  );
}
