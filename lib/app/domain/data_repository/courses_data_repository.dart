import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';
import 'package:faeng_courses/core/error/failures.dart';

abstract class CoursesDataRepository {
  const CoursesDataRepository();

  Future<Either<Failure, List<Course>>> fetchCourses();

  Future<Either<Failure, Course>> getCourseById(String courseId);

  Future<Either<Failure, List<CourseModule>>> fetchCourseModules(
    String courseId,
  );

  Future<Either<Failure, CourseModule>> getCourseModuleById(String moduleId);

  Future<Either<Failure, Course>> addCourse(Course course);

  Future<Either<Failure, CourseModule>> addCourseModule(
    String courseId,
    CourseModule courseModule,
  );
}
