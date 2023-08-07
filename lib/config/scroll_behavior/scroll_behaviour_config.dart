import 'package:flutter/material.dart';

class ScrollBehaviorConfig extends ScrollBehavior {
  const ScrollBehaviorConfig();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
    // switch (getPlatform(context)) {
    //   case TargetPlatform.iOS:
    //   case TargetPlatform.macOS:
    //   case TargetPlatform.android:

    //   case TargetPlatform.fuchsia:
    //   case TargetPlatform.linux:
    //   case TargetPlatform.windows:
    //     return const ClampingScrollPhysics();
    // }
  }
}
