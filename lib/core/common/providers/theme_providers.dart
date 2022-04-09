import 'package:faeng_courses/app/presentation/common/theme/light_theme.dart';
import 'package:faeng_courses/app/presentation/common/theme/my_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = Provider<MyTheme>(
  (ref) {
    // TODO(Alvaro): Use this when dark theme is implemented
    // if (SchedulerBinding.instance != null) {
    //   return SchedulerBinding.instance?.window.platformBrightness ==
    //           Brightness.dark
    //       ? DarkTheme()
    //       : FpLightTheme();
    // } else {
    //   return FpLightTheme();
    // }
    return LightTheme();
  },
);
