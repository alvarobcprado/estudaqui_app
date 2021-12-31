import 'package:equatable/equatable.dart';

enum SignInMethod {
  anonymous,
  emailAndPassword,
}

enum SignUpCode {
  emailAlreadyUsed,
  other,
}

abstract class Failure extends Equatable {}

class CurrentUserFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class SignInUserFailure extends Failure {
  SignInUserFailure({required this.signinMethod});

  final SignInMethod signinMethod;

  @override
  List<Object?> get props => [signinMethod];
}

class SignOutUserFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class SignUpFailure extends Failure {
  SignUpFailure({
    required this.signUpCode,
  });

  final SignUpCode signUpCode;

  @override
  List<Object?> get props => [signUpCode];
}
