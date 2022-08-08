import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

enum AuthMethod { emailPassword, anonmously, socialProvider }

@freezed
class AuthState with _$AuthState {
  factory AuthState.authenticated({required AuthMethod method}) = Authenticated;
  factory AuthState.unauthenticated() = Unauthenticated;
  factory AuthState.authenticating() = Authenticating;
  factory AuthState.failedAuthentication(
      {String? errorTitle, String? errorBody}) = FailedAuthentication;
}
