import 'package:flutter/material.dart';

class SimpleAnimatedBuilder extends StatelessWidget {
  const SimpleAnimatedBuilder({
    super.key,
    required this.builder,
    required this.controller,
  });

  final AnimationController controller;
  final Widget Function(BuildContext, Widget?) builder;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: builder,
    );
  }
}
