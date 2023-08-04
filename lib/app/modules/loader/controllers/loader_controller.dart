import 'package:get/get.dart';
import 'package:marsoulna/app/controllers/navigation_controller.dart';

class LoaderController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    _performInitialLoading();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _performInitialLoading() async {
    await Future.delayed(500.milliseconds);
    NavigationController.navigateFromLoader(
      destination: LoaderNavigationDestinations.landing,
    );
  }
}
