import 'package:curved_progress_bar/curved_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:marsoulna/app/modules/onboarding/controllers/onboarding_tab_view_controller.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

class OnboardingNextButtonWidget extends GetView<OnboardingTabViewController> {
  const OnboardingNextButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    ColorScheme colorScheme = themeData.colorScheme;
    return SizedBox.square(
      dimension: 95.responsiveFromTextSize,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: controller.tabController.animation!,
            builder: (context, child) {
              return CurvedCircularProgressIndicator(
                value: controller.evaluateTween(
                  controller.nextButtonProgressTween,
                ),
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
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: colorScheme.shadow.withOpacity(.1),
                ),
              ],
            ),
            clipBehavior: Clip.hardEdge,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Get.find<OnboardingController>().next(),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 2.5.responsiveFromWidth,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: colorScheme.surface,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
