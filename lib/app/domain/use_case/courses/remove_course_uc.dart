import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';

class RemoveCourseUC extends UseCase<RemoveCourseParam, bool> {
  RemoveCourseUC({
    required CoursesDataRepository repository,
  }) : _repository = repository;

  final CoursesDataRepository _repository;

  @override
  Future<Either<Failure, bool>> call({required RemoveCourseParam params}) {
    return _repository.removeCourseById(params.courseId);
  }
}

class RemoveCourseParam {
  final String courseId;
  RemoveCourseParam({
    required this.courseId,
  });
}
