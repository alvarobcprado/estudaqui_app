import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course_module.dart';
import 'package:estudaqui/app/domain/use_case/courses/get_course_module_by_id_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_course_module_by_id_test.mocks.dart';

@GenerateMocks([CourseModule, CoursesDataRepository])
void main() {
  late MockCoursesDataRepository mockRepository;
  late MockCourseModule mockCourseModule;
  late GetCourseModuleByIdUC useCase;

  setUp(() {
    mockRepository = MockCoursesDataRepository();
    mockCourseModule = MockCourseModule();
    useCase = GetCourseModuleByIdUC(coursesRepository: mockRepository);
  });

  test(
    "should get the course module by id",
    () async {
      when(
        mockRepository.getCourseModuleById(any, any),
      ).thenAnswer((_) async => Right(mockCourseModule));

      final eitherResult = await useCase.call(
        params: GetCourseModuleByIdParam(
          courseId: '',
          courseModuleId: '',
        ),
      );

      eitherResult.fold(
        (failure) => throw Exception(
            'UseCase test error, returned ${failure.toString()}'),
        (success) {
          expect(success, isA<CourseModule>());
          expect(success, mockCourseModule);
        },
      );
      verify(mockRepository.getCourseModuleById('', ''));

      verifyNoMoreInteractions(mockRepository);
    },
  );
}
