import 'package:equatable/equatable.dart';
import 'package:faeng_courses/core/error/failures.dart';

abstract class LoginState extends Equatable {}

class Loading extends LoginState {
  @override
  List<Object?> get props => [];
}

class Error extends LoginState {
  Error({
    required this.error,
  });

  final Failure error;

  @override
  List<Object?> get props => [error];
}

class Success extends LoginState {
  Success({required this.isUserAuthenticated});

  final bool isUserAuthenticated;

  @override
  List<Object?> get props => [isUserAuthenticated];
}
