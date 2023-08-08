import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/config/design/design_config.dart';
import 'package:marsoulna/config/images/themed_image_keys.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';
import 'package:marsoulna/utils/spacing_utils/spacing_utils.dart';

import '../../../../../config/images/image_handler.dart';

class OnboardingStoryWidget extends StatelessWidget {
  const OnboardingStoryWidget({
    super.key,
    required this.pngImageKey,
    required this.titleText,
    required this.detailsText,
  });

  final ThemedImageKey pngImageKey;
  final String titleText;
  final String detailsText;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    ColorScheme colorScheme = themeData.colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 40.responsiveFromWidth,
      ),
      child: Column(
        children: [
          AddVerticalSpacing(
            value: (DesignConfig.deviceTopPadding + 130) //Different from Figma
                .responsiveFromHeight,
          ),
          // Container(
          SizedBox.square(
            dimension: _OnBoardingStoryWidgetConstants.imageDimension,
            // height: _OnBoardingStoryWidgetConstants.imageDimension,
            // width: _OnBoardingStoryWidgetConstants.imageDimension,
            // decoration: BoxDecoration(
            //   color: Colors.black.withOpacity(.2),
            // ),
            child: Image.asset(
              ImageHandler.getThemedImagePath(pngImageKey),
              fit: BoxFit.contain,
            ),
          ),
          AddVerticalSpacing(
              value: 10.responsiveFromHeight), //Different from Figma
          Text(
            titleText.tr,
            textAlign: TextAlign.center,
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.primary,
            ),
          ),
          AddVerticalSpacing(
              value: 25.responsiveFromHeight), //Different from Figma
          Text(
            detailsText.tr,
            textAlign: TextAlign.center,
            style: textTheme.titleSmall?.copyWith(
              color: colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}

class _OnBoardingStoryWidgetConstants {
  static double get imageDimension => 310.responsiveFromHeight;
}
