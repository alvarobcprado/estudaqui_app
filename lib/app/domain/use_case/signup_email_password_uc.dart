import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:faeng_courses/app/domain/data_repository/auth_data_repository.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/core/error/failures.dart';

class SignupEmailPasswordUC extends UseCase<SignupEmailPasswordParams, User> {
  SignupEmailPasswordUC({
    required AuthDataRepository authDataRepository,
  }) : _authDataRepository = authDataRepository;

  final AuthDataRepository _authDataRepository;

  @override
  Future<Either<Failure, User>> call({required params}) async {
    return _authDataRepository.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignupEmailPasswordParams extends Equatable {
  const SignupEmailPasswordParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
  @override
  List<Object?> get props => throw UnimplementedError();
}