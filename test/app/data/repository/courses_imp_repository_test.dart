import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/data/remote/data_source/courses_rds.dart';
import 'package:faeng_courses/app/data/remote/model/course_module_rm.dart';
import 'package:faeng_courses/app/data/remote/model/course_rm.dart';
import 'package:faeng_courses/app/data/repository/courses_imp_repository.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';
import 'package:faeng_courses/core/error/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:faeng_courses/app/data/mapper/domain_to_remote.dart';
import 'package:faeng_courses/app/data/mapper/remote_to_domain.dart';

import 'courses_imp_repository_test.mocks.dart';

@GenerateMocks([CoursesRDS])
void main() {
  late MockCoursesRDS mockRDS;
  late CoursesImpRepository repository;
  final FirebaseFirestore fakeFirestore = FakeFirebaseFirestore();
  const String courseIdTest = 'R0vni8I1gaPhZtQOYG3x';
  const String courseIdTest2 = 'E2ohqRPtW8wCINmZy4Aq';
  const String courseModuleIdTest = 'GUkwPae0OHgGv4cuTau8';
  final coursesReference =
      fakeFirestore.collection('courses').withConverter<Course>(
            fromFirestore: (snapshot, options) =>
                CourseRM.fromJson(snapshot.data()!).toDM(),
            toFirestore: (value, options) => value.toRM().toJson(),
          );
  final courseModulesReference = coursesReference
      .doc(courseIdTest)
      .collection('modules')
      .withConverter<CourseModule>(
        fromFirestore: (snapshot, options) =>
            CourseModuleRM.fromJson(snapshot.data()!).toDM(),
        toFirestore: (value, options) => value.toRM().toJson(),
      );

  Future<void> _addFakeCourse() async {
    await coursesReference.doc(courseIdTest).set(
          Course(
            courseId: courseIdTest,
            creatorId: '',
            subject: 'portuguese',
            title: 'Lorem Ipsum',
            createdAt: DateTime.now(),
            projectId: '',
            bannerUrl: '',
            updatedAt: DateTime.now(),
          ),
        );
    await coursesReference.doc(courseIdTest2).set(
          Course(
            courseId: courseIdTest2,
            creatorId: '',
            subject: 'math',
            title: 'Math Ipsum',
            createdAt: DateTime.now(),
            projectId: '',
            bannerUrl: '',
            updatedAt: DateTime.now(),
          ),
        );
  }

  Future<void> _addFakeCourseModules() async {
    await courseModulesReference.doc(courseModuleIdTest).set(
          const CourseModule(
            index: 0,
            moduleId: courseModuleIdTest,
            name: 'Introduction',
            text: 'Test Text',
          ),
        );
  }

  setUpAll(
    () async {
      mockRDS = MockCoursesRDS();
      repository = CoursesImpRepository(coursesRDS: mockRDS);
      await _addFakeCourse();
      await _addFakeCourseModules();
    },
  );

  test(
    'should get a course by courseId',
    () async {
      when(mockRDS.getCoursesReference()).thenAnswer(
        (_) {
          return coursesReference;
        },
      );

      final courseSnapshot = await coursesReference.doc(courseIdTest).get();
      final eitherResult = await repository.getCourseById(courseIdTest);

      eitherResult.fold(
        (failure) => throw Exception(
          'Repository test error, returned ${failure.toString()}',
        ),
        (success) {
          expect(
            success,
            courseSnapshot.data()!,
          );
        },
      );
    },
  );

  test(
    'should get courseModules list by courseId',
    () async {
      when(mockRDS.getCourseModulesReference(any)).thenAnswer(
        (_) {
          return courseModulesReference;
        },
      );
      final courseModuleSnapshot =
          await courseModulesReference.doc(courseModuleIdTest).get();
      final eitherResult = await repository.fetchCourseModules(courseIdTest);

      eitherResult.fold(
        (failure) => throw Exception(
          'Repository test error, returned ${failure.toString()}',
        ),
        (success) {
          expect(
            success,
            [courseModuleSnapshot.data()!],
          );
        },
      );
    },
  );

  test(
    'should get courses list',
    () async {
      when(mockRDS.getCoursesReference()).thenAnswer(
        (_) {
          return coursesReference;
        },
      );

      final courseListSnapshot = await coursesReference.get();
      final eitherResult = await repository.fetchCourses();

      eitherResult.fold(
        (failure) => throw Exception(
          'Repository test error, returned ${failure.toString()}',
        ),
        (success) => expect(
          success,
          courseListSnapshot.docs.map((e) => e.data()).toList(),
        ),
      );
    },
  );
}
