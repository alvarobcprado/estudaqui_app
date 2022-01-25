import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/data_repository/courses_data_repository.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';
import 'package:faeng_courses/app/domain/use_case/courses/add_course_module_uc.dart';
import 'package:faeng_courses/app/domain/use_case/courses/add_course_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'add_course_module_uc_test.mocks.dart';

@GenerateMocks([CourseModule, CoursesDataRepository])
void main() {
  late MockCoursesDataRepository mockRepository;
  late MockCourseModule mockCourseModule;
  late AddCourseModuleUC useCase;
  const String courseIdTest = 'courseIdTest';
  const String courseIdTest2 = 'courseIdTest2';
  final Map<String, List<CourseModule>> courseModules = {
    courseIdTest: [],
    courseIdTest2: [],
  };

  setUp(() {
    mockRepository = MockCoursesDataRepository();
    mockCourseModule = MockCourseModule();
    useCase = AddCourseModuleUC(coursesRepository: mockRepository);
  });

  test(
    "should add a course to the list of courses",
    () async {
      when(
        mockRepository.addCourseModule(any, any),
      ).thenAnswer(
        (invocation) async {
          courseModules[courseIdTest]!.add(
            invocation.positionalArguments.last as CourseModule,
          );
          return Right(mockCourseModule);
        },
      );

      final eitherResult = await useCase.call(
        params: AddCourseModuleParam(
          courseId: '',
          courseModule: mockCourseModule,
        ),
      );

      eitherResult.fold(
        (failure) => throw Exception(
            'UseCase test error, returned ${failure.toString()}'),
        (success) {
          expect(success, isA<CourseModule>());
          expect(courseModules[courseIdTest]?.length, 1);
          expect(courseModules[courseIdTest], contains(success));
          expect(courseModules[courseIdTest2], isEmpty);
        },
      );
      verify(mockRepository.addCourseModule(any, any));

      verifyNoMoreInteractions(mockRepository);
    },
  );
}
