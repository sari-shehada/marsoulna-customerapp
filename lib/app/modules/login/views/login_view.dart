import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marsoulna/app/modules/login/views/widgets/login_animated_app_icon_widget.dart';
import 'package:marsoulna/app/modules/login/views/widgets/login_circular_decoration_container_widget.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          //KEY: Circular Decoration Container
          LoginCircularDecorationContainer(),
          //KEY: App Icon
          LoginAnimatedAppIcon(),
        ],
      ),
    );
  }
}
