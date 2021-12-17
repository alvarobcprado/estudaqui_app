abstract class MyTheme {
  // TODO(Alvaro): implements when define dependency injection
  // static MyColors of(
  //   BuildContext context,
  // ) {
  //   return MyTheme();
  // }

  MyColors get colors;
  MyTextStyles get textStyles;
  MyAssetPaths get assets;
  String get fontFamily;
}

abstract class MyColors {}

abstract class MyTextStyles {}

abstract class MyAssetPaths {}
