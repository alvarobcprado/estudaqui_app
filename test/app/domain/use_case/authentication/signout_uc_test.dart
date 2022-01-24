import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/data_repository/auth_data_repository.dart';
import 'package:faeng_courses/app/domain/use_case/authentication/signout_uc.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signout_uc_test.mocks.dart';

@GenerateMocks([AuthDataRepository, User])
void main() {
  late final AuthDataRepository mockRepository;
  late final SignOutUC useCase;
  User? currentUser;
  setUp(
    () {
      mockRepository = MockAuthDataRepository();
      currentUser = MockUser();
      useCase = SignOutUC(authDataRepository: mockRepository);
    },
  );
  test(
    'should signout the current user',
    () async {
      when(mockRepository.signOut()).thenAnswer(
        (_) async {
          currentUser = null;
          return const Right(null);
        },
      );

      expect(currentUser, isA<User>());

      final result = await useCase.call(params: NoParams());

      expect(result, const Right(null));
      expect(currentUser, null);
      verify(mockRepository.signOut());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
