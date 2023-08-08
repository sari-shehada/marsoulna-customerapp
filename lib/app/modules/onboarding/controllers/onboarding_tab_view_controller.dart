import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

class OnboardingTabViewController extends GetxController
    with GetTickerProviderStateMixin {
  late final TabController tabController;
  int get pagesCount => _OnboardingPageViewControllerConstants.storiesCount;

  //Tweens
  Tween<double> nextButtonProgressTween =
      _OnboardingPageViewControllerConstants.nextButtonProgressTween;
  Tween<double> topLeftDecorationContainerXPositionTween =
      _OnboardingPageViewControllerConstants
          .topLeftDecorationContainerXPositionTween;
  Tween<double> topRightDecorationContainerXPositionTween =
      _OnboardingPageViewControllerConstants
          .topRightDecorationContainerXPositionTween;
  Tween<double> bottomLeftDecorationContainerXPositionTween =
      _OnboardingPageViewControllerConstants
          .bottomLeftDecorationContainerXPositionTween;
  Tween<double> bottomRightDecorationContainerXPositionTween =
      _OnboardingPageViewControllerConstants
          .bottomRightDecorationContainerXPositionTween;

  @override
  void onInit() {
    tabController = TabController(
      vsync: this,
      length: pagesCount,
    );
    super.onInit();
  }

  double get animationValueFromZeroToOne =>
      tabController.animation!.value / (pagesCount - 1);

  //Animation Transformations (Manual Animation)
  double get nextButtonProgressValue => nextButtonProgressTween.transform(
        animationValueFromZeroToOne,
      );
  double get topLeftDecorationContainerXPositionAnimationValue =>
      topLeftDecorationContainerXPositionTween.transform(
        animationValueFromZeroToOne,
      );
  double get topRightDecorationContainerXPositionAnimationValue =>
      topRightDecorationContainerXPositionTween.transform(
        animationValueFromZeroToOne,
      );
  double get bottomLeftDecorationContainerXPositionAnimationValue =>
      bottomLeftDecorationContainerXPositionTween.transform(
        animationValueFromZeroToOne,
      );
  double get bottomRightDecorationContainerXPositionAnimationValue =>
      bottomRightDecorationContainerXPositionTween.transform(
        animationValueFromZeroToOne,
      );
}

class _OnboardingPageViewControllerConstants {
  static const int storiesCount = 3;
  static const initialProgressPercentage =
      (1 / _OnboardingPageViewControllerConstants.storiesCount);

  //Tweens
  static Tween<double> get nextButtonProgressTween => Tween(
        begin: _OnboardingPageViewControllerConstants.initialProgressPercentage,
        end: 1,
      );
  static Tween<double> get topLeftDecorationContainerXPositionTween => Tween(
        begin: 25.responsiveFromWidth,
        end: -75.responsiveFromWidth,
      );
  static Tween<double> get topRightDecorationContainerXPositionTween => Tween(
        begin: 290.responsiveFromWidth,
        end: 190.responsiveFromWidth,
      );
  static Tween<double> get bottomLeftDecorationContainerXPositionTween => Tween(
        begin: -80.responsiveFromWidth,
        end: -160.responsiveFromWidth,
      );
  static Tween<double> get bottomRightDecorationContainerXPositionTween =>
      Tween(
        begin: 270.responsiveFromWidth,
        end: 248.responsiveFromWidth,
      );
}
