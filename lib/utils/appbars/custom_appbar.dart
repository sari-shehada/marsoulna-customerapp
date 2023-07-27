import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsouly/extensions/responsiveness_extensions.dart';
import '../buttons/custom_back_button.dart';
import '../spacing_utils/spacing_utils.dart';

class CustomAppBar<T> extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.backButtonEnabled = true,
    this.centerTitle = false,
    this.backButtonOnTap,
    required this.child,
  });

  static const String _widgetLoggerAlias = 'Custom AppBar => ';

  final bool backButtonEnabled;
  final bool centerTitle;
  final T child;
  final VoidCallback? backButtonOnTap;

  @override
  Widget build(BuildContext context) {
    assert(child is String || child is Widget,
        '$_widgetLoggerAlias: Expected a Widget or String but got ${child.runtimeType}');
    return PreferredSize(
      preferredSize: preferredSize,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: double.infinity,
            // color: colorScheme.background.withOpacity(0.7),
            color: Colors.transparent,
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
              child: Builder(
                builder: (context) {
                  if (centerTitle && backButtonEnabled) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const AddHorizontalSpacing(value: 30),
                            CustomBackButton(
                              onTap: backButtonOnTap,
                            ),
                          ],
                        ),
                        Center(
                          child: buildAppropriateChild(child),
                        ),
                      ],
                    );
                  }
                  if (centerTitle && !backButtonEnabled) {
                    return Center(
                      child: buildAppropriateChild(child),
                    );
                  }
                  if (!centerTitle && !backButtonEnabled) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AddHorizontalSpacing(value: 30),
                        buildAppropriateChild(child),
                      ],
                    );
                  }
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AddHorizontalSpacing(value: 30),
                      CustomBackButton(onTap: backButtonOnTap),
                      const AddHorizontalSpacing(value: 15),
                      buildAppropriateChild(child),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAppropriateChild(T child) {
    if (child is String) {
      return Text(
        child,
        style: Get.textTheme.titleLarge!.copyWith(
            color: Get.theme.colorScheme.primary,
            fontWeight: FontWeight.normal),
      );
    }
    return child as Widget;
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight.responsiveFromHeight);
}

abstract class CustomAppBarConstants {
  static const double appBarHeight = 80;
}
