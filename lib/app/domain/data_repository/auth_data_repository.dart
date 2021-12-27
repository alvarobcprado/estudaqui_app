import 'package:dartz/dartz.dart';
import 'package:faeng_courses/core/error/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataRepository {
  Stream<User?> get authStateChanges;

  Future<Either<Failure, User>> getCurrentUser();

  Future<Either<Failure, User>> signInAnonmously();

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, User>> signInWithEmailAndPassword(
    String email,
    String password,
  );
}
