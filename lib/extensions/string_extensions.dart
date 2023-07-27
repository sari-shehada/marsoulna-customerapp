part of 'extensions_export.dart';

extension StringExtensions on String {
  bool get isOnlyDigits => RegExp(r'^\d+$').hasMatch(this);

  String get toEnglishNumber {
    String arabicNumber = this;
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    final arabic = '٠,١,٢,٣,٤,٥,٦,٧,٨,٩'.split(',');

    for (int i = 0; i < arabic.length; i++) {
      arabicNumber = arabicNumber.replaceAll(arabic[i], english[i]);
    }
    return arabicNumber;
  }
}
