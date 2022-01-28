import 'package:faeng_courses/core/error/failures.dart';

abstract class SubjectFailure extends Failure {}

class SubjectListFailure extends SubjectFailure {
  @override
  List<Object?> get props => [];
}

class SubjectByIdFailure extends SubjectFailure {
  @override
  List<Object?> get props => [];
}
