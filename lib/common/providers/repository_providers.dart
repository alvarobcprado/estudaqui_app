import 'package:faeng_courses/app/data/repository/auth_imp_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_providers.dart';

final authRepositoryProvider = Provider<AuthImpRepository>(
  (ref) {
    final authProvider = ref.watch<FirebaseAuth>(
      firebaseAuthProvider,
    );

    return AuthImpRepository(
      authProvider: authProvider,
    );
  },
);
