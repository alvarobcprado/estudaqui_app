import 'package:flutter/material.dart';

abstract class MyTheme {
  MyColors get colors;
  MyTextStyles get textStyles;
  MyAssetPaths get assets;
  String get fontFamily;
}

abstract class MyColors {
  Color get myDrawerHeaderBackground;

  Color get loginPageBackground;

  Color get loginContainerBackground;
}

abstract class MyTextStyles {}

abstract class MyAssetPaths {}
