import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_course_form_model.freezed.dart';
part 'add_course_form_model.g.dart';

@freezed
class AddCourseFormModel with _$AddCourseFormModel {
  factory AddCourseFormModel({
    required String courseName,
    required String courseDescription,
    @Default('') String courseImage,
    required String courseSubject,
    required String courseContent,
  }) = _AddCourseFormModel;

  factory AddCourseFormModel.fromJson(Map<String, dynamic> json) =>
      _$AddCourseFormModelFromJson(json);
}
