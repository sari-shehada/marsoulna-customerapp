import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/app/modules/loader/views/loader_view_shared_design_constants.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

class LandingAnimationController extends GetxController
    with GetTickerProviderStateMixin {
  //Tweens

  // - App Icon
  final Tween<double> appIconTopPositionTween = Tween(
    begin: LoaderViewSharedDesignConstants.appIconTopPosition,
    end: _LandingAnimationControllerConstants.appIconTopPosition,
  );
  final Tween<double> appIconDimensionTween = Tween(
    begin: LoaderViewSharedDesignConstants.appIconDimension,
    end: _LandingAnimationControllerConstants.appIconDimension,
  );

  // - App Title
  final Tween<double> appTitleTopPositionTween = Tween(
    begin: LoaderViewSharedDesignConstants.appTitleTopPosition,
    end: _LandingAnimationControllerConstants.appTitleTopPosition,
  );
  final Tween<double> appTitleFontSizeTween = Tween(
    begin: LoaderViewSharedDesignConstants.appTitleFontSize,
    end: _LandingAnimationControllerConstants.appTitleFontSize,
  );
  final ColorTween appTitleFontColorTween = ColorTween(
    begin: LoaderViewSharedDesignConstants.appTitleFontColor,
    end: _LandingAnimationControllerConstants.appTitleFontColor,
  );

  // - Circular Container
  final Tween<double> circularContainerTopPositionTween = Tween(
    begin:
        _LandingAnimationControllerConstants.circularContainerBeginTopPosition,
    end: _LandingAnimationControllerConstants.circularContainerEndTopPosition,
  );
  final ColorTween circularContainerColorTween = ColorTween(
    begin: _LandingAnimationControllerConstants.circularContainerBeginColor,
    end: _LandingAnimationControllerConstants.circularContainerEndColor,
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
  // - App Title
  late Animation appTitleTopPositionAnimation;
  late Animation appTitleSizeAnimation;
  late Animation appTitleColorAnimation;
  // - Circular Container
  late Animation circularContainerTopPositionAnimation;
  late Animation circularContainerColorAnimation;
  // - Other elements
  late Animation otherElementsOpacityAnimation;

  //Animation Controller
  late AnimationController animationController;

  @override
  void onInit() {
    _initAnimationController();
    _initAnimations();
    super.onInit();
  }

  @override
  void onReady() {
    _startAnimation();
    super.onReady();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  Future<void> _startAnimation() async {
    animationController.forward();
  }

  Future<void> reverseAnimation() async {
    await animationController.reverse();
  }

  Future<void> restartAnimation() async {
    await _startAnimation();
  }

  void _initAnimationController() {
    animationController = AnimationController(
      vsync: this,
      duration: _LandingAnimationControllerConstants.animationDuration,
    );
  }

  void _initAnimations() {
    _initAppIconAnimations();
    _initAppTitleAnimations();
    _initContainerAnimations();
    _initOtherElementsAnimations();
  }

  void _initAppIconAnimations() {
    appIconTopPositionAnimation = appIconTopPositionTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: _LandingAnimationControllerConstants.forwardAnimationCurve,
        reverseCurve:
            _LandingAnimationControllerConstants.reverseAnimationCurve,
      ),
    );
    appIconDimensionAnimation = appIconDimensionTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: _LandingAnimationControllerConstants.forwardAnimationCurve,
        reverseCurve:
            _LandingAnimationControllerConstants.reverseAnimationCurve,
      ),
    );
  }

  void _initAppTitleAnimations() {
    appTitleTopPositionAnimation = appTitleTopPositionTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: _LandingAnimationControllerConstants.forwardAnimationCurve,
        reverseCurve:
            _LandingAnimationControllerConstants.reverseAnimationCurve,
      ),
    );
    appTitleSizeAnimation = appTitleFontSizeTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: _LandingAnimationControllerConstants.forwardAnimationCurve,
        reverseCurve:
            _LandingAnimationControllerConstants.reverseAnimationCurve,
      ),
    );
    appTitleColorAnimation = appTitleFontColorTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: _LandingAnimationControllerConstants.forwardAnimationCurve,
        reverseCurve:
            _LandingAnimationControllerConstants.reverseAnimationCurve,
      ),
    );
  }

  void _initContainerAnimations() {
    circularContainerTopPositionAnimation =
        circularContainerTopPositionTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: _LandingAnimationControllerConstants.forwardAnimationCurve,
        reverseCurve:
            _LandingAnimationControllerConstants.reverseAnimationCurve,
      ),
    );
    circularContainerColorAnimation = circularContainerColorTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: _LandingAnimationControllerConstants.forwardAnimationCurve,
        reverseCurve:
            _LandingAnimationControllerConstants.reverseAnimationCurve,
      ),
    );
  }

  void _initOtherElementsAnimations() {
    otherElementsOpacityAnimation = otherElementsOpacityTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: _LandingAnimationControllerConstants.forwardAnimationCurve,
        reverseCurve:
            _LandingAnimationControllerConstants.reverseAnimationCurve,
      ),
    );
  }
}

class _LandingAnimationControllerConstants {
  //Misc
  static Duration get animationDuration => 600.milliseconds;
  static Cubic get forwardAnimationCurve => Curves.linearToEaseOut;
  static Curve get reverseAnimationCurve => forwardAnimationCurve.flipped;

  //App Icon
  static double get appIconTopPosition =>
      150.responsiveFromHeight; //Was 130 in Figma
  static double get appIconDimension => 180.responsiveFromHeight;

  //App Title
  static double get appTitleTopPosition => 505.responsiveFromHeight;
  static double get appTitleFontSize => 50.responsiveFromTextSize;
  static Color get appTitleFontColor => Get.theme.scaffoldBackgroundColor;

  //CircularContainer
  static double get circularContainerBeginTopPosition =>
      800.responsiveFromHeight;
  static double get circularContainerEndTopPosition => 440.responsiveFromHeight;
  static Color get circularContainerBeginColor =>
      Get.theme.scaffoldBackgroundColor;
  static Color get circularContainerEndColor => Get.theme.colorScheme.primary;
}
