import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_module_form_model.freezed.dart';
part 'course_module_form_model.g.dart';

@freezed
class CourseModuleFormModel with _$CourseModuleFormModel {
  factory CourseModuleFormModel({
    @Default(0) int index,
    @Default('') String moduleId,
    @Default('') String courseId,
    @Default('Módulo 1') String moduleName,
    required String courseContent,
  }) = _CourseModuleFormModel;

  factory CourseModuleFormModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModuleFormModelFromJson(json);
}
