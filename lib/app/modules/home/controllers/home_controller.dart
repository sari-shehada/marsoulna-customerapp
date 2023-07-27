import 'package:get/get.dart';
import '../../../../services/theming_service/theming_service.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  void toggleTheme() => ThemingService.instance.toggleLightAndDarkTheme();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
