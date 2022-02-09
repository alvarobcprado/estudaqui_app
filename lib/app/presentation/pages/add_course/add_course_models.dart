import 'package:equatable/equatable.dart';

import 'package:faeng_courses/core/error/failures.dart';

enum AddCourseStatus { loading, error, success }

class AddCourseState extends Equatable {
  const AddCourseState({
    required this.status,
    this.failure,
  });

  final AddCourseStatus status;
  final Failure? failure;

  @override
  List<Object?> get props => [status, failure];

  AddCourseState copyWith({
    AddCourseStatus? status,
    Failure? failure,
  }) {
    return AddCourseState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
