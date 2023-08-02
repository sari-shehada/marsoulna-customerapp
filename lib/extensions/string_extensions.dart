import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  String takeLetters({
    required int lettersCount,
    bool withSeeMoreIndicator = false,
    bool spaceBeforeSeeMore = false,
  }) {
    Characters characters = Characters(this);
    if (lettersCount > length || characters.isEmpty || lettersCount < 0) {
      return this;
    }
    // throw StateError("Something Occurred");
    return characters.take(lettersCount).string +
        (withSeeMoreIndicator ? (spaceBeforeSeeMore ? ' ...' : '...') : '');
  }

  String takeWords({required int wordCount, bool fromEnd = false}) {
    assert(wordCount > 0, 'Expected A Positive WordCount But Got $wordCount');
    List<String> words = split(' ');
    words = fromEnd ? List.from(words.reversed) : words;

    if (wordCount == words.length ||
        words.isEmpty ||
        isEmpty ||
        wordCount > words.length) {
      return this;
    }

    if (fromEnd) {
      List<String> fromEndList = [];
      for (var i = 0; i < wordCount; i++) {
        fromEndList.add(words[i]);
      }
      fromEndList = List.from(fromEndList.reversed);
      return fromEndList.map((e) => e).join(' ');
    }
    List<String> wordsToReturn = [];
    for (var i = 0; i < wordCount; i++) {
      wordsToReturn.add(words[i]);
    }
    return wordsToReturn.map((e) => e).join(' ');
  }

  String capitalizeFirstLetterOfEachWord() {
    return split(' ').map((word) => word.capitalizeFirst).join(' ');
  }
}
