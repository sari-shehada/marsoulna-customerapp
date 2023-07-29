import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../config/design/design_config.dart';

import '../../../../utils/appbars/custom_appbar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        child: 'Test',
        backButtonEnabled: false,
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: ListView(
          padding: EdgeInsets.only(top: DesignConfig.topPaddingWithAppBar),
          children: [
            const Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () => controller.toggleTheme(),
              child: const Text('Toggle Theme Mode'),
            ),
            ElevatedButton(
              onPressed: () => controller.showDialog(),
              child: const Text('Dialog Test'),
            ),
            ...List.generate(
              100,
              (index) => Container(
                margin: EdgeInsets.all(40),
                height: 50,
                width: double.infinity,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
