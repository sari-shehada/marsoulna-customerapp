import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

class OnboardingTabViewController extends GetxController
    with GetTickerProviderStateMixin {
  int currentPage = 0;
  double currentOffset = 0;
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
    tabController.addListener(() {
      currentPage = tabController.index;
      currentOffset = tabController.offset;
    });
    super.onInit();
  }

  //Refactor Later
  bool? animateToBack() {
    if ((tabController.offset != currentOffset &&
            !tabController.indexIsChanging) ||
        tabController.indexIsChanging) {
      return null;
    }
    if (currentPage <= 0) {
      return false;
    }
    tabController.animateTo(
      --currentPage,
      // curve: Curves.decelerate,
    );
    return true;
  }

  //null still in onboarding and don't wanna go next yet
  //true there is next and I wanna go to it
  //false there is no next (you may wanna go to login page)
  bool? animateToNext() {
    if ((tabController.offset != currentOffset &&
            !tabController.indexIsChanging) ||
        tabController.indexIsChanging) {
      return null;
    }
    if (currentPage >= pagesCount - 1) {
      return false;
    }
    tabController.animateTo(
      ++currentPage,
      // curve: Curves.decelerate,
    );
    return true;
  }

  double get animationValueFromZeroToOne =>
      tabController.animation!.value / (pagesCount - 1);

  double evaluateTween(Tween<double> tween) =>
      tween.transform(animationValueFromZeroToOne);
}

class _OnboardingPageViewControllerConstants {
  static const int storiesCount = 3;
  static const initialProgressPercentage = (1 / storiesCount);

  //Tweens
  static Tween<double> get nextButtonProgressTween => Tween(
        begin: initialProgressPercentage,
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
