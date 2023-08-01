import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsouly/services/locale_service/locales_service.dart';
import 'package:uni_links/uni_links.dart';

import 'app/routes/app_pages.dart';
import 'config/design/design_config.dart';
import 'config/global/global_config.dart';
import 'config/themes/themes.dart';
import 'generated/locales.g.dart';
import 'services/theming_service/theming_service.dart';

Future<void> main() async {
  await GlobalConfig.performInitialConfiguration();
  await Routing.initUniLinks();
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
          routingCallback: (routing) {
            print('Called ');
            if (routing == null) {
              return;
            }
            print(routing.current);
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

class Routing {
  static Future<void> initUniLinks() async {
    try {
      final initialLink = await getInitialUri();
      _handleLink(initialLink);
    } on Exception catch (e) {
      print('Error initializing uni_links: $e');
    }

    uriLinkStream.listen((Uri? link) {
      print('Path Was:${link?.path}');
      _handleLink(link);
    });
  }

  static void _handleLink(Uri? link) {
    if (link != null) {
      final path = link.path;
      if (path == Routes.LOADER) {
        Get.toNamed(Routes.LOADER);
      }
    }
  }
}
