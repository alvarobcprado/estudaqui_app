import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/entity/subject.dart';
import 'package:estudaqui/core/error/failure.dart';

abstract class SubjectDataRepository {
  Future<Either<Failure, List<Subject>>> fetchSubjects();

  Future<Either<Failure, Subject>> addSubject(Subject subject);

  Future<Either<Failure, Subject>> getSubjectById(String subjectId);

  Future<Either<Failure, Subject>> deleteSubject(String subjectId);

  Future<Either<Failure, Subject>> updateSubject(
    String subjectId,
    Subject newSubject,
  );
}
