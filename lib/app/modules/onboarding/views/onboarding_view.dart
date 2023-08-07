import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marsoulna/app/modules/onboarding/views/widgets/onboarding_page_buttons_widget.dart';
import 'package:marsoulna/app/modules/onboarding/views/widgets/onboarding_stories_page_view.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          OnboardingStoriesPageView(),
          OnboardingPageButtons(),
        ],
      ),
    );
  }
}
