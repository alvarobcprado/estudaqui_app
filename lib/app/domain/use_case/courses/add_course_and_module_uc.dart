import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/entity/course_module.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';

class AddCourseAndModuleUC extends UseCase<AddCourseAndModuleParam, void> {
  AddCourseAndModuleUC({
    required CoursesDataRepository coursesDataRepository,
  }) : _repository = coursesDataRepository;

  final CoursesDataRepository _repository;

  @override
  Future<Either<Failure, void>> call({
    required AddCourseAndModuleParam params,
  }) async {
    return _repository.addCourseAndModule(
      params.courseToAdd,
      params.moduleToAdd,
    );
  }
}

class AddCourseAndModuleParam {
  AddCourseAndModuleParam({
    required this.courseToAdd,
    required this.moduleToAdd,
  });
  final Course courseToAdd;
  final CourseModule moduleToAdd;
}
