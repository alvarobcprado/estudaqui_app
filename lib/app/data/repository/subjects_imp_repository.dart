import 'package:dartz/dartz.dart';

import 'package:faeng_courses/app/data/remote/data_source/subjects_rds.dart';
import 'package:faeng_courses/app/domain/data_repository/subjects_data_repository.dart';
import 'package:faeng_courses/app/domain/entity/subject.dart';
import 'package:faeng_courses/core/error/failures.dart';
import 'package:faeng_courses/core/error/subject_failure.dart';

class SubjectImpRepository extends SubjectsDataRepository {
  SubjectImpRepository({
    required SubjectsRDS subjectsRDS,
  }) : _subjectsRDS = subjectsRDS;

  final SubjectsRDS _subjectsRDS;

  @override
  Future<Either<Failure, List<Subject>>> fetchSubjects() async {
    try {
      final subjectCollection = _subjectsRDS.getSubjectsReference();
      final subjectsQuery = await subjectCollection.get();
      final subjectList = subjectsQuery.docs.map((e) => e.data()).toList();
      return Right(subjectList);
    } catch (e) {
      // TODO: implement error handler
      return Left(SubjectListFailure());
    }
  }

  @override
  Future<Either<Failure, Subject>> getSubjectById(String subjectId) async {
    try {
      final subjectCollection = _subjectsRDS.getSubjectsReference();
      final subjectsQuery = await subjectCollection.doc(subjectId).get();
      final selectedSubject = subjectsQuery.data();
      if (selectedSubject != null) {
        return Right(selectedSubject);
      } else {
        throw Exception();
      }
    } catch (e) {
      // TODO: implement error handler
      return Left(SubjectByIdFailure());
    }
  }

  @override
  Future<Either<Failure, Subject>> addSubject(Subject subject) {
    // TODO: implement addSubject
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Subject>> deleteSubject(String subjectId) {
    // TODO: implement deleteSubject
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Subject>> updateSubject(
      String subjectId, Subject newSubject) {
    // TODO: implement updateSubject
    throw UnimplementedError();
  }
}
