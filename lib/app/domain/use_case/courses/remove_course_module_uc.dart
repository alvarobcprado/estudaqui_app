import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';

class RemoveCourseModuleUC extends UseCase<RemoveCourseModuleParam, bool> {
  RemoveCourseModuleUC({
    required CoursesDataRepository repository,
  }) : _repository = repository;

  final CoursesDataRepository _repository;

  @override
  Future<Either<Failure, bool>> call({
    required RemoveCourseModuleParam params,
  }) {
    return _repository.removeCourseModuleById(
      params.courseId,
      params.courseModuleId,
    );
  }
}

class RemoveCourseModuleParam {
  final String courseId;
  final String courseModuleId;
  RemoveCourseModuleParam({
    required this.courseId,
    required this.courseModuleId,
  });
}
