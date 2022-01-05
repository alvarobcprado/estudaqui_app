import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/presentation/common/drawer.dart/my_drawer_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:faeng_courses/app/domain/use_case/get_current_user_uc.dart';
import 'package:faeng_courses/app/domain/use_case/signout_uc.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:faeng_courses/core/error/failures.dart';

class MyDrawerNotifier extends StateNotifier<MyDrawerState> {
  MyDrawerNotifier({
    required SignOutUC signoutUC,
    required GetCurrentUserUC getCurrentUserUC,
    required Ref ref,
  })  : _getCurrentUserUC = getCurrentUserUC,
        _signOutUC = signoutUC,
        _ref = ref,
        super(UnauthenticatedUser()) {
    _ref.watch(userAuthChangeProvider).whenData(
      (_) {
        _updateDrawerUserState();
      },
    );
  }

  final Ref _ref;
  final SignOutUC _signOutUC;
  final GetCurrentUserUC _getCurrentUserUC;

  Future<void> signoutCurrentUser() async {
    await _signOutUC.call(params: NoParams());
  }

  Future<void> _updateDrawerUserState() async {
    final eitherUser = await _getCurrentUserUC.call(params: NoParams());
    state = _eitherLoadedOrError(eitherUser);
  }

  MyDrawerState _eitherLoadedOrError(Either<Failure, User> failureOrUser) {
    return failureOrUser.fold(
      (l) => UnauthenticatedUser(),
      (user) {
        final isUserAuth = _ref.read(isUserAuthProvider(user));
        if (isUserAuth) {
          return LoggedUser(email: user.email!, username: user.displayName);
        } else {
          return AnonmouslyUser();
        }
      },
    );
  }
}

final myDrawerNotifierProvider =
    StateNotifierProvider<MyDrawerNotifier, MyDrawerState>(
  (ref) {
    final signoutUC = ref.watch(signoutUCProvider);
    final getCurrentUserUC = ref.watch(getCurrentUserUCProvider);
    return MyDrawerNotifier(
      getCurrentUserUC: getCurrentUserUC,
      signoutUC: signoutUC,
      ref: ref,
    );
  },
);
