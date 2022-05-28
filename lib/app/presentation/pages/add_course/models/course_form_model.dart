import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_form_model.freezed.dart';
part 'course_form_model.g.dart';

@freezed
class CourseFormModel with _$CourseFormModel {
  factory CourseFormModel({
    required String courseName,
    required String courseDescription,
    required String courseSubject,
    @Default('') String courseId,
    @Default('') String courseImage,
    @Default('') String projectId,
    @Default('') String creatorId,
    @Default('') String creatorName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CourseFormModel;

  factory CourseFormModel.fromJson(Map<String, dynamic> json) =>
      _$CourseFormModelFromJson(json);
}
