import 'package:equatable/equatable.dart';

import 'package:faeng_courses/app/domain/entity/subject.dart';
import 'package:faeng_courses/core/error/failure.dart';

enum SubjectListStatus { loading, success, error }

class SubjectListState extends Equatable {
  const SubjectListState({
    this.status = SubjectListStatus.loading,
    this.subjectList = const <Subject>[],
    this.failure,
  });

  final SubjectListStatus status;
  final List<Subject> subjectList;
  final Failure? failure;

  SubjectListState copyWith({
    SubjectListStatus? status,
    List<Subject>? subjectList,
    Failure? failure,
  }) {
    return SubjectListState(
      status: status ?? this.status,
      subjectList: subjectList ?? this.subjectList,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [status, subjectList, failure];
}
