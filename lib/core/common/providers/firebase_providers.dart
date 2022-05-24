import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estudaqui/app/presentation/common/analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final analyticsProvider = Provider<Analytics>(
  (ref) {
    return Analytics(analytics: FirebaseAnalytics.instance);
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
