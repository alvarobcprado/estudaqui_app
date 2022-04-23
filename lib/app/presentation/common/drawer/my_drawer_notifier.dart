import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/use_case/authentication/get_current_user_uc.dart';
import 'package:faeng_courses/app/domain/use_case/authentication/signout_uc.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/app/presentation/common/drawer/state/my_drawer_state.dart';
import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:faeng_courses/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myDrawerNotifierProvider =
    StateNotifierProvider.autoDispose<MyDrawerNotifier, MyDrawerState>(
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

class MyDrawerNotifier extends StateNotifier<MyDrawerState> {
  MyDrawerNotifier({
    required SignOutUC signoutUC,
    required GetCurrentUserUC getCurrentUserUC,
    required Ref ref,
  })  : _getCurrentUserUC = getCurrentUserUC,
        _signOutUC = signoutUC,
        _ref = ref,
        super(MyDrawerState.unauthenticated()) {
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
    await _signOutUC(params: NoParams());
  }

  Future<void> _updateDrawerUserState() async {
    final eitherUser = await _getCurrentUserUC(params: NoParams());
    state = _eitherLoadedOrError(eitherUser);
  }

  MyDrawerState _eitherLoadedOrError(Either<Failure, User> failureOrUser) {
    return failureOrUser.fold(
      (l) => MyDrawerState.unauthenticated(),
      (user) {
        final isUserAuth = _ref.read(isUserAuthProvider(user));
        if (isUserAuth) {
          return MyDrawerState.logged(
            email: user.email!,
            username: user.displayName,
          );
        } else {
          return MyDrawerState.unauthenticated();
        }
      },
    );
  }
}
