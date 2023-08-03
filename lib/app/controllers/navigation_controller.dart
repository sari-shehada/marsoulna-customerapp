import 'package:get/get.dart';
import 'package:marsoulna/app/modules/home/views/home_view.dart';

abstract class NavigationController {
  static void navigateFromLoader({
    required LoaderNavigationDestinations destination,
  }) {
    print(Get.routing.current);
    switch (destination) {
      case LoaderNavigationDestinations.landing:
        {
          Get.offAll(
            () => const HomeView(), //TODO: Change Later
            transition: Transition.noTransition,
            duration: 0.milliseconds,
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
