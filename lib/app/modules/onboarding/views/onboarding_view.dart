import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marsoulna/app/modules/onboarding/controllers/onboarding_tab_view_controller.dart';
import 'package:marsoulna/app/modules/onboarding/views/widgets/onboarding_decoration_circle_widget.dart';
import 'package:marsoulna/app/modules/onboarding/views/widgets/onboarding_page_buttons_widget.dart';
import 'package:marsoulna/app/modules/onboarding/views/widgets/onboarding_stories_tab_view.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

import '../controllers/onboarding_controller.dart';
part 'widgets/onboarding_decoration_containers.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          controller.back();
          return false;
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ..._DecorationContainers.decorationContainers,
            const OnboardingStoriesTabView(),
            const OnboardingPageButtons(),
          ],
        ),
      ),
    );
  }
}
