import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/entity/course_module.dart';
import 'package:estudaqui/app/domain/use_case/courses/add_course_and_module_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_course_and_module_uc_test.mocks.dart';

@GenerateMocks([Course, CourseModule, CoursesDataRepository])
void main() {
  late MockCoursesDataRepository mockRepository;
  late MockCourse mockCourse;
  late MockCourseModule mockModule;
  late AddCourseAndModuleUC useCase;

  setUp(() {
    mockRepository = MockCoursesDataRepository();
    mockCourse = MockCourse();
    mockModule = MockCourseModule();
    useCase = AddCourseAndModuleUC(coursesDataRepository: mockRepository);
  });

  test(
    "should add a course and then add a module",
    () async {
      when(mockRepository.addCourse(any)).thenAnswer((_) async {
        return Right(mockCourse);
      });

      when(mockRepository.addCourseModule(any, any)).thenAnswer((_) async {
        return Right(mockModule);
      });

      when(mockCourse.courseId).thenReturn('mockCourseId');

      final eitherResult = await useCase.call(
        params: AddCourseAndModuleParam(
          courseToAdd: mockCourse,
          moduleToAdd: mockModule,
        ),
      );

      eitherResult.fold(
        (failure) => throw Exception(
            'UseCase test error, returned ${failure.toString()}'),
        (success) {
          expect(success, isA<CourseModule>());
        },
      );
      verify(mockRepository.addCourse(any));
      verify(mockRepository.addCourseModule(any, any));

      verifyNoMoreInteractions(mockRepository);
    },
  );
}
