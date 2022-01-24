import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/data_repository/auth_data_repository.dart';
import 'package:faeng_courses/app/domain/use_case/authentication/signin_anonmously_uc.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signin_with_email_and_password_uc_test.mocks.dart';

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
          return Right(currentUser!);
        },
      );

      expect(currentUser, null);

      final result = await useCase.call(params: NoParams());

      expect(result, Right(currentUser));
      expect(currentUser, isA<User>());
      verify(mockRepository.signInAnonmously());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
