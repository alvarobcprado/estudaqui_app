// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectRM _$SubjectRMFromJson(Map<String, dynamic> json) => SubjectRM(
      bannerUrl: json['bannerUrl'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      isActive: json['isActive'] as bool,
      subjectId: json['subjectId'] as String,
    );

Map<String, dynamic> _$SubjectRMToJson(SubjectRM instance) => <String, dynamic>{
      'bannerUrl': instance.bannerUrl,
      'subjectId': instance.subjectId,
      'description': instance.description,
      'name': instance.name,
      'isActive': instance.isActive,
    };
