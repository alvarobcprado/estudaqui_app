import 'package:dartz/dartz.dart';

import 'package:faeng_courses/app/domain/data_repository/courses_data_repository.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/core/error/failures.dart';

class AddCourseAndModuleUC
    extends UseCase<AddCourseAndModuleParam, CourseModule> {
  AddCourseAndModuleUC({
    required CoursesDataRepository coursesDataRepository,
  }) : _repository = coursesDataRepository;

  final CoursesDataRepository _repository;

  @override
  Future<Either<Failure, CourseModule>> call({
    required AddCourseAndModuleParam params,
  }) async {
    late Either<Failure, CourseModule> response;
    final eitherAddCourse = await _repository.addCourse(params.courseToAdd);

    response = await eitherAddCourse.fold(
      (courseFailure) => Left(courseFailure),
      (course) async {
        final eitherAddModule = await _repository.addCourseModule(
          course.courseId,
          params.moduleToAdd,
        );

        return eitherAddModule.fold(
          (moduleFailure) => Left(moduleFailure),
          (module) => Right(module),
        );
      },
    );

    return response;
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
