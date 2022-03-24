import 'package:dartz/dartz.dart';
import 'package:faeng_courses/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataRepository {
  Stream<User?> get authStateChanges;

  Future<Either<Failure, User>> getCurrentUser();

  Future<Either<Failure, User>> signInAnonmously();

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
}
