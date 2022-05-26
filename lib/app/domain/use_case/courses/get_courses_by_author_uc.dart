import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';

class GetCoursesByAuthorUC
    extends UseCase<GetCoursesByAuthorParam, List<Course>> {
  GetCoursesByAuthorUC({
    required CoursesDataRepository coursesDataRepository,
  }) : _coursesDataRepository = coursesDataRepository;

  final CoursesDataRepository _coursesDataRepository;

  @override
  Future<Either<Failure, List<Course>>> call({
    required GetCoursesByAuthorParam params,
  }) {
    return _coursesDataRepository.fetchCoursesByAuthor(params.authorID);
  }
}

class GetCoursesByAuthorParam {
  GetCoursesByAuthorParam({
    required this.authorID,
  });
  final String authorID;
}
