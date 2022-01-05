import 'package:equatable/equatable.dart';

abstract class HomeDrawerState extends Equatable {}

class LoggedUser extends HomeDrawerState {
  LoggedUser({
    required this.email,
    this.username,
  });
  final String email;
  final String? username;

  @override
  List<Object?> get props => [email, username];
}

class AnonmouslyUser extends HomeDrawerState {
  @override
  List<Object?> get props => [];
}

class UnauthenticatedUser extends HomeDrawerState {
  @override
  List<Object?> get props => [];
}
