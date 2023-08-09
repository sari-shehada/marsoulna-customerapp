import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';
import 'package:marsoulna/utils/spacing_utils/spacing_utils.dart';

import '../../../../../config/design/container_config.dart';
import '../../../../../generated/locales.g.dart';

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({
    super.key,
    required this.callback,
  });
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    ColorScheme colorScheme = themeData.colorScheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: ContainerConfig.defaultBorderRadius,
      ),
      height: 50.responsiveFromHeight,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: callback,
          borderRadius: ContainerConfig.defaultBorderRadius,
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 10.responsiveFromWidth,
              end: 5.responsiveFromWidth,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LocaleKeys.commonLocaleSkip.tr,
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.secondary,
                  ),
                ),
                AddHorizontalSpacing(value: 20.responsiveFromWidth),
                Icon(
                  Icons.arrow_forward_ios,
                  color: colorScheme.secondary,
                  size: 20.responsiveFromTextSize,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
