import 'package:dartz/dartz.dart';

import 'package:faeng_courses/app/domain/data_repository/courses_data_repository.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/core/error/failures.dart';

class GetCourseModuleByIdUC
    extends UseCase<GetCourseModuleByIdParam, CourseModule> {
  GetCourseModuleByIdUC({
    required CoursesDataRepository coursesRepository,
  }) : _coursesRepository = coursesRepository;

  final CoursesDataRepository _coursesRepository;

  @override
  Future<Either<Failure, CourseModule>> call({required params}) async {
    return await _coursesRepository.getCourseModuleById(
      params.courseId,
      params.courseModuleId,
    );
  }
}

class GetCourseModuleByIdParam {
  GetCourseModuleByIdParam({
    required this.courseId,
    required this.courseModuleId,
  });

  final String courseId;
  final String courseModuleId;
}
