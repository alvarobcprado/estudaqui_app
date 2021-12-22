import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class CurrentUserFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class SignInUserFailure extends Failure {
  @override
  List<Object?> get props => [];
}
