import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:marsoulna/app/modules/loader/views/loader_view_shared_design_constants.dart';
import 'package:marsoulna/config/images/shared_image_keys.dart';

import '../controllers/loader_controller.dart';

class LoaderView extends GetView<LoaderController> {
  const LoaderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: LoaderViewSharedDesignConstants.appIconTopPosition,
            height: LoaderViewSharedDesignConstants.appIconDimension,
            width: LoaderViewSharedDesignConstants.appIconDimension,
            child: SvgPicture.asset(
              SharedImageKey.appIcon,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          Positioned(
            top: LoaderViewSharedDesignConstants.appTitleTopPosition,
            child: Text(
              'Marsoulna'.tr,
              style: LoaderViewSharedDesignConstants.appTitleTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
