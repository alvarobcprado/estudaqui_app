import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course_module.dart';
import 'package:estudaqui/app/domain/use_case/courses/remove_course_module_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remove_course_module_uc_test.mocks.dart';

@GenerateMocks([CourseModule, CoursesDataRepository])
void main() {
  late MockCoursesDataRepository mockRepository;
  late MockCourseModule mockCourseModule;
  late RemoveCourseModuleUC useCase;
  const String courseIdTest = 'courseIdTest';
  const String courseIdTest2 = 'courseIdTest2';
  final Map<String, List<CourseModule>> courseModules = {
    courseIdTest: [],
    courseIdTest2: [],
  };

  setUp(() {
    mockRepository = MockCoursesDataRepository();
    mockCourseModule = MockCourseModule();
    useCase = RemoveCourseModuleUC(repository: mockRepository);
    courseModules[courseIdTest]!.add(mockCourseModule);
    courseModules[courseIdTest2]!.add(mockCourseModule);
  });

  test(
    "should remove a course module from the list of course modules",
    () async {
      when(
        mockRepository.removeCourseModuleById(any, any),
      ).thenAnswer(
        (invocation) async {
          courseModules[courseIdTest]!.removeLast();
          return const Right(true);
        },
      );

      final eitherResult = await useCase.call(
        params: RemoveCourseModuleParam(
          courseId: '',
          courseModuleId: '',
        ),
      );

      eitherResult.fold(
        (failure) => throw Exception(
            'UseCase test error, returned ${failure.toString()}'),
        (success) {
          expect(success, true);
          expect(courseModules[courseIdTest], isEmpty);
          expect(courseModules[courseIdTest2], isNotEmpty);
        },
      );
      verify(mockRepository.removeCourseModuleById(any, any));

      verifyNoMoreInteractions(mockRepository);
    },
  );
}
