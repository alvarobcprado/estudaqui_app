import 'package:json_annotation/json_annotation.dart';

part 'course_module_rm.g.dart';

@JsonSerializable()
class CourseModuleRM {
  CourseModuleRM({
    required this.index,
    required this.moduleId,
    required this.courseId,
    required this.name,
    required this.text,
  });

  final int index;
  final String moduleId;
  final String courseId;
  final String name;
  final String text;

  Map<String, dynamic> toJson() => _$CourseModuleRMToJson(this);

  static const fromJson = _$CourseModuleRMFromJson;
}
