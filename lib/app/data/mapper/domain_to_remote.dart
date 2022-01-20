import 'package:faeng_courses/app/data/remote/model/course_module_rm.dart';
import 'package:faeng_courses/app/data/remote/model/course_rm.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';

extension CourseDMToRM on Course {
  CourseRM toRM() {
    return CourseRM(
      courseId: courseId,
      creatorId: creatorId,
      subject: subject,
      title: title,
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
      name: name,
      text: text,
    );
  }

  CourseModule copyWith({
    int? index,
    String? moduleId,
    String? name,
    String? text,
  }) {
    return CourseModule(
      index: index ?? this.index,
      moduleId: moduleId ?? this.moduleId,
      name: name ?? this.name,
      text: text ?? this.text,
    );
  }
}
