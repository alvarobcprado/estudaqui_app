import 'package:estudaqui/app/presentation/common/theme/my_theme.dart';
import 'package:flutter/material.dart';

class LightColors extends MyColors {
  @override
  Color get myDrawerHeaderBackground => Colors.blue;

  @override
  Color get authFormBackground => primaryVariantColor.withOpacity(0.4);

  @override
  // TODO: implement authFormTextColor
  Color get authFormTextColor => Colors.white;
}

class LightTextStyles extends MyTextStyles {}

class LightAssetPaths extends MyAssetPaths {}

class LightTheme extends MyTheme {
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
