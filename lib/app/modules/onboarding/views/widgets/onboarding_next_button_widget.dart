import 'package:curved_progress_bar/curved_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:marsoulna/app/modules/onboarding/controllers/onboarding_tab_view_controller.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

class OnboardingNextButtonWidget extends StatelessWidget {
  const OnboardingNextButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    ColorScheme colorScheme = themeData.colorScheme;
    final OnboardingTabViewController animationController = Get.find();
    return SizedBox.square(
      dimension: 115.responsiveFromTextSize,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: animationController.tabController.animation!,
            builder: (context, child) {
              return CurvedCircularProgressIndicator(
                value: animationController.nextButtonProgressValue,
                color: colorScheme.primary.withOpacity(0.7),
                strokeWidth: 7.responsiveFromWidth,
              );
            },
          ),
          Container(
            margin: EdgeInsets.all(13.responsiveFromTextSize),
            decoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.hardEdge,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Get.find<OnboardingController>().next(),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: colorScheme.surface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
