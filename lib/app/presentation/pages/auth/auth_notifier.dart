import 'package:faeng_courses/app/domain/use_case/authentication/get_current_user_uc.dart';
import 'package:faeng_courses/app/domain/use_case/authentication/signin_anonmously_uc.dart';
import 'package:faeng_courses/app/domain/use_case/authentication/signin_email_password_uc.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/app/presentation/pages/auth/state/auth_state.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthContainerNotifier, AuthState>(
  (ref) {
    final signinAnonmouslyUC = ref.watch(signinAnonmouslyUCProvider);
    final signinEmailPasswordUC = ref.watch(signinEmailPasswordUCProvider);
    final getCurrentUserUC = ref.watch(getCurrentUserUCProvider);
    return AuthContainerNotifier(
      signinAnonmouslyUC: signinAnonmouslyUC,
      signinEmailPasswordUC: signinEmailPasswordUC,
      getCurrentUserUC: getCurrentUserUC,
    );
  },
);

class AuthContainerNotifier extends StateNotifier<AuthState> {
  AuthContainerNotifier({
    required SigninEmailPasswordUC signinEmailPasswordUC,
    required SigninAnonmouslyUC signinAnonmouslyUC,
    required GetCurrentUserUC getCurrentUserUC,
  })  : _signinEmailPasswordUC = signinEmailPasswordUC,
        _signinAnonmouslyUC = signinAnonmouslyUC,
        _getCurrentUserUC = getCurrentUserUC,
        super(AuthState.unauthenticated()) {
    verifyAuthState();
  }

  final SigninEmailPasswordUC _signinEmailPasswordUC;
  final SigninAnonmouslyUC _signinAnonmouslyUC;
  final GetCurrentUserUC _getCurrentUserUC;

  Future<void> verifyAuthState() async {
    final currentUserEither = await _getCurrentUserUC.call(params: NoParams());
    state = await currentUserEither.fold(
      (failure) async {
        return AuthState.failedAuthentication(
          errorTitle: failure.title,
          errorBody: failure.message,
        );
      },
      (user) async {
        if (user.isAnonymous) {
          return AuthState.authenticated(method: AuthMethod.anonmously);
        } else {
          await loginAnonmously();
          return AuthState.authenticated(method: AuthMethod.anonmously);
        }
      },
    );
  }

  Future<void> loginEmailPassword({
    required String email,
    required String password,
  }) async {
    state = AuthState.authenticating();
    final loginAttemptEither = await _signinEmailPasswordUC(
      params: SigninEmailPasswordParams(
        email: email,
        password: password,
      ),
    );

    state = loginAttemptEither.fold(
      (failure) => AuthState.failedAuthentication(
        errorTitle: failure.title,
        errorBody: failure.message,
      ),
      (success) => AuthState.authenticated(method: AuthMethod.emailPassword),
    );
  }

  Future<void> loginAnonmously() async {
    state = AuthState.authenticating();

    final loginAttemptEither = await _signinAnonmouslyUC(
      params: NoParams(),
    );
    state = loginAttemptEither.fold(
      (failure) => AuthState.failedAuthentication(
        errorTitle: failure.title,
        errorBody: failure.message,
      ),
      (success) => AuthState.authenticated(method: AuthMethod.anonmously),
    );
  }

  void validateCurrentFormAndLoginEmailPassword(
    GlobalKey<FormBuilderState> formKey,
  ) {
    final formSaveResult = formKey.currentState?.saveAndValidate();

    if (formSaveResult != null && formSaveResult) {
      final email = formKey.currentState!.value['emailField'];
      final password = formKey.currentState!.value['passwordField'];
      loginEmailPassword(
        email: email,
        password: password,
      );
    }
  }
}
