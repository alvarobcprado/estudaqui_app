import 'package:faeng_courses/presentation/common/my_theme.dart';

class MyLightColors implements MyColors {}

class MyLightTextStyles implements MyTextStyles {}

class MyLightAssetPaths implements MyAssetPaths {}

class MyLightTheme implements MyTheme {
  @override
  // TODO(Alvaro): implement assets
  MyAssetPaths get assets => MyLightAssetPaths();

  @override
  // TODO(Alvaro): implement colors
  MyColors get colors => MyLightColors();

  // TODO(Alvaro): implement fontFamily
  @override
  String get fontFamily => '';

  @override
  // TODO(Alvaro): implement textStyles
  MyTextStyles get textStyles => MyLightTextStyles();
}
