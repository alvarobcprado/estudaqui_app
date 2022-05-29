import 'package:estudaqui/app/presentation/pages/add_course/models/course_form_model.dart';
import 'package:estudaqui/app/presentation/pages/add_course/models/course_module_form_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_course_form_model.freezed.dart';
part 'edit_course_form_model.g.dart';

@freezed
class EditCourseFormModel with _$EditCourseFormModel {
  factory EditCourseFormModel({
    required CourseFormModel courseToAdd,
    required CourseModuleFormModel courseModuleToAdd,
  }) = _EditCourseFormModel;

  factory EditCourseFormModel.fromJson(Map<String, dynamic> json) =>
      _$EditCourseFormModelFromJson(json);
}
