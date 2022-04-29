import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:flutter/material.dart';

abstract class MyTheme {
  MyColors get colors;
  MyTextStyles get textStyles;
  MyAssetPaths get assets;
  String get fontFamily;
}

abstract class MyColors {
  /// Prussian Blue
  Color get primaryColor => _primaryColor;

  /// Blue Green
  Color get primaryVariantColor => _primaryVariantColor;

  ///Cornflower Blue
  Color get primaryVariantLightColor => _primaryVariantLightColor;

  /// Selective Yellow
  Color get secondaryVariantColor => _secondaryVariantColor;

  /// Tangerine
  Color get secondaryColor => _secondaryColor;

  Color get errorColor => _errorColor;

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

abstract class MyTextStyles {
  TextStyle get homeAppBarTitle => const TextStyle(
        color: Colors.white,
        fontSize: 18,
        height: 24 / 18,
        fontWeight: FontWeight.w600,
      );

  TextStyle get homeAppBarGreeting => const TextStyle(
        color: Colors.white,
        fontSize: 26,
        height: 48 / 26,
      );

  TextStyle get homeAppBarUserName => const TextStyle(
        color: _secondaryVariantColor,
        fontSize: 26,
        height: 48 / 26,
        fontWeight: FontWeight.bold,
      );

  TextStyle get homeAppBarWelcome => const TextStyle(
        color: Colors.white,
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w600,
      );

  TextStyle get sectionTitle => const TextStyle(
        color: _primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 24 / 16,
      );

  TextStyle get homeCarouselCourseTitle => const TextStyle(
        fontWeight: FontWeight.w500,
        color: _primaryColor,
        fontSize: kSmallNumber * 1.75,
      );

  TextStyle get courseListAuthorRow => const TextStyle(
        color: _primaryColor,
        fontSize: 11,
        fontWeight: FontWeight.w500,
      );

  TextStyle get courseListBanner => const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w500,
        color: _secondaryVariantColor,
        shadows: [
          Shadow(
            color: _primaryColor,
            offset: Offset(2, 2),
            blurRadius: 8,
          ),
        ],
      );
  TextStyle get courseListTitle => const TextStyle(
        fontSize: kMediumNumber,
        color: _primaryColor,
        fontWeight: FontWeight.w500,
        height: 24 / 16,
      );

  TextStyle get courseListBigTitle => const TextStyle(
        fontSize: kLargeNumber,
        color: _primaryColor,
        fontWeight: FontWeight.w500,
        height: 36 / 24,
      );

  TextStyle get courseListSubtitle => const TextStyle(
        fontSize: 12,
        color: _primaryColor,
        height: 16 / 12,
      );

  TextStyle get courseListDateAdded => const TextStyle(
        fontSize: 10,
        color: _primaryColor,
        height: 12 / 10,
      );

  TextStyle get appInfos => const TextStyle(
        color: _primaryColor,
        fontSize: kMediumNumber,
        height: kLargeNumber / kMediumNumber,
      );
}

abstract class MyAssetPaths {
  String get logoOrange => 'assets/images/Logo Orange.png';

  String get lastAddedCourseBG => 'assets/images/last_added_course_bg.png';

  String get defaultCourseListBanner =>
      'assets/images/course_listing_course_background.png';
}

/// Prussian Blue
const Color _primaryColor = Color.fromRGBO(2, 48, 71, 1);

/// Blue Green
const Color _primaryVariantColor = Color.fromRGBO(33, 158, 188, 1);

///Cornflower Blue
const Color _primaryVariantLightColor = Color.fromRGBO(142, 202, 230, 1);

/// Selective Yellow
const Color _secondaryVariantColor = Color.fromRGBO(255, 183, 3, 1);

/// Tangerine
const Color _secondaryColor = Color.fromRGBO(251, 133, 0, 1);

const Color _errorColor = Color(0xFFB00020);
