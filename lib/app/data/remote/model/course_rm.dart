import 'package:faeng_courses/app/data/remote/model/course_module_rm.dart';
import 'package:flutter/foundation.dart';

import 'package:json_annotation/json_annotation.dart';

part 'course_rm.g.dart';

@JsonSerializable()
class CourseRM {
  CourseRM({
    required this.courseId,
    required this.creatorId,
    required this.subject,
    required this.title,
    required this.createdAt,
    required this.projectId,
    required this.bannerUrl,
    required this.updatedAt,
  });

  final String courseId;
  final String creatorId;
  final String subject;
  final String title;
  final DateTime createdAt;
  final String projectId;
  final String bannerUrl;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => _$CourseRMToJson(this);

  static const fromJson = _$CourseRMFromJson;
}
