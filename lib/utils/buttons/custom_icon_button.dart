import 'package:flutter/material.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final double height;
  final double width;
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.height = 51,
    this.width = 51,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      color: Theme.of(context).colorScheme.primaryContainer,
      // color: Colors.transparent,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        onTap: onTap,
        highlightColor: Theme.of(context).colorScheme.primary.withOpacity(.2),
        splashColor: Colors.transparent,
        child: Container(
          height: height.responsiveFromHeight,
          width: width.responsiveFromHeight,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            size: 27.responsiveFromWidth,
          ),
        ),
      ),
    );
  }
}
