import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/app/modules/login/controllers/login_animation_controller.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

import '../../../landing/views/landing_view.dart';
import '../../../landing/views/widgets/landing_view_animated_builder.dart';

class LoginCircularDecorationContainer
    extends GetView<LoginAnimationController> {
  const LoginCircularDecorationContainer({super.key});

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
