import 'package:curved_progress_bar/curved_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/app/modules/onboarding/controllers/onboarding_page_view_controller.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

class OnboardingNextButtonWidget extends StatelessWidget {
  const OnboardingNextButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    ColorScheme colorScheme = themeData.colorScheme;
    return SizedBox.square(
      dimension: 115.responsiveFromTextSize,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Obx(
            () => CurvedCircularProgressIndicator(
              value: Get.find<OnboardingPageViewController>()
                  .currentPercentage
                  .value,
              color: colorScheme.primary.withOpacity(0.7),
              strokeWidth: 7.responsiveFromWidth,
            ),
          ),
          Container(
            margin: EdgeInsets.all(13.responsiveFromTextSize),
            decoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              child: Icon(
                Icons.arrow_forward_ios,
                color: colorScheme.surface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
