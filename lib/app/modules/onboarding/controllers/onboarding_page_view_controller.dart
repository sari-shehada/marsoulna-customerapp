import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPageViewController extends GetxController {
  final PageController pageController = PageController();

  int get pagesCount => _OnboardingPageViewControllerConstants.storiesCount;
  RxDouble currentPercentage =
      _OnboardingPageViewControllerConstants.initialProgressPercentage.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    pageController.addListener(() {
      _reCalculateCurrentPercentage();
    });
    super.onReady();
  }

  void _reCalculateCurrentPercentage() {
    currentPercentage.value = _getPageProgressPercentage();
  }

  double _getPageProgressPercentage() {
    return (((pageController.page ?? 0) + 1) /
        _OnboardingPageViewControllerConstants.storiesCount);
  }
}

class _OnboardingPageViewControllerConstants {
  static const int storiesCount = 3;
  static const initialProgressPercentage =
      (1 / _OnboardingPageViewControllerConstants.storiesCount);
}
