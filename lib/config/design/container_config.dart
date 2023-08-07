import 'package:flutter/material.dart';
import 'package:marsoulna/extensions/responsiveness_extensions.dart';

class ContainerConfig {
  static BorderRadius get defaultBorderRadius => BorderRadius.circular(
        14.responsiveFromRadius,
      );
}
