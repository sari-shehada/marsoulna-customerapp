import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marsouly/config/global/global_config.dart';
import 'package:marsouly/config/themes/themes.dart';
import 'package:marsouly/services/theming_service/theming_service.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GlobalConfig.performInitialConfiguration();
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
