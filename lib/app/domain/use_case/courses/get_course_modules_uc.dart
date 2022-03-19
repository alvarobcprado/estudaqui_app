import 'package:dartz/dartz.dart';

import 'package:faeng_courses/app/domain/data_repository/courses_data_repository.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/core/error/failure.dart';

class GetCourseModulesUC
    extends UseCase<GetCourseModulesParam, List<CourseModule>> {
  GetCourseModulesUC({
    required CoursesDataRepository coursesRepository,
  }) : _coursesRepository = coursesRepository;

  final CoursesDataRepository _coursesRepository;

  @override
  Future<Either<Failure, List<CourseModule>>> call({required params}) async {
    return await _coursesRepository.fetchCourseModules(params.courseId);
  }
}

class GetCourseModulesParam {
  GetCourseModulesParam({
    required this.courseId,
  });
  final String courseId;
}
