import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/use_case/courses/update_course_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_course_uc_test.mocks.dart';

@GenerateMocks([CoursesDataRepository])
void main() {
  late MockCoursesDataRepository mockRepository;

  late UpdateCourseUC useCase;

  setUp(() {
    mockRepository = MockCoursesDataRepository();
    useCase = UpdateCourseUC(repository: mockRepository);
  });

  test(
    "should update a course",
    () async {
      final newCourse = Course(
        courseId: 'courseId',
        creatorId: 'creatorId',
        creatorName: 'creatorName',
        subject: 'subject',
        title: 'title',
        subtitle: 'subtitle',
        createdAt: DateTime.now(),
        projectId: 'projectId',
        bannerUrl: 'bannerUrl',
        updatedAt: DateTime.now(),
      );

      when(
        mockRepository.updateCourse(any),
      ).thenAnswer(
        (invocation) async {
          return Right(newCourse);
        },
      );

      final eitherResult = await useCase.call(
        params: UpdateCourseParam(
          course: newCourse,
        ),
      );

      eitherResult.fold(
        (failure) => throw Exception(
            'UseCase test error, returned ${failure.toString()}'),
        (success) {
          expect(success, newCourse);
        },
      );
      verify(mockRepository.updateCourse(any));

      verifyNoMoreInteractions(mockRepository);
    },
  );
}
