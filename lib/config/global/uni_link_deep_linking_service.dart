import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

import '../../app/routes/app_pages.dart';

//TODO: Generalize the usage for deep linking by providing a service and a callback handler to its initializer
class UniLinkDeepLinkingService {
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
