import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsouly/services/locale_service/locales_service.dart';

import 'app/routes/app_pages.dart';
import 'config/design/design_config.dart';
import 'config/global/global_config.dart';
import 'config/themes/themes.dart';
import 'generated/locales.g.dart';
import 'services/theming_service/theming_service.dart';

Future<void> main() async {
  await GlobalConfig.performInitialConfiguration();
  runApp(const Wrapper());
}

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: DesignConfig.designSize,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Marsoulna',
          initialRoute: AppPages.INITIAL,
          locale: LocalesService.instance.currentLocale,
          fallbackLocale: LocalesService.instance.fallbackLocale,
          getPages: AppPages.routes,
          themeMode: ThemingService.instance.currentThemeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
          translationsKeys: AppTranslation.translations,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
