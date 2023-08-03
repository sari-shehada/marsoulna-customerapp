import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:marsoulna/config/images/shared_image_keys.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

import '../controllers/loader_controller.dart';

class LoaderView extends GetView<LoaderController> {
  const LoaderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 195.responsiveFromHeight,
            height: 160.responsiveFromHeight,
            width: 160.responsiveFromHeight,
            child: SvgPicture.asset(
              SharedImageKey.appIcon,
              color: colorScheme.primary,
            ),
          ),
          Positioned(
            top: 645.responsiveFromHeight,
            child: Text(
              'Marsoulna'.tr, //TODO:
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
