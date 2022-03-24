import 'package:flutter/material.dart';

abstract class MyTheme {
  MyColors get colors;
  MyTextStyles get textStyles;
  MyAssetPaths get assets;
  String get fontFamily;
}

abstract class MyColors {
  /// Prussian Blue
  Color get primaryColor => const Color.fromRGBO(2, 48, 71, 1);

  /// Blue Green
  Color get primaryVariantColor => const Color.fromRGBO(33, 158, 188, 1);

  ///Cornflower Blue
  Color get primaryVariantLightColor => const Color.fromRGBO(142, 202, 230, 1);

  /// Selective Yellow
  Color get secondaryVariantColor => const Color.fromRGBO(255, 183, 3, 1);

  /// Tangerine
  Color get secondaryColor => const Color.fromRGBO(251, 133, 0, 1);

  Color get white => Colors.white;

  Color get black => Colors.black;

  Color get myDrawerHeaderBackground;

  List<Color> get loginPageGradient => [
        primaryColor,
        const Color.fromRGBO(4, 56, 79, 1),
        const Color.fromRGBO(13, 88, 114, 1),
        primaryVariantColor
      ];

  Color get authFormBackground;

  Color get authFormTextColor;
}

abstract class MyTextStyles {}

abstract class MyAssetPaths {
  String get logoOrange => 'assets/images/Logo Orange.png';
}
