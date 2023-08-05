import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marsoulna/app/modules/onboarding/views/widgets/onboarding_story_widget.dart';
import 'package:marsoulna/config/images/themed_image_keys.dart';
import 'package:marsoulna/generated/locales.g.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            children: const [
              OnboardingStoryWidget(
                svgImageKey: ThemedImageKey.onboardingLookForRestaurants,
                titleText: LocaleKeys.onboardingSearchForRestaurantsAndShops,
                detailsText: LocaleKeys
                    .onBoardingItIsNowEasyToSelectAndWatchRestaurantsAndStoresNearby,
              ),
              OnboardingStoryWidget(
                svgImageKey: ThemedImageKey.onboardingChatWithTheDriver,
                titleText: LocaleKeys.onBoardingChatWithTheDriver,
                detailsText: LocaleKeys
                    .onBoardingCommunicatingWithMarsoulnaAndEnquiringIsNowEasierWithTheChatService,
              ),
              OnboardingStoryWidget(
                svgImageKey: ThemedImageKey.onboardingOnOurWay,
                titleText: LocaleKeys.onBoardingOnOurWayToYou,
                detailsText: LocaleKeys
                    .onBoardingAllYouHaveToDoIsRelaxAndAwaitYourDelivery,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
