import 'package:dartz/dartz.dart';

import 'package:faeng_courses/app/domain/data_repository/courses_data_repository.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/core/error/failures.dart';

class GetCourseByIdUC extends UseCase<GetCourseByIdParam, Course> {
  GetCourseByIdUC({
    required CoursesDataRepository coursesRepository,
  }) : _coursesRepository = coursesRepository;

  final CoursesDataRepository _coursesRepository;

  @override
  Future<Either<Failure, Course>> call({required params}) async {
    return await _coursesRepository.getCourseById(params.courseId);
  }
}

class GetCourseByIdParam {
  GetCourseByIdParam({
    required this.courseId,
  });

  final String courseId;
}
