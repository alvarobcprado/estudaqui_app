// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseFormModel _$$_CourseFormModelFromJson(Map<String, dynamic> json) =>
    _$_CourseFormModel(
      courseName: json['courseName'] as String,
      courseDescription: json['courseDescription'] as String,
      courseSubject: json['courseSubject'] as String,
      courseId: json['courseId'] as String? ?? '',
      courseImage: json['courseImage'] as String? ?? '',
      projectId: json['projectId'] as String? ?? '',
      creatorId: json['creatorId'] as String? ?? '',
      creatorName: json['creatorName'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_CourseFormModelToJson(_$_CourseFormModel instance) =>
    <String, dynamic>{
      'courseName': instance.courseName,
      'courseDescription': instance.courseDescription,
      'courseSubject': instance.courseSubject,
      'courseId': instance.courseId,
      'courseImage': instance.courseImage,
      'projectId': instance.projectId,
      'creatorId': instance.creatorId,
      'creatorName': instance.creatorName,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
