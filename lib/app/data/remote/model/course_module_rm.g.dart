// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_module_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModuleRM _$CourseModuleRMFromJson(Map<String, dynamic> json) =>
    CourseModuleRM(
      index: json['index'] as int,
      moduleId: json['moduleId'] as String,
      name: json['name'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$CourseModuleRMToJson(CourseModuleRM instance) =>
    <String, dynamic>{
      'index': instance.index,
      'moduleId': instance.moduleId,
      'name': instance.name,
      'text': instance.text,
    };
