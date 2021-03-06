import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course_module.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';

class AddCourseModuleUC extends UseCase<AddCourseModuleParam, CourseModule> {
  AddCourseModuleUC({
    required CoursesDataRepository coursesRepository,
  }) : _coursesRepository = coursesRepository;

  final CoursesDataRepository _coursesRepository;

  @override
  Future<Either<Failure, CourseModule>> call({required params}) async {
    return await _coursesRepository.addCourseModule(
      params.courseId,
      params.courseModule,
    );
  }
}

class AddCourseModuleParam {
  AddCourseModuleParam({
    required this.courseId,
    required this.courseModule,
  });
  final String courseId;
  final CourseModule courseModule;
}
