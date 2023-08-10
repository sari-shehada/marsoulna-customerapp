import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/app/modules/login/views/widgets/login_view_animated_opacity_widget.dart';
import 'package:marsoulna/config/design/design_config.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';
import 'package:marsoulna/generated/locales.g.dart';
import 'package:marsoulna/utils/buttons/custom_filled_button.dart';
import 'package:marsoulna/utils/spacing_utils/spacing_utils.dart';

class LoginViewForm extends StatelessWidget {
  const LoginViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;
    return LoginViewAnimatedOpacityWidget(
      topPosition: null,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.responsiveFromWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                //TODO:
                'Enter Phone Number',
                style: TextStyle(
                  fontSize: 18.responsiveFromTextSize,
                  color: colorScheme.primary,
                ),
              ),
            ),
            TextField(),
            AddVerticalSpacing(value: 25.responsiveFromHeight),
            CustomFilledButton(
              onTap: () {},
              child: LocaleKeys.commonLocaleContinueWord.tr,
            ),
            AddVerticalSpacing(value: 40.responsiveFromHeight),
            Text(
              //TODO:
              '''الدخول يعني الإقرار بالقراءة والموافقة على''',
              textAlign: TextAlign.center,
              style: textTheme.labelLarge?.copyWith(
                color: colorScheme.outline,
              ),
            ),
            AddVerticalSpacing(value: 4.responsiveFromHeight),
            InkWell(
              onTap: () {
                //TODO:
                print('Terms');
              },
              borderRadius: BorderRadius.circular(20.responsiveFromRadius),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 6.responsiveFromHeight,
                  horizontal: 15.responsiveFromWidth,
                ),
                child: Text(
                  //TODO:
                  '''الشروط والأحكام''',
                  textAlign: TextAlign.center,
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
            AddVerticalSpacing(value: 35.responsiveFromHeight),
            AddVerticalSpacing(value: DesignConfig.deviceBottomPadding),
          ],
        ),
      ),
    );
  }
}
