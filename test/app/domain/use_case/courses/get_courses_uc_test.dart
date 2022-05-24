import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/use_case/courses/get_courses_uc.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_courses_uc_test.mocks.dart';

@GenerateMocks([Course, CoursesDataRepository])
void main() {
  late MockCoursesDataRepository mockRepository;
  late MockCourse mockCourse;
  late GetCoursesUC useCase;

  setUp(() {
    mockRepository = MockCoursesDataRepository();
    mockCourse = MockCourse();
    useCase = GetCoursesUC(coursesRepository: mockRepository);
  });

  test(
    "should get the list of courses",
    () async {
      when(
        mockRepository.fetchCourses(),
      ).thenAnswer((_) async => Right([mockCourse]));

      final eitherResult = await useCase.call(params: NoParams());

      eitherResult.fold(
        (failure) => throw Exception(
            'UseCase test error, returned ${failure.toString()}'),
        (success) {
          expect(success, isA<List<Course>>());
          expect(success.length, 1);
          expect(success, contains(mockCourse));
        },
      );
      verify(mockRepository.fetchCourses());

      verifyNoMoreInteractions(mockRepository);
    },
  );
}
