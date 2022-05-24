import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';

class AddCourseUC extends UseCase<AddCourseParam, Course> {
  AddCourseUC({
    required CoursesDataRepository coursesRepository,
  }) : _coursesRepository = coursesRepository;

  final CoursesDataRepository _coursesRepository;

  @override
  Future<Either<Failure, Course>> call({required params}) async {
    return await _coursesRepository.addCourse(params.course);
  }
}

class AddCourseParam {
  AddCourseParam({
    required this.course,
  });
  final Course course;
}
