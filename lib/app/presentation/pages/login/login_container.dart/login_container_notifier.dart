import 'package:faeng_courses/app/domain/use_case/get_current_user_uc.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:faeng_courses/app/domain/use_case/signin_anonmously_uc.dart';
import 'package:faeng_courses/app/domain/use_case/signin_email_password_uc.dart';

import 'login_container_models.dart';

class LoginContainerNotifier extends StateNotifier<LoginState> {
  LoginContainerNotifier({
    required SigninEmailPasswordUC signinEmailPasswordUC,
    required SigninAnonmouslyUC signinAnonmouslyUC,
    required GetCurrentUserUC getCurrentUserUC,
  })  : _signinEmailPasswordUC = signinEmailPasswordUC,
        _signinAnonmouslyUC = signinAnonmouslyUC,
        _getCurrentUserUC = getCurrentUserUC,
        super(Loading()) {
    verifyLoginState();
  }

  final SigninEmailPasswordUC _signinEmailPasswordUC;
  final SigninAnonmouslyUC _signinAnonmouslyUC;
  final GetCurrentUserUC _getCurrentUserUC;

  Future<void> verifyLoginState() async {
    state = Loading();
    final currentUserEither = await _getCurrentUserUC.call(params: NoParams());
    state = await currentUserEither.fold(
      (failure) async {
        return Error(error: failure);
      },
      (user) async {
        if (user.isAnonymous) {
          return Success(isUserAuthenticated: false);
        } else {
          await loginAnonmously();
          return Success(isUserAuthenticated: false);
        }
      },
    );
  }

  Future<void> loginEmailPassword({
    required String email,
    required String password,
  }) async {
    state = Loading();
    final loginAttemptEither = await _signinEmailPasswordUC(
      params: SigninEmailPasswordParams(
        email: email,
        password: password,
      ),
    );

    state = loginAttemptEither.fold(
      (l) => Error(error: l),
      (r) => Success(isUserAuthenticated: true),
    );
  }

  Future<void> loginAnonmously() async {
    state = Loading();
    final loginAttemptEither = await _signinAnonmouslyUC(
      params: NoParams(),
    );
    state = loginAttemptEither.fold(
      (l) => Error(error: l),
      (r) => Success(isUserAuthenticated: false),
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

final loginContainerNotifierProvider =
    StateNotifierProvider<LoginContainerNotifier, LoginState>(
  (ref) {
    final signinAnonmouslyUC = ref.watch(signinAnonmouslyUCProvider);
    final signinEmailPasswordUC = ref.watch(signinEmailPasswordUCProvider);
    final getCurrentUserUC = ref.watch(getCurrentUserUCProvider);
    return LoginContainerNotifier(
      signinAnonmouslyUC: signinAnonmouslyUC,
      signinEmailPasswordUC: signinEmailPasswordUC,
      getCurrentUserUC: getCurrentUserUC,
    );
  },
);
