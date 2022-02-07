import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faeng_courses/app/data/remote/data_source/subjects_rds.dart';
import 'package:faeng_courses/app/data/remote/model/subject/subject_rm.dart';
import 'package:faeng_courses/app/data/repository/subjects_imp_repository.dart';
import 'package:faeng_courses/app/domain/entity/subject.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:faeng_courses/app/data/mapper/domain_to_remote.dart';
import 'package:faeng_courses/app/data/mapper/remote_to_domain.dart';

import 'subjects_imp_repository_test.mocks.dart';

@GenerateMocks([SubjectsRDS])
void main() {
  late MockSubjectsRDS mockRDS;
  late SubjectImpRepository repository;
  final FirebaseFirestore fakeFirestore = FakeFirebaseFirestore();
  const String subjectIdTest = 'portuguese';
  const String subjectIdTest2 = 'math';
  final subjectsReference =
      fakeFirestore.collection('subject').withConverter<Subject>(
            fromFirestore: (snapshot, options) =>
                SubjectRM.fromJson(snapshot.data()!).toDM(),
            toFirestore: (value, options) => value.toRM().toJson(),
          );

  Future<void> _mockFakeSubject() async {
    await subjectsReference.doc(subjectIdTest).set(
          const Subject(
            subjectId: 'portuguese',
            bannerUrl: '',
            description: 'Portuguese courses',
            name: 'Português',
            isActive: true,
          ),
        );
    await subjectsReference.doc(subjectIdTest2).set(
          const Subject(
            subjectId: 'math',
            bannerUrl: '',
            description: 'Math courses',
            name: 'Matemática',
            isActive: true,
          ),
        );
  }

  group(
    'Subject repository fetcher',
    () {
      setUpAll(
        () async {
          mockRDS = MockSubjectsRDS();
          repository = SubjectImpRepository(subjectsRDS: mockRDS);
          await _mockFakeSubject();
        },
      );
      test(
        'should get a course by courseId',
        () async {
          when(mockRDS.getSubjectsReference()).thenAnswer(
            (_) {
              return subjectsReference;
            },
          );

          final eitherResult = await repository.getSubjectById(subjectIdTest);

          eitherResult.fold(
            (failure) => throw Exception(
              'Repository test error, returned ${failure.toString()}',
            ),
            (success) {
              expect(success, isA<Subject>());
              expect(success.name, 'Português');
            },
          );
        },
      );
      test(
        'should get courses list',
        () async {
          when(mockRDS.getSubjectsReference()).thenAnswer(
            (_) {
              return subjectsReference;
            },
          );

          final eitherResult = await repository.fetchSubjects();

          eitherResult.fold(
            (failure) => throw Exception(
              'Repository test error, returned ${failure.toString()}',
            ),
            (success) {
              expect(success.length, 2);
              expect(success, isA<List<Subject>>());
              expect(success.first.name, 'Português');
            },
          );
        },
      );
    },
  );
}
