import 'package:faeng_courses/common/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userAuthStateProvider = StreamProvider(
  (ref) {
    final firebaseAuth = ref.watch(firebaseAuthProvider).authStateChanges();
    return firebaseAuth;
  },
);

final isUserAuthProvider = Provider.family<bool, User?>(
  (ref, user) {
    return (user != null && !user.isAnonymous);
  },
);
