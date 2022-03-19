import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';
import 'package:faeng_courses/core/error/failure.dart';

abstract class CoursesDataRepository {
  const CoursesDataRepository();

  Future<Either<Failure, List<Course>>> fetchCourses();

  Future<Either<Failure, Course>> getCourseById(String courseId);

  Future<Either<Failure, Course>> addCourse(Course course);

  Future<Either<Failure, Course>> updateCourse(Course newCourseData);

  Future<Either<Failure, Course>> removeCourseById(String courseId);

  Future<Either<Failure, List<CourseModule>>> fetchCourseModules(
    String courseId,
  );

  Future<Either<Failure, CourseModule>> getCourseModuleById(
    String courseId,
    String moduleId,
  );

  Future<Either<Failure, CourseModule>> addCourseModule(
    String courseId,
    CourseModule courseModule,
  );

  Future<Either<Failure, CourseModule>> updateCourseModule(
    String courseId,
    CourseModule newCourseModule,
  );

  Future<Either<Failure, CourseModule>> removeCourseModuleById(
    String courseId,
    String moduleId,
  );
}
