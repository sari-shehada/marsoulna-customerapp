import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../../config/images/themed_image_keys.dart';
import '../../../../../generated/locales.g.dart';
import '../../controllers/onboarding_page_view_controller.dart';
import 'onboarding_story_widget.dart';

class OnboardingStoriesPageView extends GetView<OnboardingPageViewController> {
  const OnboardingStoriesPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    assert(
      controller.pagesCount == _OnboardingStoriesPageViewConstants.storiesCount,
    );
    return PageView(
      controller: controller.pageController,
      children: _OnboardingStoriesPageViewConstants.stories,
    );
  }
}

class _OnboardingStoriesPageViewConstants {
  static const List<OnboardingStoryWidget> stories = [
    OnboardingStoryWidget(
      pngImageKey: ThemedImageKey.onboardingLookForRestaurants,
      titleText: LocaleKeys.onboardingSearchForRestaurantsAndShops,
      detailsText: LocaleKeys
          .onBoardingItIsNowEasyToSelectAndWatchRestaurantsAndStoresNearby,
    ),
    OnboardingStoryWidget(
      pngImageKey: ThemedImageKey.onboardingChatWithTheDriver,
      titleText: LocaleKeys.onBoardingChatWithTheDriver,
      detailsText: LocaleKeys
          .onBoardingCommunicatingWithMarsoulnaAndEnquiringIsNowEasierWithTheChatService,
    ),
    OnboardingStoryWidget(
      pngImageKey: ThemedImageKey.onboardingOnOurWay,
      titleText: LocaleKeys.onBoardingOnOurWayToYou,
      detailsText:
          LocaleKeys.onBoardingAllYouHaveToDoIsRelaxAndAwaitYourDelivery,
    ),
  ];

  static int get storiesCount => stories.length;
}
