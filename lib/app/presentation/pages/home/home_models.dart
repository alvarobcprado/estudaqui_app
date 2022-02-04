import 'package:equatable/equatable.dart';

import 'package:faeng_courses/app/domain/entity/subject.dart';
import 'package:faeng_courses/core/error/failures.dart';

enum HomeStatus { loading, success, error }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.loading,
    this.subjectList = const <Subject>[],
    this.failure,
  });

  final HomeStatus status;
  final List<Subject> subjectList;
  final Failure? failure;

  HomeState copyWith({
    HomeStatus? status,
    List<Subject>? subjectList,
    Failure? failure,
  }) {
    return HomeState(
      status: status ?? this.status,
      subjectList: subjectList ?? this.subjectList,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [status, subjectList, failure];
}
