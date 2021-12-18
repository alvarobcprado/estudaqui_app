import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:faeng_courses/presentation/common/analytics.dart';
import 'package:faeng_courses/presentation/common/light_theme.dart';
import 'package:faeng_courses/presentation/common/my_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

final analyticsProvider = Provider<Analytics>(
  (ref) {
    return Analytics(analytics: FirebaseAnalytics.instance);
  },
);

final analyticsObserverProvider = Provider<AnalyticsObserver>(
  (ref) {
    return AnalyticsObserver(
      analytics: ref.watch(analyticsProvider),
    );
  },
);

final dioProvider = Provider<Dio>(
  (ref) {
    return Dio();
  },
);

final authProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final databaseProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});
