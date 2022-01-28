import 'package:dartz/dartz.dart';

import 'package:faeng_courses/app/domain/data_repository/subjects_data_repository.dart';
import 'package:faeng_courses/app/domain/entity/subject.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/core/error/failures.dart';

class GetSubjectsUC extends UseCase<NoParams, List<Subject>> {
  GetSubjectsUC({
    required SubjectDataRepository subjectsRepository,
  }) : _subjectsRepository = subjectsRepository;

  final SubjectDataRepository _subjectsRepository;

  @override
  Future<Either<Failure, List<Subject>>> call({
    required NoParams params,
  }) async {
    return await _subjectsRepository.fetchSubjects();
  }
}
