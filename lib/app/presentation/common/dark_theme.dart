import 'package:faeng_courses/app/presentation/common/my_theme.dart';
import 'package:flutter/material.dart';

class DarkColors implements MyColors {
  @override
  Color get homeSidebarBackground => throw UnimplementedError();

  @override
  Color get homeContentBackground => throw UnimplementedError();

  @override
  // TODO: implement loginPageBackground
  Color get loginPageBackground => throw UnimplementedError();

  @override
  // TODO: implement loginContainerBackground
  Color get loginContainerBackground => throw UnimplementedError();
}

class DarkMyTextStyles implements MyTextStyles {}

class DarkMyAssetPaths implements MyAssetPaths {}

class DarkTheme implements MyTheme {
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
