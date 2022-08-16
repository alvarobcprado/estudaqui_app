import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_drawer_state.freezed.dart';

@freezed
class MyDrawerState with _$MyDrawerState {
  factory MyDrawerState.unauthenticated() = _Unauthenticated;

  factory MyDrawerState.logged({
    String? email,
    String? username,
    String? userPhotoUrl,
  }) = _Logged;
}
