import 'package:estudaqui/app/domain/use_case/authentication/signout_uc.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/app/presentation/common/drawer/state/my_drawer_state.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myDrawerNotifierProvider =
    StateNotifierProvider<MyDrawerNotifier, MyDrawerState>(
  (ref) {
    final signoutUC = ref.watch(signoutUCProvider);

    return MyDrawerNotifier(
      signoutUC: signoutUC,
      ref: ref,
    );
  },
);

final userAuthChangesProvider = StreamProvider<User?>(
  (ref) async* {
    final useCase = ref.watch(getUserChangesUCProvider);

    final eitherResult = await useCase(params: NoParams());

    yield* eitherResult.fold(
      (l) async* {
        yield null;
      },
      (stream) async* {
        await for (final user in stream) {
          yield user;
        }
      },
    );
  },
);

class MyDrawerNotifier extends StateNotifier<MyDrawerState> {
  MyDrawerNotifier({
    required SignOutUC signoutUC,
    required Ref ref,
  })  : _signOutUC = signoutUC,
        _ref = ref,
        super(MyDrawerState.unauthenticated()) {
    _ref.watch(userAuthChangesProvider).whenData(
          (user) => _updateDrawerUserState(user),
        );
  }

  final Ref _ref;
  final SignOutUC _signOutUC;

  Future<void> signoutCurrentUser() async {
    await _signOutUC(params: NoParams());
  }

  Future<void> _updateDrawerUserState(User? user) async {
    final isUserAuth = _isUserAuth(user);
    state = isUserAuth
        ? MyDrawerState.logged(
            email: user?.email,
            username: user?.displayName,
            userPhotoUrl: user?.photoURL,
          )
        : MyDrawerState.unauthenticated();
  }

  bool _isUserAuth(User? user) {
    if (user == null) {
      return false;
    }
    return !user.isAnonymous &&
        (user.email != null || user.displayName != null);
  }
}
