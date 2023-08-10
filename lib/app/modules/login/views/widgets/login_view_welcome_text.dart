import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

import '../../../../../generated/locales.g.dart';
import 'login_view_animated_opacity_widget.dart';

class LoginViewWelcomeText extends StatelessWidget {
  const LoginViewWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginViewAnimatedOpacityWidget(
      topPosition: 265.responsiveFromHeight,
      child: Text(
        LocaleKeys.commonLocaleWelcome.tr,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: 40.responsiveFromTextSize,
              color: Theme.of(context).colorScheme.surface,
            ),
      ),
    );
  }
}
