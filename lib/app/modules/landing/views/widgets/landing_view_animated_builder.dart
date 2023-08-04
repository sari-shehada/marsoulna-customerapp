import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/app/modules/landing/controllers/landing_animation_controller_controller.dart';

class LandingViewAnimatedBuilder extends GetView<LandingAnimationController> {
  const LandingViewAnimatedBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext, Widget?) builder;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.animationController,
      builder: builder,
    );
  }
}
