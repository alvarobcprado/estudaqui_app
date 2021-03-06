import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estudaqui/app/data/mapper/domain_to_remote.dart';
import 'package:estudaqui/app/data/mapper/remote_to_domain.dart';
import 'package:estudaqui/app/data/remote/data_source/courses_rds.dart';
import 'package:estudaqui/app/data/remote/model/course/course_module_rm.dart';
import 'package:estudaqui/app/data/remote/model/course/course_rm.dart';
import 'package:estudaqui/app/data/repository/courses_imp_repository.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/entity/course_module.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'courses_imp_repository_test.mocks.dart';

@GenerateMocks([CoursesRDS])
void main() {
  late MockCoursesRDS mockRDS;
  late CoursesImpRepository repository;
  final FirebaseFirestore fakeFirestore = FakeFirebaseFirestore();
  const String courseIdTest = 'R0vni8I1gaPhZtQOYG3x';
  const String courseIdTest2 = 'E2ohqRPtW8wCINmZy4Aq';
  const String courseModuleIdTest = 'GUkwPae0OHgGv4cuTau8';
  final CollectionReference<Course> coursesReference =
      fakeFirestore.collection('courses').withConverter<Course>(
            fromFirestore: (snapshot, options) =>
                CourseRM.fromJson(snapshot.data()!).toDM(),
            toFirestore: (value, options) => value.toRM().toJson(),
          );
  final CollectionReference<CourseModule> courseModulesReference =
      coursesReference
          .doc(courseIdTest)
          .collection('modules')
          .withConverter<CourseModule>(
            fromFirestore: (snapshot, options) =>
                CourseModuleRM.fromJson(snapshot.data()!).toDM(),
            toFirestore: (value, options) => value.toRM().toJson(),
          );

  Future<void> _mockFakeCourse() async {
    final courseList = await coursesReference.get();

    await coursesReference.doc(courseIdTest).set(
          Course(
            courseId: courseIdTest,
            creatorId: '',
            creatorName: '',
            subject: 'portuguese',
            title: 'Lorem Ipsum',
            subtitle: 'Lorem Ipsum subtitle',
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
            creatorName: '',
            subject: 'math',
            title: 'Math Ipsum',
            subtitle: 'Math Ipsum subtitle',
            createdAt: DateTime.now(),
            projectId: '',
            bannerUrl: '',
            updatedAt: DateTime.now(),
          ),
        );
  }

  Future<void> _mockFakeCourseModules() async {
    await courseModulesReference.doc(courseModuleIdTest).set(
          const CourseModule(
            index: 0,
            moduleId: courseModuleIdTest,
            courseId: courseIdTest,
            name: 'Introduction',
            text: 'Test Text',
          ),
        );
  }

  group(
    'Course repository fetcher',
    () {
      setUp(
        () async {
          mockRDS = MockCoursesRDS();
          repository = CoursesImpRepository(coursesRDS: mockRDS);
          await _mockFakeCourse();
          await _mockFakeCourseModules();
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
          final eitherResult =
              await repository.fetchCourseModules(courseIdTest);

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

      test(
        'should get a courseModule by moduleId',
        () async {
          when(mockRDS.getCourseModulesReference(any)).thenAnswer(
            (_) => courseModulesReference,
          );

          final eitherResult = await repository.getCourseModuleById(
            courseIdTest,
            courseModuleIdTest,
          );

          eitherResult.fold(
            (failure) => throw Exception(
                'Repository test failed, return ${failure.toString()}'),
            (success) async {
              final module = (await courseModulesReference
                      .doc(
                        courseModuleIdTest,
                      )
                      .get())
                  .data();
              expect(success, module);
            },
          );
        },
      );
    },
  );

  group(
    'Course repository setter',
    () {
      setUpAll(
        () {
          mockRDS = MockCoursesRDS();
          repository = CoursesImpRepository(coursesRDS: mockRDS);
        },
      );
      test(
        'should add a course',
        () async {
          when(mockRDS.getCoursesReference()).thenAnswer(
            (realInvocation) => coursesReference,
          );

          const fakeId = 'testAddCourse';

          final fakeCourse = Course(
            courseId: fakeId,
            creatorId: '',
            creatorName: '',
            subject: 'portuguese',
            title: 'Fake course',
            subtitle: 'Fake course subtitle',
            createdAt: DateTime.now(),
            projectId: '',
            bannerUrl: '',
            updatedAt: DateTime.now(),
          );

          final eitherResult = await repository.addCourse(fakeCourse);

          eitherResult.fold(
            (failure) => throw Exception(
                'Repository test error, returned ${failure.toString()}'),
            (success) async {
              expect(success, fakeCourse);
            },
          );
        },
      );

      test(
        'should add a module to course',
        () async {
          when(mockRDS.getCourseModulesReference(any)).thenAnswer(
            (_) => courseModulesReference,
          );

          const fakeId = 'testAddCourseModule';
          const fakeCourseModule = CourseModule(
            index: 5,
            moduleId: fakeId,
            courseId: courseIdTest,
            name: 'TestAddCourseModule Name',
            text: 'TestAddCourseModule Text',
          );

          final eitherResult = await repository.addCourseModule(
            courseIdTest,
            fakeCourseModule,
          );

          eitherResult.fold(
            (failure) => throw Exception(
                'Repository test fail, returned ${failure.toString()}'),
            (success) {
              expect(success, fakeCourseModule);
            },
          );
        },
      );
    },
  );

  group(
    'Course repository delete test',
    () {
      setUpAll(
        () {
          mockRDS = MockCoursesRDS();
          repository = CoursesImpRepository(coursesRDS: mockRDS);
        },
      );
      test(
        'should delete course properly',
        () async {
          when(
            mockRDS.getCoursesReference(),
          ).thenAnswer((realInvocation) => coursesReference);

          when(
            mockRDS.getCourseModulesReference(any),
          ).thenAnswer((realInvocation) => courseModulesReference);

          await _mockFakeCourse();

          final eitherResult = await repository.removeCourseById(courseIdTest);

          eitherResult.fold(
            (failure) => throw Exception(
                'Repository test fail, returned ${failure.toString()}'),
            (success) async {
              expect(success, true);
              final courseListSnapshot = await coursesReference.get();

              expect(
                courseListSnapshot.docs.any(
                  (element) => element.id == courseIdTest,
                ),
                false,
              );
            },
          );
        },
      );

      test(
        'should delete course module properly',
        () async {
          when(
            mockRDS.getCourseModulesReference(any),
          ).thenAnswer((realInvocation) => courseModulesReference);

          await _mockFakeCourseModules();

          final eitherResult = await repository.removeCourseModuleById(
            courseIdTest,
            courseModuleIdTest,
          );

          eitherResult.fold(
            (failure) => throw Exception(
                'Repository test fail, returned ${failure.toString()}'),
            (success) async {
              expect(success, true);
              final courseModuleListSnapshot =
                  await courseModulesReference.get();

              expect(
                courseModuleListSnapshot.docs.any(
                  (element) => element.id == courseModuleIdTest,
                ),
                false,
              );
            },
          );
        },
      );
    },
  );
  group(
    'Course repository update test',
    () {
      setUpAll(
        () {
          mockRDS = MockCoursesRDS();
          repository = CoursesImpRepository(coursesRDS: mockRDS);
        },
      );

      test(
        'should update course properly',
        () async {
          when(
            mockRDS.getCoursesReference(),
          ).thenAnswer((realInvocation) => coursesReference);

          await _mockFakeCourse();

          final fakeCourse = Course(
            courseId: courseIdTest,
            creatorId: '',
            creatorName: '',
            subject: 'portuguese',
            title: 'updated course',
            subtitle: 'Fake course subtitle',
            createdAt: DateTime.now(),
            projectId: '',
            bannerUrl: '',
            updatedAt: DateTime.now(),
          );

          final oldCourse = await coursesReference.doc(courseIdTest).get();

          expect(oldCourse.data()?.title, 'Lorem Ipsum');

          final eitherResult = await repository.updateCourse(fakeCourse);

          eitherResult.fold(
            (failure) => throw Exception(
                'Repository test fail, returned ${failure.toString()}'),
            (success) async {
              expect(success.title, 'updated course');
            },
          );
        },
      );

      test(
        'should update course module properly',
        () async {
          when(
            mockRDS.getCourseModulesReference(any),
          ).thenAnswer((realInvocation) => courseModulesReference);

          await _mockFakeCourseModules();

          const fakeCourseModule = CourseModule(
            index: 5,
            moduleId: courseModuleIdTest,
            courseId: courseIdTest,
            name: 'updated module',
            text: 'TestAddCourseModule Text',
          );

          final oldCourseModule =
              await courseModulesReference.doc(courseModuleIdTest).get();

          expect(oldCourseModule.data()?.name, 'Introduction');

          final eitherResult = await repository.updateCourseModule(
            courseIdTest,
            fakeCourseModule,
          );

          eitherResult.fold(
            (failure) => throw Exception(
                'Repository test fail, returned ${failure.toString()}'),
            (success) async {
              expect(success.name, 'updated module');
            },
          );
        },
      );
    },
  );
}
