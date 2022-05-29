import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course_module.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';

class UpdateCourseModuleUC
    extends UseCase<UpdateCourseModuleParam, CourseModule> {
  UpdateCourseModuleUC({
    required CoursesDataRepository repository,
  }) : _repository = repository;

  final CoursesDataRepository _repository;

  @override
  Future<Either<Failure, CourseModule>> call({
    required UpdateCourseModuleParam params,
  }) {
    return _repository.updateCourseModule(
      params.courseId,
      params.courseModule,
    );
  }
}

class UpdateCourseModuleParam {
  final String courseId;
  final CourseModule courseModule;
  UpdateCourseModuleParam({
    required this.courseId,
    required this.courseModule,
  });
}
