import 'package:equatable/equatable.dart';

class Course extends Equatable {
  const Course({
    required this.courseId,
    required this.creatorId,
    required this.creatorName,
    required this.subject,
    required this.title,
    required this.subtitle,
    required this.createdAt,
    required this.projectId,
    required this.bannerUrl,
    required this.updatedAt,
  });

  final String courseId;
  final String creatorId;
  final String creatorName;
  final String subject;
  final String title;
  final String subtitle;
  final DateTime createdAt;
  final String projectId;
  final String bannerUrl;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        courseId,
        creatorId,
        creatorName,
        subject,
        title,
        subtitle,
        createdAt,
        projectId,
        bannerUrl,
        updatedAt,
      ];
}
