import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'config/scroll_behavior/scroll_behavior_config.dart';
import 'services/locale_service/locales_service.dart';

import 'app/routes/app_pages.dart';
import 'config/design/design_config.dart';
import 'config/global/global_config.dart';
import 'config/global/uni_link_deep_linking_service.dart';
import 'config/themes/themes.dart';
import 'generated/locales.g.dart';
import 'services/theming_service/theming_service.dart';

Future<void> main() async {
  await GlobalConfig.performInitialConfiguration();
  await UniLinkDeepLinkingService.initUniLinks();
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
          // themeMode: ThemeMode.light,
          // themeMode: ThemeMode.dark,
          theme: lightTheme,
          darkTheme: darkTheme,
          translationsKeys: AppTranslation.translations,
          debugShowCheckedModeBanner: false,
          scrollBehavior: const ScrollBehaviorConfig(),
          routingCallback: (routing) {
            print('Called ');
            if (routing == null) {
              return;
            }
            print('Current Route:${routing.current}');
            // if (routing.route!.isFirst) {
            //   // The app was launched from a deep link
            //   final uri = routing.route.settings;
            //   if (uri.path == '/product') {
            //     final productId = uri.queryParameters['id'];
            //     // Navigate to the product page with the given ID
            //     Get.toNamed('/product/$productId');
            //   }
            // }
          },
        );
      },
    );
  }
}
