import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:marsoulna/config/navigation_keys/navigation_keys_config.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

import '../../loader/views/loader_view_shared_design_constants.dart';

class LoginAnimationController extends GetxController
    with GetTickerProviderStateMixin {
  late Duration pauseDuration;

  //Tweens
  //App Icon
  final Tween<double> appIconTopPositionTween = Tween(
    begin: LoaderViewSharedDesignConstants.appIconTopPosition,
    end: _LoginAnimationControllerConstants.appIconTopPosition,
  );
  final Tween<double> appIconDimensionTween = Tween(
    begin: LoaderViewSharedDesignConstants.appIconDimension,
    end: _LoginAnimationControllerConstants.appIconDimension,
  );
  final ColorTween appIconColorTween = ColorTween(
    begin: _LoginAnimationControllerConstants.appIconBeginColor,
    end: _LoginAnimationControllerConstants.appIconEndColor,
  );
  // - Circular Container
  final Tween<double> circularContainerTopPositionTween = Tween(
    begin: _LoginAnimationControllerConstants.circularContainerBeginTopPosition,
    end: _LoginAnimationControllerConstants.circularContainerEndTopPosition,
  );
  final ColorTween circularContainerColorTween = ColorTween(
    begin: _LoginAnimationControllerConstants.circularContainerBeginColor,
    end: _LoginAnimationControllerConstants.circularContainerEndColor,
  );
  // - Other elements
  final Tween<double> otherElementsOpacityTween = Tween<double>(
    begin: 0.0,
    end: 1.0,
  );

  //Animations
  // - App Icon
  late Animation appIconTopPositionAnimation;
  late Animation appIconDimensionAnimation;
  late Animation appIconColorAnimation;
  // - Circular Container
  late Animation circularContainerTopPositionAnimation;
  late Animation circularContainerColorAnimation;
  // - Other elements
  late Animation otherElementsOpacityAnimation;

  //Animation Controller
  late AnimationController animationController;

  @override
  void onInit() {
    _applyPauseDuration();
    _initAnimationController();
    _initAnimations();
    _startAnimationInitially();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  Future<void> _startAnimationInitially() async {
    await Future.delayed(pauseDuration);
    await _startAnimation();
  }

  Future<void> _startAnimation() async {
    await animationController.forward();
  }

  void _initAnimationController() {
    animationController = AnimationController(
      vsync: this,
      duration: _LoginAnimationControllerConstants.animationDuration,
    );
  }

  void _initAnimations() {
    _initAppIconAnimations();
    _initContainerAnimations();
    _initOtherElementsAnimations();
  }

  void _initAppIconAnimations() {
    appIconTopPositionAnimation = appIconTopPositionTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: _LoginAnimationControllerConstants.forwardAnimationCurve,
      ),
    );
    appIconDimensionAnimation = appIconDimensionTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: _LoginAnimationControllerConstants.forwardAnimationCurve,
      ),
    );
    appIconColorAnimation = appIconColorTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: _LoginAnimationControllerConstants.forwardAnimationCurve,
      ),
    );
  }

  void _initContainerAnimations() {
    circularContainerTopPositionAnimation =
        circularContainerTopPositionTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: _LoginAnimationControllerConstants.forwardAnimationCurve,
      ),
    );
    circularContainerColorAnimation = circularContainerColorTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: _LoginAnimationControllerConstants.forwardAnimationCurve,
      ),
    );
  }

  void _initOtherElementsAnimations() {
    otherElementsOpacityAnimation = otherElementsOpacityTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: _LoginAnimationControllerConstants.forwardAnimationCurve,
      ),
    );
  }

  void _applyPauseDuration() {
    bool? cameFromOnboarding = bool.tryParse(
      Get.parameters[NavigationKeysConfig.fromOnboarding].toString(),
    );
    if (cameFromOnboarding == true) {
      pauseDuration =
          _LoginAnimationControllerConstants.onboardingPauseDuration;
      return;
    }
    pauseDuration = _LoginAnimationControllerConstants.loaderPauseDuration;
  }
}

class _LoginAnimationControllerConstants {
  static Cubic get forwardAnimationCurve => Curves.linearToEaseOut;
  static Duration get animationDuration => 600.milliseconds;
  static const Duration onboardingPauseDuration = Duration(milliseconds: 400);
  static const Duration loaderPauseDuration = Duration(milliseconds: 0);

  //App Icon
  static double get appIconTopPosition =>
      85.responsiveFromHeight; //Was 130 in Figma
  static double get appIconDimension => 140.responsiveFromHeight;
  static Color get appIconBeginColor => Get.theme.colorScheme.primary;
  static Color get appIconEndColor => Get.theme.scaffoldBackgroundColor;
  //CircularContainer
  static double get circularContainerBeginTopPosition =>
      -940.responsiveFromHeight;
  static double get circularContainerEndTopPosition =>
      -605.responsiveFromHeight;
  static Color get circularContainerBeginColor =>
      Get.theme.scaffoldBackgroundColor;
  static Color get circularContainerEndColor => Get.theme.colorScheme.primary;
}
