import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/data_repository/auth_data_repository.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/core/error/failure.dart';

class SignOutUC extends UseCase<NoParams, void> {
  SignOutUC({
    required AuthDataRepository authDataRepository,
  }) : _authDataRepository = authDataRepository;

  final AuthDataRepository _authDataRepository;

  @override
  Future<Either<Failure, void>> call({required params}) async {
    return _authDataRepository.signOut();
  }
}
