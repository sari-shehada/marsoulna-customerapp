import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marsoulna/app/modules/login/views/widgets/login_animated_app_icon_widget.dart';
import 'package:marsoulna/app/modules/login/views/widgets/login_circular_decoration_container_widget.dart';
import 'package:marsoulna/app/modules/login/views/widgets/login_view_form.dart';
import 'package:marsoulna/app/modules/login/views/widgets/login_view_welcome_text.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .55,
              child: const Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  // LoginViewForm(),
                  LoginCircularDecorationContainer(),
                  LoginAnimatedAppIcon(),
                  LoginViewWelcomeText(),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .45,
              child: const LoginViewForm(),
            ),
          ],
        ),
      ),
      // body: Stack(
      //   alignment: Alignment.center,
      //   fit: StackFit.expand,
      //   children: [
      //     LoginViewForm(),
      //     LoginCircularDecorationContainer(),
      //     LoginAnimatedAppIcon(),
      //     LoginViewWelcomeText(),
      //   ],
      // ),
    );
  }
}
