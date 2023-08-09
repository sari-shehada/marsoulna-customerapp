part of 'package:marsoulna/app/modules/onboarding/views/onboarding_view.dart';

class _DecorationContainers {
  static OnboardingTabViewController animationController = Get.find();
  static final List<Widget> decorationContainers = [
    _topLeftDecorationContainer,
    _topRightDecorationContainer,
    _bottomLeftDecorationContainer,
    _bottomRightDecorationContainer,
  ];

  static final OnboardingDecorationCircleWidget _topLeftDecorationContainer =
      OnboardingDecorationCircleWidget(
    top: 120.responsiveFromHeight,
    radius: 100.responsiveFromTextSize,
    tween: animationController.topLeftDecorationContainerXPositionTween,
  );
  static final OnboardingDecorationCircleWidget _topRightDecorationContainer =
      OnboardingDecorationCircleWidget(
    top: 150.responsiveFromHeight,
    radius: 230.responsiveFromTextSize,
    tween: animationController.topRightDecorationContainerXPositionTween,
  );
  static final OnboardingDecorationCircleWidget _bottomLeftDecorationContainer =
      OnboardingDecorationCircleWidget(
    top: 620.responsiveFromHeight,
    radius: 140.responsiveFromTextSize,
    tween: animationController.bottomLeftDecorationContainerXPositionTween,
  );
  static final OnboardingDecorationCircleWidget
      _bottomRightDecorationContainer = OnboardingDecorationCircleWidget(
    top: 570.responsiveFromHeight,
    radius: 55.responsiveFromTextSize,
    tween: animationController.bottomRightDecorationContainerXPositionTween,
  );
}
