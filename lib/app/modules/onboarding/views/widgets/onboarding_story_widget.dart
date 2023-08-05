import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:marsoulna/config/design/design_config.dart';
import 'package:marsoulna/config/images/image_handler.dart';
import 'package:marsoulna/config/images/themed_image_keys.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';
import 'package:marsoulna/utils/spacing_utils/spacing_utils.dart';

class OnboardingStoryWidget extends StatelessWidget {
  const OnboardingStoryWidget({
    super.key,
    required this.svgImageKey,
    required this.titleText,
    required this.detailsText,
  });

  final ThemedImageKey svgImageKey;
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
            value: (DesignConfig.deviceTopPadding + 160).responsiveFromHeight,
          ),
          // Container(
          SizedBox(
            height: 280.responsiveFromHeight,
            width: 280.responsiveFromHeight,
            // decoration: BoxDecoration(
            //   color: colorScheme.primary,
            // ),
            child: SvgPicture.asset(
              ImageHandler.getThemedImagePath(svgImageKey),
            ),
          ),
          AddVerticalSpacing(value: 30.responsiveFromHeight),
          Text(
            titleText.tr,
            textAlign: TextAlign.center,
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.primary,
            ),
          ),
          AddVerticalSpacing(value: 20.responsiveFromHeight),
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
