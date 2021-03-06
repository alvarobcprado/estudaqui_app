import 'package:estudaqui/app/data/remote/model/course/course_module_rm.dart';
import 'package:estudaqui/app/data/remote/model/course/course_rm.dart';
import 'package:estudaqui/app/data/remote/model/subject/subject_rm.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/entity/course_module.dart';
import 'package:estudaqui/app/domain/entity/subject.dart';

extension CourseDMToRM on Course {
  CourseRM toRM() {
    return CourseRM(
      courseId: courseId,
      creatorId: creatorId,
      creatorName: creatorName,
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
    String? creatorName,
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
      creatorName: creatorName ?? this.creatorName,
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

extension SubjectDMToRM on Subject {
  SubjectRM toRM() {
    return SubjectRM(
      subjectId: subjectId,
      bannerUrl: bannerUrl,
      description: description,
      name: name,
      isActive: isActive,
    );
  }

  SubjectRM copyWith({
    String? bannerUrl,
    String? description,
    String? name,
    bool? isActive,
    String? subjectId,
  }) {
    return SubjectRM(
      subjectId: subjectId ?? this.subjectId,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      description: description ?? this.description,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
    );
  }
}
