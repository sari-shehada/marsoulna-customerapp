import 'package:flutter/material.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

import '../../../../../config/design/design_config.dart';
import '../../../../../utils/buttons/custom_back_button.dart';
import '../../../../../utils/spacing_utils/spacing_utils.dart';
import 'onboarding_next_button_widget.dart';
import 'onboarding_skip_button.dart';

class OnboardingPageButtons extends StatelessWidget {
  const OnboardingPageButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _OnboardingPageButtonsConstants.topButtonsPaddingFromSide,
      ),
      child: Column(
        children: [
          AddVerticalSpacing(
            value: _OnboardingPageButtonsConstants.topButtonsPaddingFromTop,
          ),
          Row(
            children: [
              CustomBackButton(
                onTap: () {},
              ),
              const Spacer(),
              OnboardingSkipButton(
                callback: () =>
                    print('Skip Button Called'), //TODO: Add skip behavior
              ),
            ],
          ),
          const Spacer(),
          const OnboardingNextButtonWidget(),
          AddVerticalSpacing(value: 10.responsiveFromHeight),
          AddVerticalSpacing(
            value: _OnboardingPageButtonsConstants.bottomPadding,
          ),
        ],
      ),
    );
  }
}

class _OnboardingPageButtonsConstants {
  static double get topButtonsPaddingFromTop =>
      (DesignConfig.deviceTopPadding + 10.responsiveFromHeight);
  static double get topButtonsPaddingFromSide => 35.responsiveFromWidth;
  static double get bottomPadding =>
      (DesignConfig.deviceBottomPadding + 30.responsiveFromHeight);
}
