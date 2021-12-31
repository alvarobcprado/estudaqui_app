import 'package:faeng_courses/app/domain/use_case/get_current_user_uc.dart';
import 'package:faeng_courses/app/domain/use_case/signin_anonmously_uc.dart';
import 'package:faeng_courses/app/domain/use_case/signin_email_password_uc.dart';
import 'package:faeng_courses/app/domain/use_case/signout_uc.dart';
import 'package:faeng_courses/app/domain/use_case/signup_email_password_uc.dart';
import 'package:faeng_courses/common/general_providers.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final signinEmailPasswordUCProvider = Provider<SigninEmailPasswordUC>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return SigninEmailPasswordUC(authDataRepository: authRepository);
  },
);

final signinAnonmouslyUCProvider = Provider<SigninAnonmouslyUC>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return SigninAnonmouslyUC(authRepository: authRepository);
  },
);

final signoutUCProvider = Provider<SignOutUC>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return SignOutUC(authDataRepository: authRepository);
  },
);

final getCurrentUserUCProvider = Provider<GetCurrentUserUC>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return GetCurrentUserUC(authRepository: authRepository);
  },
);

final signupEmailPasswordProvider = Provider<SignupEmailPasswordUC>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return SignupEmailPasswordUC(authDataRepository: authRepository);
  },
);