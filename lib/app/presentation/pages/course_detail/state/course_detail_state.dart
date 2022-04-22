import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_detail_state.freezed.dart';

@freezed
class CourseDetailState with _$CourseDetailState {
  factory CourseDetailState.loading() = _Loading;
  factory CourseDetailState.failed({
    String? errorTitle,
    String? errorBody,
  }) = _Failed;
  factory CourseDetailState.success({
    required Course course,
    required CourseModule courseContent,
  }) = _Success;
}
