import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_rm.g.dart';

@JsonSerializable()
class CourseRM {
  CourseRM({
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
  @JsonKey(fromJson: dateTimeFromTimestamp, toJson: dateTimeToTimestamp)
  final DateTime createdAt;
  final String projectId;
  final String bannerUrl;
  @JsonKey(fromJson: dateTimeFromTimestamp, toJson: dateTimeToTimestamp)
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => _$CourseRMToJson(this);

  static const fromJson = _$CourseRMFromJson;
}

/// Function to temp fix JsonDeserialization of Timestamp
DateTime dateTimeFromTimestamp(Timestamp timestamp) {
  return timestamp.toDate();
}

/// Function to temp fix JsonSerialization of Timestamp
Timestamp dateTimeToTimestamp(DateTime dateTime) {
  return Timestamp.fromDate(dateTime);
}
