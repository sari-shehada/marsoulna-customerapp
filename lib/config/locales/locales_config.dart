import 'package:icons_plus/icons_plus.dart';

class LocalesConfig {
  static List<FlagLocale> appLocales = [
    FlagLocale(
      languageName: 'English',
      languageCode: 'en',
      flag: Flags.united_kingdom,
    ),
    FlagLocale(
      languageName: 'العربية',
      languageCode: 'ar',
      flag: Flags.syria,
    ),
  ];
}

class FlagLocale {
  FlagLocale({
    required this.languageName,
    required this.languageCode,
    required this.flag,
  });
  final String languageName;
  final String languageCode;
  final String flag;
}
