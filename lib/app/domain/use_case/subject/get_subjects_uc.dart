import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/subjects_data_repository.dart';
import 'package:estudaqui/app/domain/entity/subject.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';

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
