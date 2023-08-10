import 'package:flutter/material.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

import '../../../services/theming_service/theming_service.dart';

class AnimatedCircularDecorationContainerWidget extends StatelessWidget {
  const AnimatedCircularDecorationContainerWidget({
    super.key,
    required this.animationController,
    required this.topPositionAnimation,
    required this.colorAnimation,
    required this.shadowOpacityAnimation,
  });

  final Listenable animationController;
  final Animation topPositionAnimation;
  final Animation colorAnimation;
  final Animation shadowOpacityAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Positioned(
          top: topPositionAnimation.value,
          height: 1000.responsiveFromHeight,
          width: 1000.responsiveFromHeight,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorAnimation.value,
              boxShadow: ThemingService.instance.isDarkMode
                  ? null
                  : [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.shadow.withOpacity(
                              (shadowOpacityAnimation.value * 0.17),
                            ),
                        offset: Offset(0, -11.responsiveFromHeight),
                        blurRadius: 40,
                      ),
                    ],
            ),
          ),
        );
      },
    );
  }
}
