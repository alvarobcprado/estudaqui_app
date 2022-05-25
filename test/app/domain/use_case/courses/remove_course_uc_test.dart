import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/use_case/courses/remove_course_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remove_course_uc_test.mocks.dart';

@GenerateMocks([Course, CoursesDataRepository])
void main() {
  late MockCoursesDataRepository mockRepository;
  late MockCourse mockCourse;
  late RemoveCourseUC useCase;
  final List<Course> courses = [];

  setUp(() {
    mockRepository = MockCoursesDataRepository();
    mockCourse = MockCourse();
    useCase = RemoveCourseUC(repository: mockRepository);
    courses.add(mockCourse);
  });

  test(
    "should remove a course from the list of courses",
    () async {
      when(
        mockRepository.removeCourseById(any),
      ).thenAnswer(
        (invocation) async {
          courses.removeLast();
          return const Right(true);
        },
      );

      final eitherResult = await useCase.call(
        params: RemoveCourseParam(
          courseId: '',
        ),
      );

      eitherResult.fold(
        (failure) => throw Exception(
            'UseCase test error, returned ${failure.toString()}'),
        (success) {
          expect(success, true);
          expect(courses.length, 0);
        },
      );
      verify(mockRepository.removeCourseById(any));

      verifyNoMoreInteractions(mockRepository);
    },
  );
}
