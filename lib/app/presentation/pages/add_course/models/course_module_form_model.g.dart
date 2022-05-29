// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_module_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseModuleFormModel _$$_CourseModuleFormModelFromJson(
        Map<String, dynamic> json) =>
    _$_CourseModuleFormModel(
      index: json['index'] as int? ?? 0,
      moduleId: json['moduleId'] as String? ?? '',
      courseId: json['courseId'] as String? ?? '',
      moduleName: json['moduleName'] as String? ?? 'Módulo 1',
      courseContent: json['courseContent'] as String,
    );

Map<String, dynamic> _$$_CourseModuleFormModelToJson(
        _$_CourseModuleFormModel instance) =>
    <String, dynamic>{
      'index': instance.index,
      'moduleId': instance.moduleId,
      'courseId': instance.courseId,
      'moduleName': instance.moduleName,
      'courseContent': instance.courseContent,
    };
