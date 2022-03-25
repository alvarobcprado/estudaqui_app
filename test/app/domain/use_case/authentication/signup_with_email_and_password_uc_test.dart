import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/data_repository/auth_data_repository.dart';
import 'package:faeng_courses/app/domain/use_case/authentication/signup_email_password_uc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signup_with_email_and_password_uc_test.mocks.dart';

@GenerateMocks([AuthDataRepository, User])
void main() {
  late final MockAuthDataRepository mockRepository;
  MockUser? mockUser;
  late final SignupEmailPasswordUC useCase;
  const _name = 'Nome';
  const _email = 'email@email.com';
  const _password = 'password';

  setUp(
    () {
      mockRepository = MockAuthDataRepository();
      useCase = SignupEmailPasswordUC(
        authDataRepository: mockRepository,
      );
    },
  );

  test(
    'should signup a user with email and password',
    () async {
      when(
        mockRepository.signUpWithEmailAndPassword(
          name: argThat(isNotNull, named: 'name'),
          email: argThat(isNotNull, named: 'email'),
          password: argThat(isNotNull, named: 'password'),
        ),
      ).thenAnswer(
        (_) async {
          mockUser = MockUser();
          return Right(mockUser!);
        },
      );

      expect(mockUser, isNull);
      final result = await useCase.call(
        params: const SignupEmailPasswordParams(
          name: _name,
          email: _email,
          password: _password,
        ),
      );
      expect(result, Right(mockUser));
      verify(
        mockRepository.signUpWithEmailAndPassword(
          name: _name,
          email: _email,
          password: _password,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
