import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/data/remote/data_source/courses_rds.dart';
import 'package:faeng_courses/app/domain/data_repository/courses_data_repository.dart';
import 'package:faeng_courses/core/error/course_failure.dart';
import 'package:faeng_courses/core/error/failures.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';

class CoursesImpRepository implements CoursesDataRepository {
  CoursesImpRepository({
    required CoursesRDS coursesRDS,
  })  : _coursesRDS = coursesRDS,
        super();

  final CoursesRDS _coursesRDS;

  @override
  Future<Either<Failure, List<CourseModule>>> fetchCourseModules(
    String courseId,
  ) async {
    try {
      final courseModuleCollection =
          _coursesRDS.getCourseModulesReference(courseId);
      final modulesSnapshot = await courseModuleCollection.get();
      if (modulesSnapshot.docs.isNotEmpty) {
        final courseModulesList = modulesSnapshot.docs
            .map(
              (snapshot) => snapshot.data(),
            )
            .toList();
        return Right(courseModulesList);
      } else {
        return const Right([]);
      }
    } catch (e) {
      return Left(CourseModuleListFailure());
    }
  }

  @override
  Future<Either<Failure, List<Course>>> fetchCourses() async {
    try {
      final coursesCollection = _coursesRDS.getCoursesReference();
      final coursesQuery = await coursesCollection.get();
      final coursesList = coursesQuery.docs.map((e) => e.data()).toList();
      return Right(coursesList);
    } catch (e) {
      return Left(CourseListFailure());
    }
  }

  @override
  Future<Either<Failure, Course>> getCourseById(String courseId) async {
    try {
      final coursesCollection = _coursesRDS.getCoursesReference();
      final courseDoc = await coursesCollection.doc(courseId).get();
      if (courseDoc.data() != null) {
        return Right(courseDoc.data()!);
      } else {
        throw Exception();
      }
    } catch (e) {
      return Left(CourseByIdFailure());
    }
  }
}
