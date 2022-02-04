import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/data_repository/subjects_data_repository.dart';
import 'package:faeng_courses/app/domain/entity/subject.dart';
import 'package:faeng_courses/app/domain/use_case/subject/get_subject_by_id_uc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_subjects_uc_test.mocks.dart';

@GenerateMocks([SubjectDataRepository])
void main() {
  late MockSubjectDataRepository mockRepository;
  late GetSubjectByIdUC usecase;
  late Subject mockSubject;

  setUpAll(
    () {
      mockRepository = MockSubjectDataRepository();
      usecase = GetSubjectByIdUC(subjectDataRepository: mockRepository);
      mockSubject = const Subject(
        subjectId: 'math',
        bannerUrl: 'bannerUrl',
        description: 'description',
        name: 'Math',
        isActive: true,
      );
    },
  );
  group(
    'Get subject success',
    () {
      test(
        'should get a subject by its Id',
        () async {
          when(mockRepository.getSubjectById(any)).thenAnswer(
            (_) async => Right(mockSubject),
          );

          final eitherResult = await usecase.call(
            params: GetSubjectByIdParam(subjectId: 'math'),
          );

          eitherResult.fold(
            (failure) => throw Exception(
                'Use case test error returned ${failure.toString()}'),
            (success) {
              expect(success, isA<Subject>());
              expect(success.name, 'Math');
            },
          );
        },
      );
    },
  );
}
