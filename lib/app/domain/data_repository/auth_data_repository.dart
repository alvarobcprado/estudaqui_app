import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataRepository {
  Stream<User?> get authStateChanges;

  User? getCurrentUser();

  Future<void> signInAnonmously();

  Future<void> signOut();

  Future<User?> signInWithEmailAndPassword(String email, String password);
}
