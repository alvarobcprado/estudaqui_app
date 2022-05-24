import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_list_state.freezed.dart';

@freezed
class CourseListState with _$CourseListState {
  factory CourseListState.initial() = Initial;
  factory CourseListState.initialLoading() = InitialLoading;
  factory CourseListState.success({
    required List<Course> courseList,
  }) = Success;
  factory CourseListState.empty() = Empty;
  factory CourseListState.failed({
    String? errorTitle,
    String? errorBody,
  }) = Failed;
}
