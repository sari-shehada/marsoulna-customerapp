import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../../config/images/themed_image_keys.dart';
import '../../../../../generated/locales.g.dart';
import '../../controllers/onboarding_tab_view_controller.dart';
import 'onboarding_story_widget.dart';

class OnboardingStoriesTabView extends GetView<OnboardingTabViewController> {
  const OnboardingStoriesTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    assert(
      controller.pagesCount == _OnboardingStoriesPageViewConstants.storiesCount,
    );
    return TabBarView(
      controller: controller.tabController,
      physics: const BouncingScrollPhysics(),
      //TODO: Take a further look into this
      dragStartBehavior: DragStartBehavior.start,
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
