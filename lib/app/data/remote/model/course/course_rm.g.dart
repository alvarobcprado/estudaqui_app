// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseRM _$CourseRMFromJson(Map<String, dynamic> json) => CourseRM(
      courseId: json['courseId'] as String,
      creatorId: json['creatorId'] as String,
      subject: json['subject'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      createdAt: dateTimeFromTimeStamp(json['createdAt'] as Timestamp),
      projectId: json['projectId'] as String,
      bannerUrl: json['bannerUrl'] as String,
      updatedAt: dateTimeFromTimeStamp(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$CourseRMToJson(CourseRM instance) => <String, dynamic>{
      'courseId': instance.courseId,
      'creatorId': instance.creatorId,
      'subject': instance.subject,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'createdAt': instance.createdAt.toIso8601String(),
      'projectId': instance.projectId,
      'bannerUrl': instance.bannerUrl,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
