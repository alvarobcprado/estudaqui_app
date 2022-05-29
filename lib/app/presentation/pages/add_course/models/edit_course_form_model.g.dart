// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_course_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EditCourseFormModel _$$_EditCourseFormModelFromJson(
        Map<String, dynamic> json) =>
    _$_EditCourseFormModel(
      courseToAdd:
          CourseFormModel.fromJson(json['courseToAdd'] as Map<String, dynamic>),
      courseModuleToAdd: CourseModuleFormModel.fromJson(
          json['courseModuleToAdd'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EditCourseFormModelToJson(
        _$_EditCourseFormModel instance) =>
    <String, dynamic>{
      'courseToAdd': instance.courseToAdd,
      'courseModuleToAdd': instance.courseModuleToAdd,
    };
