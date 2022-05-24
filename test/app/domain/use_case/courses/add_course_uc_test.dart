import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/use_case/courses/add_course_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_course_uc_test.mocks.dart';

@GenerateMocks([Course, CoursesDataRepository])
void main() {
  late MockCoursesDataRepository mockRepository;
  late MockCourse mockCourse;
  late AddCourseUC useCase;
  final List<Course> courses = [];

  setUp(() {
    mockRepository = MockCoursesDataRepository();
    mockCourse = MockCourse();
    useCase = AddCourseUC(coursesRepository: mockRepository);
  });

  test(
    "should add a course to the list of courses",
    () async {
      when(
        mockRepository.addCourse(any),
      ).thenAnswer(
        (invocation) async {
          courses.add(invocation.positionalArguments.first as Course);
          return Right(mockCourse);
        },
      );

      final eitherResult = await useCase.call(
        params: AddCourseParam(
          course: mockCourse,
        ),
      );

      eitherResult.fold(
        (failure) => throw Exception(
            'UseCase test error, returned ${failure.toString()}'),
        (success) {
          expect(success, isA<Course>());
          expect(courses.length, 1);
          expect(courses, contains(success));
        },
      );
      verify(mockRepository.addCourse(any));

      verifyNoMoreInteractions(mockRepository);
    },
  );
}
