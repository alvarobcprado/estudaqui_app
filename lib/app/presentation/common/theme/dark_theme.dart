import 'package:faeng_courses/app/presentation/common/theme/my_theme.dart';
import 'package:flutter/material.dart';

class DarkColors extends MyColors {
  @override
  // TODO: implement loginPageBackground
  Color get loginPageBackground => throw UnimplementedError();

  @override
  // TODO: implement myDrawerHeaderBackground
  Color get myDrawerHeaderBackground => throw UnimplementedError();

  @override
  // TODO: implement formFieldBackground
  Color get formFieldBackground => throw UnimplementedError();

  @override
  // TODO: implement authFormBackground
  Color get authFormBackground => throw UnimplementedError();

  @override
  // TODO: implement authFormTextColor
  Color get authFormTextColor => throw UnimplementedError();
}

class DarkMyTextStyles extends MyTextStyles {}

class DarkMyAssetPaths extends MyAssetPaths {}

class DarkTheme extends MyTheme {
  @override
  // TODO(Alvaro): implement assets
  MyAssetPaths get assets => DarkMyAssetPaths();

  @override
  // TODO(Alvaro): implement colors
  MyColors get colors => DarkColors();

  // TODO(Alvaro): implement fontFamily
  @override
  String get fontFamily => '';

  @override
  // TODO(Alvaro): implement MyTextStyles
  MyTextStyles get textStyles => DarkMyTextStyles();
}
