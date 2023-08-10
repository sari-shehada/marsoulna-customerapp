import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:marsoulna/app/modules/landing/controllers/landing_animation_controller.dart';
import 'package:marsoulna/app/modules/landing/views/widgets/landing_circular_decoration_container_widget.dart';
import 'package:marsoulna/app/modules/loader/views/loader_view_shared_design_constants.dart';
import 'package:marsoulna/config/design/design_config.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

import '../../../../config/images/shared_image_keys.dart';
import '../../../../utils/buttons/custom_icon_button.dart';
import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  const LandingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final LandingAnimationController animationController =
        Get.find<LandingAnimationController>();
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    ColorScheme colorScheme = themeData.colorScheme;
    return Scaffold(
      body: Obx(
        () => AnimatedScale(
          scale: controller.isChangeLanguageSheetOpen.value ? 0.91 : 1,
          duration: controller.isChangeLanguageSheetOpen.value
              ? 200.milliseconds
              : 250.milliseconds,
          curve: Curves.decelerate,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              //KEY: Circular Decoration Container
              const LandingCircularDecorationContainer(),
              //KEY: App Icon
              AnimatedBuilder(
                animation: animationController.animationController,
                builder: (BuildContext context, Widget? child) {
                  return Positioned(
                    top: animationController.appIconTopPositionAnimation.value,
                    height: animationController.appIconDimensionAnimation.value,
                    width: animationController.appIconDimensionAnimation.value,
                    child: SvgPicture.asset(
                      SharedImageKey.appIcon,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  );
                },
              ),
              //KEY: App Title
              AnimatedBuilder(
                animation: animationController.animationController,
                builder: (BuildContext context, Widget? child) {
                  return Positioned(
                    top: animationController.appTitleTopPositionAnimation.value,
                    child: Text(
                      'marsoulna'.tr,
                      style: LoaderViewSharedDesignConstants.appTitleTextStyle
                          .copyWith(
                        color: animationController.appTitleColorAnimation.value,
                        fontSize:
                            animationController.appTitleSizeAnimation.value,
                      ),
                    ),
                  );
                },
              ),
              //KEY: App Title
              AnimatedBuilder(
                animation: animationController.animationController,
                builder: (BuildContext context, Widget? child) {
                  return Positioned(
                    top: 615.responsiveFromHeight,
                    child: Opacity(
                      opacity: animationController
                          .otherElementsOpacityAnimation.value,
                      child: Text(
                        'landingViewFullyRemastered'.tr,
                        style: textTheme.titleLarge?.copyWith(
                          color: colorScheme.surface,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
              //KEY: App Title
              AnimatedBuilder(
                animation: animationController.animationController,
                builder: (BuildContext context, Widget? child) {
                  return Positioned(
                    top: 710.responsiveFromHeight,
                    height: 60.responsiveFromHeight,
                    width: 310.responsiveFromWidth,
                    child: Opacity(
                      opacity: animationController
                          .otherElementsOpacityAnimation.value,
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 16,
                              offset: Offset(0, 4.responsiveFromHeight),
                              color: colorScheme.shadow.withOpacity(.2),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(
                            14.responsiveFromRadius,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(
                              14.responsiveFromRadius,
                            ),
                            onTap: () => controller.toOnBoarding(),
                            child: Center(
                              child: Text(
                                'commonLocaleGetStarted'.tr,
                                style: TextStyle(
                                  color: colorScheme.primary,
                                  fontSize: 18.responsiveFromTextSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              //KEY: Language Change Button
              AnimatedBuilder(
                animation: animationController.animationController,
                builder: (BuildContext context, Widget? child) {
                  return Positioned.directional(
                    top: (DesignConfig.deviceTopPadding + 10)
                        .responsiveFromHeight,
                    start: 30.responsiveFromWidth,
                    textDirection: Directionality.of(context),
                    child: Opacity(
                      opacity: animationController
                          .otherElementsOpacityAnimation.value,
                      child: CustomIconButton(
                        icon: Icons.language,
                        onTap: () => controller.changeLanguage(context),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
