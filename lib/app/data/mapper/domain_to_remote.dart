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
}
