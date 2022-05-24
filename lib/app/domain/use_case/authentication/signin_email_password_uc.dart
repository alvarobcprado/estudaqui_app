import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:estudaqui/app/domain/data_repository/auth_data_repository.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninEmailPasswordUC extends UseCase<SigninEmailPasswordParams, User> {
  SigninEmailPasswordUC({required AuthDataRepository authDataRepository})
      : _authDataRepository = authDataRepository;

  final AuthDataRepository _authDataRepository;
  @override
  Future<Either<Failure, User>> call({
    required SigninEmailPasswordParams params,
  }) async {
    return _authDataRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SigninEmailPasswordParams extends Equatable {
  const SigninEmailPasswordParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
