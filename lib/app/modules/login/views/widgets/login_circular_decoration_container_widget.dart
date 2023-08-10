import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/app/modules/login/controllers/login_animation_controller.dart';

import '../../../../widgets/shared/animated_circular_container.dart';

class LoginCircularDecorationContainer
    extends GetView<LoginAnimationController> {
  const LoginCircularDecorationContainer({super.key});

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
