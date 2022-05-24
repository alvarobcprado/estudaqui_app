import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/use_case/courses/get_course_by_id_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_course_by_id_uc_test.mocks.dart';

@GenerateMocks([Course, CoursesDataRepository])
void main() {
  late MockCoursesDataRepository mockRepository;
  late MockCourse mockCourse;
  late GetCourseByIdUC useCase;

  setUp(() {
    mockRepository = MockCoursesDataRepository();
    mockCourse = MockCourse();
    useCase = GetCourseByIdUC(coursesRepository: mockRepository);
  });

  test(
    "should get the a course by id",
    () async {
      when(
        mockRepository.getCourseById(any),
      ).thenAnswer((_) async => Right(mockCourse));

      final eitherResult = await useCase.call(
        params: GetCourseByIdParam(courseId: ''),
      );

      eitherResult.fold(
        (failure) => throw Exception(
            'UseCase test error, returned ${failure.toString()}'),
        (success) {
          expect(success, isA<Course>());
          expect(success, mockCourse);
        },
      );
      verify(mockRepository.getCourseById(''));

      verifyNoMoreInteractions(mockRepository);
    },
  );
}
