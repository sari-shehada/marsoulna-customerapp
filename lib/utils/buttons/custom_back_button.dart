import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../extensions/responsiveness_extensions.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  const CustomBackButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      color: Theme.of(context).colorScheme.primaryContainer,
      // color: Colors.transparent,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        onTap: onTap ??
            () {
              Get.back();
            },
        highlightColor: Theme.of(context).colorScheme.primary.withOpacity(.2),
        splashColor: Colors.transparent,
        child: Container(
          height: 51.responsiveFromHeight,
          width: 51.responsiveFromHeight,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Icon(
            Icons.chevron_left,
            color: Theme.of(context).colorScheme.primary,
            size: 27.responsiveFromWidth,
          ),
        ),
      ),
    );
  }
}
