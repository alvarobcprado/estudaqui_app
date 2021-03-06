import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/auth_data_repository.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserStateChangesUC extends UseCase<NoParams, Stream<User?>> {
  GetUserStateChangesUC({
    required AuthDataRepository authDataRepository,
  }) : _authDataRepository = authDataRepository;

  final AuthDataRepository _authDataRepository;

  @override
  Future<Either<Failure, Stream<User?>>> call(
      {required NoParams params}) async {
    return Right(_authDataRepository.userStateChanges);
  }
}
