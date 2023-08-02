import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../extensions/responsiveness_extensions.dart';
import '../../../../config/design/design_config.dart';

import '../../../../utils/appbars/custom_appbar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    ColorScheme colorScheme = themeData.colorScheme;
    TextTheme textTheme = themeData.textTheme;
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.responsiveFromHeight),
              height: 100.responsiveFromHeight,
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer,
              ),
              alignment: Alignment.center,
              child: Text(
                'مرحبا - Hello',
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.onSecondaryContainer,
                ),
              ),
            ),
            Text(
              'On Surface',
              style: textTheme.displayMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            Text(
              'On Surface Variant',
              style: textTheme.displayMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              'Outline',
              style: textTheme.displayMedium?.copyWith(
                color: colorScheme.outline,
              ),
            ),
            Text(
              'Outline Variant',
              style: textTheme.displayMedium?.copyWith(
                color: colorScheme.outlineVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
