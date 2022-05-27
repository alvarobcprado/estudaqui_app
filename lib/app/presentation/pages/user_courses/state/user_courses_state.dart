import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_courses_state.freezed.dart';

@freezed
class UserCoursesState with _$UserCoursesState {
  factory UserCoursesState.initial() = Initial;
  factory UserCoursesState.initialLoading() = InitialLoading;
  factory UserCoursesState.success({
    required List<Course> courseList,
  }) = Success;
  factory UserCoursesState.empty() = Empty;
  factory UserCoursesState.failed({
    String? errorTitle,
    String? errorBody,
  }) = Failed;
}
