import 'package:firebase_analytics/firebase_analytics.dart';

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
