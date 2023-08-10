import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/app/modules/landing/controllers/landing_animation_controller.dart';

import '../../../../widgets/shared/animated_circular_container.dart';

class LandingCircularDecorationContainer
    extends GetView<LandingAnimationController> {
  const LandingCircularDecorationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedCircularDecorationContainerWidget(
      animationController: controller.animationController,
      topPositionAnimation: controller.circularContainerTopPositionAnimation,
      colorAnimation: controller.circularContainerColorAnimation,
      shadowOpacityAnimation: controller.otherElementsOpacityAnimation,
    );
  }
}
