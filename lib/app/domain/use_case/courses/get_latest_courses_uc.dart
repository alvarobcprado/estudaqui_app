import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/data_repository/courses_data_repository.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/core/error/failure.dart';

class GetLatestCoursesUC extends UseCase<GetLatestCoursesParam, List<Course>> {
  GetLatestCoursesUC({
    required CoursesDataRepository coursesRepository,
  }) : _coursesRepository = coursesRepository;

  final CoursesDataRepository _coursesRepository;
  @override
  Future<Either<Failure, List<Course>>> call({required params}) {
    return _coursesRepository.getLastestCourses(params.coursesNumber);
  }
}

class GetLatestCoursesParam {
  GetLatestCoursesParam({
    required this.coursesNumber,
  });
  final int coursesNumber;
}
