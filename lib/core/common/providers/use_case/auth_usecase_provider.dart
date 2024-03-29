import 'package:estudaqui/app/domain/use_case/authentication/get_current_user_uc.dart';
import 'package:estudaqui/app/domain/use_case/authentication/get_user_state_changes_uc.dart';
import 'package:estudaqui/app/domain/use_case/authentication/send_password_reset_email_uc.dart';
import 'package:estudaqui/app/domain/use_case/authentication/signin_social_provider_uc.dart';
import 'package:estudaqui/app/domain/use_case/authentication/signin_anonmously_uc.dart';
import 'package:estudaqui/app/domain/use_case/authentication/signin_email_password_uc.dart';
import 'package:estudaqui/app/domain/use_case/authentication/signout_uc.dart';
import 'package:estudaqui/app/domain/use_case/authentication/signup_email_password_uc.dart';
import 'package:estudaqui/core/common/general_providers.dart';
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

final signupEmailPasswordUCProvider = Provider<SignupEmailPasswordUC>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return SignupEmailPasswordUC(authDataRepository: authRepository);
  },
);

final getUserChangesUCProvider = Provider<GetUserStateChangesUC>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);

    return GetUserStateChangesUC(authDataRepository: authRepository);
  },
);

final sendPasswordResetEmailUCProvider = Provider<SendPasswordResetEmailUC>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return SendPasswordResetEmailUC(authDataRepository: authRepository);
  },
);

final signinSocialProviderUCProvider = Provider<SigninSocialProviderUC>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return SigninSocialProviderUC(authRepository: authRepository);
  },
);
