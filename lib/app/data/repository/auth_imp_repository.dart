import 'package:firebase_auth/firebase_auth.dart';

import 'package:faeng_courses/app/domain/data_repository/auth_data_repository.dart';

class AuthImpRepository implements AuthDataRepository {
  AuthImpRepository({
    required FirebaseAuth authProvider,
  }) : _authProvider = authProvider;

  final FirebaseAuth _authProvider;

  @override
  Stream<User?> get authStateChanges => _authProvider.authStateChanges();

  @override
  User? getCurrentUser() => _authProvider.currentUser;

  @override
  Future<void> signInAnonmously() async {
    await _authProvider.signInAnonymously();
  }

  @override
  Future<void> signOut() async {
    await _authProvider.signOut();
    await _authProvider.signInAnonymously();
  }

  @override
  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final userCredential = await _authProvider.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user;
  }
}
