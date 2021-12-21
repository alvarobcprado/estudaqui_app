import 'package:faeng_courses/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class MyTheme {
  static MyTheme of(
    WidgetRef ref, {
    bool listen = false,
  }) {
    return ref.read(themeProvider);
  }

  MyColors get colors;
  MyTextStyles get textStyles;
  MyAssetPaths get assets;
  String get fontFamily;
}

abstract class MyColors {
  static MyColors of(
    WidgetRef ref, {
    bool listen = false,
  }) {
    return ref.read(themeProvider).colors;
  }

  Color get homeSidebarBackground;

  Color get homeContentBackground;

  Color get loginPageBackground;

  Color get loginContainerBackground;
}

abstract class MyTextStyles {
  static MyTextStyles of(
    WidgetRef ref, {
    bool listen = false,
  }) {
    return ref.read(themeProvider).textStyles;
  }
}

abstract class MyAssetPaths {
  static MyAssetPaths of(
    WidgetRef ref, {
    bool listen = false,
  }) {
    return ref.read(themeProvider).assets;
  }
}
