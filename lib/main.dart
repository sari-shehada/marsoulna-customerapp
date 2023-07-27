import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:marsouly/config/global/global_config.dart';
import 'package:marsouly/config/themes/themes.dart';
import 'package:marsouly/services/theming_service/theming_service.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GlobalConfig.performInitialConfiguration();
  runApp(const Wrapper());
}

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), //TODO: Move Sizes to DesignConfig
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Application',
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          themeMode: ThemingService.instance.currentThemeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
        );
      },
    );
  }
}
