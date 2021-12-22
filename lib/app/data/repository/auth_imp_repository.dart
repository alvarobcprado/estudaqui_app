import 'package:dartz/dartz.dart';
import 'package:faeng_courses/core/error/failures.dart';
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
  Either<Failure, User> getCurrentUser() {
    final user = _authProvider.currentUser;
    if (user != null) {
      return Right(user);
    }
    return Left(CurrentUserFailure());
  }

  @override
  Future<Either<Failure, void>> signInAnonmously() async {
    try {
      await _authProvider.signInAnonymously();
      return const Right(null);
    } catch (e) {
      return Left(
        SignInUserFailure(
          signinMethod: SignInMethod.anonymous,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _authProvider.signInAnonymously();
      await _authProvider.signInAnonymously();

      return const Right(null);
    } catch (e) {
      return Left(
        SignOutUserFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _authProvider.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return Right(userCredential.user!);
      } else {
        throw Exception();
      }
    } catch (e) {
      return Left(
        SignInUserFailure(
          signinMethod: SignInMethod.emailAndPassword,
        ),
      );
    }
  }
}
