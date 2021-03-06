import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/subjects_data_repository.dart';
import 'package:estudaqui/app/domain/entity/subject.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';

class GetSubjectByIdUC extends UseCase<GetSubjectByIdParam, Subject> {
  GetSubjectByIdUC({
    required SubjectDataRepository subjectDataRepository,
  }) : _subjectRepository = subjectDataRepository;

  final SubjectDataRepository _subjectRepository;

  @override
  Future<Either<Failure, Subject>> call({
    required GetSubjectByIdParam params,
  }) async {
    return await _subjectRepository.getSubjectById(params.subjectId);
  }
}

class GetSubjectByIdParam {
  GetSubjectByIdParam({
    required this.subjectId,
  });
  final String subjectId;
}
