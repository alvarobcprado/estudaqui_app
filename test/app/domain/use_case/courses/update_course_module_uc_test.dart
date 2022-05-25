import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course_module.dart';
import 'package:estudaqui/app/domain/use_case/courses/update_course_module_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_course_module_uc_test.mocks.dart';

@GenerateMocks([CoursesDataRepository])
void main() {
  late MockCoursesDataRepository mockRepository;

  late UpdateCourseModuleUC useCase;

  setUp(() {
    mockRepository = MockCoursesDataRepository();
    useCase = UpdateCourseModuleUC(repository: mockRepository);
  });

  test(
    "should update a course",
    () async {
      const newCourseModule = CourseModule(
        index: 0,
        moduleId: 'moduleId',
        courseId: 'courseId',
        name: 'name',
        text: 'text',
      );

      when(
        mockRepository.updateCourseModule(any, any),
      ).thenAnswer(
        (invocation) async {
          return const Right(newCourseModule);
        },
      );

      final eitherResult = await useCase.call(
        params: UpdateCourseModuleParam(
          courseId: 'newCourse',
          courseModule: newCourseModule,
        ),
      );

      eitherResult.fold(
        (failure) => throw Exception(
            'UseCase test error, returned ${failure.toString()}'),
        (success) {
          expect(success, newCourseModule);
        },
      );
      verify(mockRepository.updateCourseModule(any, any));

      verifyNoMoreInteractions(mockRepository);
    },
  );
}
