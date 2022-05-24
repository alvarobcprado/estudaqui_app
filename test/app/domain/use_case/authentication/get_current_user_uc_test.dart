import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/data_repository/auth_data_repository.dart';
import 'package:estudaqui/app/domain/use_case/authentication/get_current_user_uc.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_current_user_uc_test.mocks.dart';

@GenerateMocks([User, AuthDataRepository])
void main() {
  late MockAuthDataRepository mockRepository;
  late MockUser currentUser;
  late GetCurrentUserUC useCase;

  setUp(() {
    mockRepository = MockAuthDataRepository();
    currentUser = MockUser();
    useCase = GetCurrentUserUC(authRepository: mockRepository);
  });

  test(
    "should get the current user logged",
    () async {
      when(
        mockRepository.getCurrentUser(),
      ).thenAnswer((_) async => Right(currentUser));

      final result = await useCase.call(params: NoParams());

      expect(result, Right(currentUser));
      verify(mockRepository.getCurrentUser());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
