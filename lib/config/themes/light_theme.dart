part of 'themes.dart';

final ThemeData lightTheme = _sharedTheme.copyWith(
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: const Color(0xFFF8FAFA),
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFf45b56), //
  onPrimary: Color(0xFFFFFFFF), //
  primaryContainer: Color(0xFFffecef), //
  onPrimaryContainer: Color(0xFFf45b56), //
  secondary: Color(0xFF0BACAF), //
  onSecondary: Color(0xFFFFFFFF), //
  // secondaryContainer: Color(0xFFe1f3f5), //TODO: Consider this as an altirnative
  secondaryContainer: Color(0xFFb3e1e4), //
  onSecondaryContainer: Color(0xFF002021), //
  // tertiary: Color(0xFF725B2E),
  // onTertiary: Color(0xFFFFFFFF),
  // tertiaryContainer: Color(0xFFFFDEA6),
  // onTertiaryContainer: Color(0xFF271900),
  error: Color(0xFFC00011),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFAFDFD),
  onBackground: Color(0xFF191C1D),
  outline: Color(0xFF747878), //
  onInverseSurface: Color(0xFFEFF1F1),
  inverseSurface: Color(0xFF2E3132),
  inversePrimary: Color(0xFFFFB3AE),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFB22A2C),
  // outlineVariant: Color(0xFFD8C2C0), //TODO: Consider this as an altirnative
  outlineVariant: Color(0xFFBBA6A5), //
  // outlineVariant: Color(0xFF8E9192), //TODO: Consider this as an altirnative
  scrim: Color(0xFF000000),
  surface: Color(0xFFF8FAFA),
  onSurface: Color(0xFF191C1D), //
  surfaceVariant: Color(0xFFF5DDDB),
  onSurfaceVariant: Color(0xFF444748), //
);
