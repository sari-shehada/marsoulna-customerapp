import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsoulna/config/design/design_config.dart';
import 'package:marsoulna/config/locales/locales_config.dart';

import '../../../../utils/spacing_utils/spacing_utils.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';
import 'package:marsoulna/services/locale_service/locales_service.dart';

class ChangeLanguageBottomSheet extends StatelessWidget {
  const ChangeLanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    ColorScheme colorScheme = themeData.colorScheme;
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 85.responsiveFromHeight,
        maxHeight: 420.responsiveFromHeight,
      ),
      child: SizedBox(
        height:
            (85 + LocalesConfig.appLocales.length * 60).responsiveFromHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsetsDirectional.only(start: 30.responsiveFromWidth),
              child: Text(
                'commonLocaleChangeLanguage'.tr,
                style: Get.textTheme.headlineSmall!.copyWith(
                  color: colorScheme.primary,
                ),
              ),
            ),
            AddVerticalSpacing(value: 20.responsiveFromHeight),
            Expanded(
              child: ListView.separated(
                padding:
                    EdgeInsets.symmetric(horizontal: 25.responsiveFromWidth),
                itemCount: LocalesConfig.appLocales.length,
                itemBuilder: (context, index) {
                  FlagLocale flagLocale = LocalesConfig.appLocales[index];
                  return ListTile(
                    onTap: () => _changeLocale(flagLocale.languageCode),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 10.responsiveFromWidth),
                    leading: Container(
                      height: 40.responsiveFromHeight,
                      width: 40.responsiveFromHeight,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: FittedBox(
                        alignment: Alignment.center,
                        fit: BoxFit.none,
                        child: Flag(
                          flagLocale.flag,
                          size: 60.responsiveFromTextSize,
                        ),
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 5.responsiveFromWidth,
                      ),
                      child: Text(
                        flagLocale.languageName,
                        style: Get.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 18.responsiveFromTextSize,
                        ),
                      ),
                    ),
                    trailing: Icon(
                      Icons.check,
                      color: Get.locale!.languageCode == flagLocale.languageCode
                          ? colorScheme.primary
                          : Colors.transparent,
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 15.responsiveFromHeight,
                ),
              ),
            ),
            AddVerticalSpacing(value: DesignConfig.deviceBottomPadding),
          ],
        ),
      ),
    );
  }

  Future<void> _changeLocale(String languageCode) async {
    await LocalesService.instance.setLocale(
      locale: Locale(languageCode),
    );
    Get.back();
  }
}
