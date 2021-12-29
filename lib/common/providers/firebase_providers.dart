import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faeng_courses/app/presentation/common/analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) {
    return FirebaseAuth.instance;
  },
);

final firebaseFirestoreProvider = Provider<FirebaseFirestore>(
  (ref) {
    return FirebaseFirestore.instance;
  },
);
