import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

enum LoginMethod { emailPassword, anonmously }

@freezed
class LoginState with _$LoginState {
  factory LoginState.authenticated({required LoginMethod method}) =
      Authenticated;
  factory LoginState.unauthenticated() = Unauthenticated;
  factory LoginState.authenticating() = Authenticating;
  factory LoginState.failedAuthentication(
      {String? errorTitle, String? errorBody}) = FailedAuthentication;
}
