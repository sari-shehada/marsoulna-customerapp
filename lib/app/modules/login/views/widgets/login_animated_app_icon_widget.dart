import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../config/images/shared_image_keys.dart';
import '../../../landing/views/widgets/landing_view_animated_builder.dart';
import '../../controllers/login_animation_controller.dart';

class LoginAnimatedAppIcon extends GetView<LoginAnimationController> {
  const LoginAnimatedAppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleAnimatedBuilder(
      controller: controller.animationController,
      builder: (BuildContext context, Widget? child) {
        return Positioned(
          top: controller.appIconTopPositionAnimation.value,
          height: controller.appIconDimensionAnimation.value,
          width: controller.appIconDimensionAnimation.value,
          child: SvgPicture.asset(
            SharedImageKey.appIcon,
            colorFilter: ColorFilter.mode(
              controller.appIconColorAnimation.value,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
