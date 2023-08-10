import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/app/modules/login/controllers/login_animation_controller.dart';

class LoginViewAnimatedOpacityWidget extends GetView<LoginAnimationController> {
  const LoginViewAnimatedOpacityWidget({
    super.key,
    required this.topPosition,
    required this.child,
    this.width,
    this.height,
  });

  final double? topPosition;
  final double? width;
  final double? height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (topPosition == null) {
      return AnimatedBuilder(
        animation: controller.animationController,
        builder: (context, child) {
          return Opacity(
            opacity: controller.otherElementsOpacityAnimation.value,
            child: child!,
          );
        },
        child: child,
      );
    }
    return AnimatedBuilder(
      animation: controller.animationController,
      builder: (context, child) {
        return Positioned(
          top: topPosition,
          height: height,
          width: width,
          child: Opacity(
            opacity: controller.otherElementsOpacityAnimation.value,
            child: child!,
          ),
        );
      },
      child: child,
    );
  }
}
