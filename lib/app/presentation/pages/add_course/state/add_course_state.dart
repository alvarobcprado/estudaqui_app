import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_course_state.freezed.dart';

@freezed
class AddCourseState with _$AddCourseState {
  const factory AddCourseState.initial() = _Initial;
  const factory AddCourseState.loading() = _Loading;
  const factory AddCourseState.error({
    String? errorTitle,
    String? errorBody,
  }) = _Error;
  const factory AddCourseState.success() = _Success;
}
