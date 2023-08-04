import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

abstract class BottomSheetUtils {
  static Future<void> showBottomSheet(
      {required BuildContext context,
      required Widget content,
      bool isDismissible = true,
      bool enableDrag = true,
      AnimationController? transitionAnimationController}) async {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.responsiveFromWidth),
                  topRight: Radius.circular(18.responsiveFromWidth),
                ),
              ),
              // height: 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 20.responsiveFromHeight,
                    ),
                    height: 4.responsiveFromHeight,
                    width: 50.responsiveFromWidth,
                    decoration: BoxDecoration(
                      // color: const Color(0xFF303030),
                      color: Get.theme.colorScheme.primary.withOpacity(.6),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.responsiveFromWidth),
                      ),
                    ),
                  ),
                  content,
                ],
              ),
            ),
          );
        },
        // ignoreSafeArea: false,
        elevation: 0,
        enableDrag: enableDrag,
        isDismissible: isDismissible,
        transitionAnimationController: transitionAnimationController);
  }
}
