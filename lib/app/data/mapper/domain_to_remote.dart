import 'package:faeng_courses/app/data/remote/model/course/course_module_rm.dart';
import 'package:faeng_courses/app/data/remote/model/course/course_rm.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';

extension CourseDMToRM on Course {
  CourseRM toRM() {
    return CourseRM(
      courseId: courseId,
      creatorId: creatorId,
      subject: subject,
      title: title,
      subtitle: subtitle,
      createdAt: createdAt,
      projectId: projectId,
      bannerUrl: bannerUrl,
      updatedAt: updatedAt,
    );
  }

  Course copyWith({
    String? courseId,
    String? creatorId,
    String? subject,
    String? title,
    String? subtitle,
    DateTime? createdAt,
    String? projectId,
    String? bannerUrl,
    DateTime? updatedAt,
  }) {
    return Course(
      courseId: courseId ?? this.courseId,
      creatorId: creatorId ?? this.creatorId,
      subject: subject ?? this.subject,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      createdAt: createdAt ?? this.createdAt,
      projectId: projectId ?? this.projectId,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

extension CourseModuleDMToRM on CourseModule {
  CourseModuleRM toRM() {
    return CourseModuleRM(
      index: index,
      moduleId: moduleId,
      courseId: courseId,
      name: name,
      text: text,
    );
  }

  CourseModule copyWith({
    int? index,
    String? moduleId,
    String? courseId,
    String? name,
    String? text,
  }) {
    return CourseModule(
      index: index ?? this.index,
      moduleId: moduleId ?? this.moduleId,
      courseId: courseId ?? this.courseId,
      name: name ?? this.name,
      text: text ?? this.text,
    );
  }
}
