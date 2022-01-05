import 'package:equatable/equatable.dart';

abstract class MyDrawerState extends Equatable {}

class LoggedUser extends MyDrawerState {
  LoggedUser({
    required this.email,
    this.username,
  });
  final String email;
  final String? username;

  @override
  List<Object?> get props => [email, username];
}

class AnonmouslyUser extends MyDrawerState {
  @override
  List<Object?> get props => [];
}

class UnauthenticatedUser extends MyDrawerState {
  @override
  List<Object?> get props => [];
}
