import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/data_repository/courses_data_repository.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';

import 'package:faeng_courses/app/domain/use_case/courses/get_course_modules_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_course_modules_uc_test.mocks.dart';

@GenerateMocks([CourseModule, CoursesDataRepository])
void main() {
  late MockCoursesDataRepository mockRepository;
  late MockCourseModule mockCourseModule;
  late GetCourseModulesUC useCase;

  setUp(() {
    mockRepository = MockCoursesDataRepository();
    mockCourseModule = MockCourseModule();
    useCase = GetCourseModulesUC(coursesRepository: mockRepository);
  });

  test(
    "should get the list of modules from course",
    () async {
      when(
        mockRepository.fetchCourseModules(any),
      ).thenAnswer(
        (invocation) async {
          return Right([mockCourseModule]);
        },
      );

      final eitherResult = await useCase.call(
        params: GetCourseModulesParam(
          courseId: '',
        ),
      );

      eitherResult.fold(
        (failure) => throw Exception(
            'UseCase test error, returned ${failure.toString()}'),
        (success) {
          expect(success, isA<List<CourseModule>>());
          expect(success.length, 1);
          expect(success, contains(mockCourseModule));
        },
      );
      verify(mockRepository.fetchCourseModules(any));

      verifyNoMoreInteractions(mockRepository);
    },
  );
}
