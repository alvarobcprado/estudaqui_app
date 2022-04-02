import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/data/mapper/domain_to_remote.dart';
import 'package:faeng_courses/app/data/remote/data_source/courses_rds.dart';
import 'package:faeng_courses/app/domain/data_repository/courses_data_repository.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';
import 'package:faeng_courses/core/error/failure.dart';
import 'package:faeng_courses/core/error/failure_type.dart';

class CoursesImpRepository implements CoursesDataRepository {
  CoursesImpRepository({
    required CoursesRDS coursesRDS,
  })  : _coursesRDS = coursesRDS,
        super();

  final CoursesRDS _coursesRDS;

  @override
  Future<Either<Failure, List<Course>>> fetchCourses() async {
    try {
      final coursesCollection = _coursesRDS.getCoursesReference();
      final coursesQuery = await coursesCollection.get();
      final coursesList = coursesQuery.docs.map((e) => e.data()).toList();
      return Right(coursesList);
    } catch (e) {
      return Left(
        Failure.fromType(
          type: const NormalFailure(),
        ),
      );
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
      return Left(
        Failure.fromType(
          type: const NormalFailure(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Course>> addCourse(Course course) async {
    try {
      final coursesCollection = _coursesRDS.getCoursesReference();
      final hasCourseId = course.courseId.isNotEmpty;
      final courseDocument = coursesCollection.doc(
        hasCourseId ? course.courseId : null,
      );
      final courseToAdd = hasCourseId
          ? course
          : course.copyWith(
              courseId: courseDocument.id,
            );
      await courseDocument.set(courseToAdd);
      return Right(courseToAdd);
    } catch (e) {
      return Left(
        Failure.fromType(
          type: const NormalFailure(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Course>>> getLastestCourses(int number) async {
    try {
      final coursesCollection = _coursesRDS.getCoursesReference();

      final query = coursesCollection
          .orderBy('createdAt', descending: true)
          .limit(number);
      final coursesSnapshot = await query.get();

      final courseList = coursesSnapshot.docs.map((e) => e.data()).toList();

      return Right(courseList);
    } catch (e) {
      return Left(
        Failure.fromType(
          type: const NormalFailure(),
        ),
      );
    }
  }

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
      return Left(
        Failure.fromType(
          type: const NormalFailure(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, CourseModule>> getCourseModuleById(
      String courseId, String moduleId) async {
    try {
      final moduleReference =
          _coursesRDS.getCourseModulesReference(courseId).doc(moduleId);
      final courseModuleDoc = await moduleReference.get();
      return Right(courseModuleDoc.data()!);
    } catch (e) {
      return Left(
        Failure.fromType(
          type: const NormalFailure(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, CourseModule>> addCourseModule(
    String courseId,
    CourseModule courseModule,
  ) async {
    try {
      final moduleReference = _coursesRDS.getCourseModulesReference(courseId);
      final hasCourseModuleId = courseModule.moduleId.isNotEmpty;

      final moduleDoc = moduleReference.doc(
        hasCourseModuleId ? courseModule.moduleId : null,
      );

      final moduleToAdd = hasCourseModuleId
          ? courseModule
          : courseModule.copyWith(
              moduleId: moduleDoc.id,
              courseId: courseId,
            );

      await moduleDoc.set(moduleToAdd);
      return Right(moduleToAdd);
    } catch (e) {
      return Left(
        Failure.fromType(
          type: const NormalFailure(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Course>> removeCourseById(String courseId) {
    // TODO: implement removeCourseById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CourseModule>> removeCourseModuleById(
    String courseId,
    String moduleId,
  ) {
    // TODO: implement removeCourseModuleById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Course>> updateCourse(Course newCourseData) {
    // TODO: implement updateCourse
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CourseModule>> updateCourseModule(
    String courseId,
    CourseModule newCourseModule,
  ) {
    // TODO: implement updateCourseModule
    throw UnimplementedError();
  }
}
