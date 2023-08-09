import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/app/modules/landing/controllers/landing_animation_controller.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

import '../landing_view.dart';
import 'landing_view_animated_builder.dart';

class LandingCircularDecorationContainer
    extends GetView<LandingAnimationController> {
  const LandingCircularDecorationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleAnimatedBuilder(
      controller: controller.animationController,
      builder: (BuildContext context, Widget? child) {
        return Positioned(
          top: controller.circularContainerTopPositionAnimation.value,
          height: 1000.responsiveFromHeight,
          width: 1000.responsiveFromHeight,
          child: AnimatedCircularDecorationContainerWidget(
            colorAnimation: controller.circularContainerColorAnimation,
            shadowOpacityAnimation: controller.otherElementsOpacityAnimation,
          ),
        );
      },
    );
  }
}
