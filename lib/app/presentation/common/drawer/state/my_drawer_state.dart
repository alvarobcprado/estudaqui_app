import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_drawer_state.freezed.dart';

@freezed
class MyDrawerState with _$MyDrawerState {
  factory MyDrawerState.unauthenticated() = _Unauthenticated;

  factory MyDrawerState.logged({
    required String email,
    String? username,
  }) = _Logged;
}
