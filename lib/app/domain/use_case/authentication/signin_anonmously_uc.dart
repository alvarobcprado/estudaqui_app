import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/auth_data_repository.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninAnonmouslyUC extends UseCase<NoParams, User> {
  SigninAnonmouslyUC({
    required AuthDataRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthDataRepository _authRepository;

  @override
  Future<Either<Failure, User>> call({required params}) async {
    return _authRepository.signInAnonmously();
  }
}
