import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding_tab_view_controller.dart';

class OnboardingDecorationCircleWidget extends StatelessWidget {
  const OnboardingDecorationCircleWidget({
    super.key,
    required this.top,
    required this.radius,
    required this.tween,
  });

  final double top;
  final double radius;
  final Tween<double> tween;
  @override
  Widget build(BuildContext context) {
    final OnboardingTabViewController tabViewController = Get.find();
    return AnimatedBuilder(
      animation: tabViewController.tabController.animation!,
      builder: (context, child) {
        return Positioned.directional(
          start: tabViewController.evaluateTween(tween),
          top: top,
          height: radius,
          width: radius,
          textDirection: Directionality.of(context),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary.withOpacity(.01),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(.4),
                  blurRadius: 40,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
