import 'dart:ui';

import 'package:flutter/material.dart';

extension ColorsExtensions on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1,
        'Expected a value between 0 & 1 but got $amount');
    final HSLColor hsl = HSLColor.fromColor(this);
    final HSLColor hslDark =
        hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    //Asserting in case of
    assert(amount >= 0 && amount <= 1,
        'Expected a value between 0 & 1 but got $amount');
    final HSLColor hsl = HSLColor.fromColor(this);
    final HSLColor hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  Color invert([bool keepOpacity = true]) {
    return Color.fromARGB(keepOpacity ? alpha : (255 - alpha), 255 - red,
        255 - green, 255 - blue);
  }

  bool isColorLight() {
    double grayScaleValue = (0.299 * red) + (0.587 * green) + (0.114 * blue);
    return grayScaleValue > 128;
  }

  bool isColorDark() => !isColorLight();
}
