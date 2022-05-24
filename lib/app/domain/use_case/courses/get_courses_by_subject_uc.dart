import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';

class GetCoursesBySubjectUC
    extends UseCase<GetCoursesBySubjectParam, List<Course>> {
  GetCoursesBySubjectUC({
    required CoursesDataRepository coursesDataRepository,
  }) : _coursesDataRepository = coursesDataRepository;

  final CoursesDataRepository _coursesDataRepository;

  @override
  Future<Either<Failure, List<Course>>> call({
    required GetCoursesBySubjectParam params,
  }) {
    return _coursesDataRepository.fetchCoursesBySubject(params.subjectID);
  }
}

class GetCoursesBySubjectParam {
  GetCoursesBySubjectParam({
    required this.subjectID,
  });
  final String subjectID;
}
