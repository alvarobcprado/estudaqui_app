import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';

class GetLatestCoursesUC
    extends UseCase<GetLatestCoursesParam, Stream<List<Course>>> {
  GetLatestCoursesUC({
    required CoursesDataRepository coursesRepository,
  }) : _coursesRepository = coursesRepository;

  final CoursesDataRepository _coursesRepository;
  @override
  Future<Either<Failure, Stream<List<Course>>>> call({required params}) {
    return _coursesRepository.getLastestCourses(params.coursesNumber);
  }
}

class GetLatestCoursesParam {
  GetLatestCoursesParam({
    required this.coursesNumber,
  });
  final int coursesNumber;
}
