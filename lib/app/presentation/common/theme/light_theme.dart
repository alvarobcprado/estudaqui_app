import 'package:faeng_courses/app/presentation/common/theme/my_theme.dart';
import 'package:flutter/material.dart';

class LightColors implements MyColors {
  @override
  Color get loginPageBackground => Colors.blue.withOpacity(0.5);

  @override
  Color get loginContainerBackground => Colors.white;

  @override
  Color get myDrawerHeaderBackground => Colors.blue;
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
