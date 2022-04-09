import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isUserAuthProvider = Provider.family<bool, User>(
  (ref, user) {
    return (!user.isAnonymous && user.email != null);
  },
);

final userAuthChangeProvider = StreamProvider(
  (ref) async* {
    final userChange = ref.watch(
      authRepositoryProvider.select(
        (value) => value.authStateChanges,
      ),
    );
    await for (final value in userChange) {
      yield value;
    }
  },
);
