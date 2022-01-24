import 'package:equatable/equatable.dart';

class CourseModule extends Equatable {
  const CourseModule({
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

  @override
  List<Object?> get props => [
        index,
        moduleId,
        courseId,
        name,
        text,
      ];
}
