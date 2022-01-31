import 'package:equatable/equatable.dart';

import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/core/error/failures.dart';

enum CourseListStatus { initial, loading, success, error }

class CourseListState extends Equatable {
  const CourseListState({
    this.courses = const <Course>[],
    this.status = CourseListStatus.initial,
    this.failure,
  });

  final List<Course> courses;
  final Failure? failure;
  final CourseListStatus status;

  CourseListState copyWith({
    List<Course>? courses,
    Failure? failure,
    CourseListStatus? status,
  }) {
    return CourseListState(
      courses: courses ?? this.courses,
      failure: failure ?? this.failure,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [courses, failure, status];
}
