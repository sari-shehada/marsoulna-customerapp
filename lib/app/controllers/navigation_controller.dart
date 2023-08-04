import 'package:get/get.dart';
import 'package:marsoulna/app/modules/home/views/home_view.dart';
import 'package:marsoulna/app/routes/app_pages.dart';

abstract class NavigationController {
  //This maybe removed later
  static void navigateFromLoader({
    required LoaderNavigationDestinations destination,
  }) {
    print('Get Routing ${Get.routing.current}');
    if (Get.routing.current != Routes.LOADER) {
      return;
    }
    switch (destination) {
      case LoaderNavigationDestinations.landing:
        {
          Get.offAllNamed(
            Routes.LANDING,
          );
        }
      case LoaderNavigationDestinations.loginPage:
        {
          Get.offAll(
            () => const HomeView(), //TODO: Change Later
            transition: Transition.noTransition,
            duration: 0.milliseconds,
          );
        }
      case LoaderNavigationDestinations.homePage:
        {
          Get.offAll(
            () => const HomeView(),
            transition: Transition.fadeIn,
            duration: 500.milliseconds,
          );
        }
    }
  }
}

enum LoaderNavigationDestinations {
  homePage,
  landing,
  loginPage,
}
