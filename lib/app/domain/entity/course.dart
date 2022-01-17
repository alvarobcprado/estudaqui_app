import 'package:faeng_courses/app/domain/entity/course_module.dart';

class Course {
  Course({
    required this.courseId,
    required this.creatorId,
    required this.subject,
    required this.title,
    required this.createdAt,
    required this.projectId,
    required this.bannerUrl,
    required this.updatedAt,
    required this.modules,
  });

  final String courseId;
  final String creatorId;
  final String subject;
  final String title;
  final DateTime createdAt;
  final String projectId;
  final String bannerUrl;
  final DateTime updatedAt;
  final List<CourseModule> modules;
}
