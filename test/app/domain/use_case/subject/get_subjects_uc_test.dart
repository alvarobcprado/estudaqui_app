import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/data_repository/subjects_data_repository.dart';
import 'package:faeng_courses/app/domain/entity/subject.dart';
import 'package:faeng_courses/app/domain/use_case/subject/get_subjects_uc.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_subjects_uc_test.mocks.dart';

@GenerateMocks([SubjectDataRepository])
void main() {
  late SubjectDataRepository mockRepository;
  late GetSubjectsUC usecase;
  late List<Subject> mockSubjectList;
  late Subject mockSubject;

  setUpAll(
    () {
      mockRepository = MockSubjectDataRepository();
      usecase = GetSubjectsUC(subjectsRepository: mockRepository);
      mockSubject = const Subject(
        bannerUrl: 'bannerUrl',
        description: 'description',
        name: 'Math',
        isActive: true,
      );
      mockSubjectList = [mockSubject];
    },
  );
  group(
    'Get subjects success',
    () {
      test(
        'should get a list of subject',
        () async {
          when(mockRepository.fetchSubjects()).thenAnswer(
            (_) async => Right(mockSubjectList),
          );

          final eitherResult = await usecase.call(params: NoParams());

          eitherResult.fold(
            (failure) => throw Exception(
                'Use case test error returned ${failure.toString()}'),
            (success) {
              expect(success, isA<List<Subject>>());
              expect(success.length, 1);
              expect(success.first, mockSubject);
            },
          );
        },
      );
    },
  );
}
