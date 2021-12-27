import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/data_repository/auth_data_repository.dart';
import 'package:faeng_courses/app/domain/use_case/signin_anonmously_uc.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_current_user_uc_test.mocks.dart';

@GenerateMocks([AuthDataRepository, User])
void main() {
  late final AuthDataRepository mockRepository;
  late final SigninAnonmouslyUC useCase;
  User? currentUser;
  setUp(
    () {
      mockRepository = MockAuthDataRepository();
      useCase = SigninAnonmouslyUC(authRepository: mockRepository);
    },
  );

  test(
    'should login a anonmously user',
    () async {
      when(mockRepository.signInAnonmously()).thenAnswer(
        (_) async {
          currentUser = MockUser();
          return const Right(null);
        },
      );

      expect(currentUser, null);

      final result = await useCase.call(params: NoParams());

      expect(result, const Right(null));
      expect(currentUser, isA<User>());
      verify(mockRepository.signInAnonmously());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
