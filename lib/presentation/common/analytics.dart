import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routemaster/routemaster.dart';

class Analytics {
  Analytics({required FirebaseAnalytics analytics}) : _analytics = analytics;

  final FirebaseAnalytics _analytics;

  Future<void> logPageView({required String pageLocation}) async =>
      _analytics.logEvent(
        name: 'page_view',
        parameters: {
          pageLocation: pageLocation,
        },
      );
}

class AnalyticsObserver extends RoutemasterObserver {
  AnalyticsObserver({required Analytics analytics}) : _analytics = analytics;

  final Analytics _analytics;

  @override
  void didChangeRoute(RouteData routeData, Page page) async {
    await SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: page.name,
        primaryColor: Colors.white.value,
      ),
    );
    await _analytics.logPageView(
      pageLocation: routeData.fullPath,
    );
  }
}
