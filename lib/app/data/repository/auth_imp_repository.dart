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
  Future<Either<Failure, User>> getCurrentUser() async {
    final user = _authProvider.currentUser;
    if (user != null) {
      return Right(user);
    }
    return Left(CurrentUserFailure());
  }

  @override
  Future<Either<Failure, User>> signInAnonmously() async {
    try {
      final userCredential = await _authProvider.signInAnonymously();

      if (userCredential.user != null && userCredential.user!.isAnonymous) {
        return Right(userCredential.user!);
      } else {
        throw Exception();
      }
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
      await _authProvider.signOut();
      final userCredential = await _authProvider.signInAnonymously();

      if (userCredential.user != null && userCredential.user!.isAnonymous) {
        return const Right(null);
      } else {
        throw Exception();
      }
    } catch (e) {
      return Left(
        SignOutUserFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _authProvider.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null && !userCredential.user!.isAnonymous) {
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

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      if (_authProvider.currentUser != null &&
          !_authProvider.currentUser!.isAnonymous) {
        final userCredential =
            await _authProvider.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        return Right(userCredential.user!);
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return Left(
          SignUpFailure(
            signUpCode: SignUpCode.emailAlreadyUsed,
          ),
        );
      } else {
        throw Exception();
      }
    } catch (e) {
      return Left(
        SignUpFailure(
          signUpCode: SignUpCode.other,
        ),
      );
    }
  }
}
