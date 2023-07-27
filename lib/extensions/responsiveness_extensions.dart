import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ResponsivenessExtensions on num {
  //Responsiveness related extensions
  double get responsiveFromHeight => h;
  double get responsiveFromWidth => w;
  double get responsiveFromTextSize => sp;
  double get responsiveFromRatioHeight =>
      ScreenUtil.defaultSize.height.responsiveFromHeight * this;
  double get responsiveFromRatioWidth =>
      ScreenUtil.defaultSize.width.responsiveFromWidth * this;
  //To Ensure consistent values across all radiuses
  double get responsiveFromRadius => r;
}
