import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/data_repository/auth_data_repository.dart';
import 'package:faeng_courses/app/domain/use_case/signin_with_email_and_password_uc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signin_with_email_and_password_uc_test.mocks.dart';

@GenerateMocks([AuthDataRepository, User])
void main() {
  late final AuthDataRepository mockRepository;
  late final SigninWithEmailAndPasswordUC useCase;
  late final MockUser currentUser;
  late final String email;
  late final String password;

  setUp(
    () {
      mockRepository = MockAuthDataRepository();
      useCase = SigninWithEmailAndPasswordUC(
        authDataRepository: mockRepository,
      );
      currentUser = MockUser();
      email = 'teste@teste.com';
      password = '1234';
    },
  );

  test(
    'should signin a user with e-mail and password',
    () async {
      when(currentUser.email).thenReturn(email);
      when(currentUser.isAnonymous).thenReturn(currentUser.email == null);
      when(
        mockRepository.signInWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).thenAnswer(
        (_) async {
          return Right(currentUser);
        },
      );

      final result = await useCase.call(
        params: SigninWithEmailAndPasswordParams(
          email: email,
          password: password,
        ),
      );

      expect(result, Right(currentUser));
      if (result.isRight()) {
        final user = result as Right<void, User>;
        expect(user.value.isAnonymous, false);
        expect(user.value.email, email);
      }
      verify(
        mockRepository.signInWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
