import 'dart:ui';

import 'package:faeng_courses/presentation/common/my_theme.dart';
import 'package:flutter/material.dart';

class LightColors implements MyColors {
  @override
  Color get homeSidebarBackground => Colors.black38;

  @override
  Color get homeContentBackground => Colors.black26;
}

class LightTextStyles implements MyTextStyles {}

class LightAssetPaths implements MyAssetPaths {}

class LightTheme implements MyTheme {
  @override
  // TODO(Alvaro): implement assets
  MyAssetPaths get assets => LightAssetPaths();

  @override
  // TODO(Alvaro): implement colors
  MyColors get colors => LightColors();

  // TODO(Alvaro): implement fontFamily
  @override
  String get fontFamily => '';

  @override
  // TODO(Alvaro): implement MyTextStyles
  MyTextStyles get textStyles => LightTextStyles();
}
