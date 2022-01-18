import 'package:faeng_courses/app/data/remote/model/course_module_rm.dart';
import 'package:faeng_courses/app/data/remote/model/course_rm.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';

extension CourseRMToDM on CourseRM {
  Course toDM() {
    return Course(
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
}

extension CourseModuleRMToDM on CourseModuleRM {
  CourseModule toDM() {
    return CourseModule(
      index: index,
      moduleId: moduleId,
      name: name,
      text: text,
    );
  }
}

extension CourseModuleRMListToDMList on List<CourseModuleRM> {
  List<CourseModule> toDMList() {
    return map((courseModule) => courseModule.toDM()).toList();
  }
}
