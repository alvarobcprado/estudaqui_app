import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:faeng_courses/app/domain/data_repository/auth_data_repository.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/core/error/failures.dart';

class GetCurrentUserUC extends UseCase<NoParams, User> {
  GetCurrentUserUC({
    required AuthDataRepository repository,
  }) : _repository = repository;

  final AuthDataRepository _repository;

  @override
  Future<Either<Failure, User>> call({
    required NoParams params,
  }) async =>
      _repository.getCurrentUser();
}
