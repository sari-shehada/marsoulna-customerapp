import 'package:marsoulna/extensions/string_extensions.dart';

extension EnumExtension on Enum {
  String get enumName => toString().split('.').last;

  String toUpperCamelCase({bool capitalizeFirstLetterOfEachWord = false}) {
    String output = '';
    for (int i = 0; i < enumName.length; i++) {
      if (i == 0) {
        // Capitalize the first letter
        output += enumName[i].toUpperCase();
      } else if (enumName[i] == enumName[i].toUpperCase()) {
        // Add a space before any subsequent uppercase letters
        output += ' ${enumName[i].toLowerCase()}';
      } else {
        // Add lowercase letters as-is
        output += enumName[i];
      }
    }
    return capitalizeFirstLetterOfEachWord
        ? output.capitalizeFirstLetterOfEachWord()
        : output;
  }
}
