// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseRM _$CourseRMFromJson(Map<String, dynamic> json) => CourseRM(
      courseId: json['courseId'] as String,
      creatorId: json['creatorId'] as String,
      creatorName: json['creatorName'] as String,
      subject: json['subject'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      createdAt: dateTimeFromTimestamp(json['createdAt'] as Timestamp),
      projectId: json['projectId'] as String,
      bannerUrl: json['bannerUrl'] as String,
      updatedAt: dateTimeFromTimestamp(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$CourseRMToJson(CourseRM instance) => <String, dynamic>{
      'courseId': instance.courseId,
      'creatorId': instance.creatorId,
      'creatorName': instance.creatorName,
      'subject': instance.subject,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'createdAt': dateTimeToTimestamp(instance.createdAt),
      'projectId': instance.projectId,
      'bannerUrl': instance.bannerUrl,
      'updatedAt': dateTimeToTimestamp(instance.updatedAt),
    };
