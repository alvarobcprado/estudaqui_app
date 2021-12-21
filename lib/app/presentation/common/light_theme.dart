import 'package:faeng_courses/app/presentation/common/my_theme.dart';
import 'package:flutter/material.dart';

class LightColors implements MyColors {
  @override
  Color get homeSidebarBackground => Colors.black38;

  @override
  Color get homeContentBackground => Colors.black26;

  @override
  // TODO: implement loginPageBackground
  Color get loginPageBackground => Colors.blue.withOpacity(0.5);

  @override
  // TODO: implement loginContainerBackground
  Color get loginContainerBackground => Colors.white;
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
