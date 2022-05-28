import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/entity/course_module.dart';
import 'package:estudaqui/app/presentation/pages/add_course/models/course_form_model.dart';
import 'package:estudaqui/app/presentation/pages/add_course/models/course_module_form_model.dart';

extension CourseToCourseFormModel on Course {
  CourseFormModel toCourseFormModel() {
    return CourseFormModel(
      courseId: courseId,
      creatorId: creatorId,
      creatorName: creatorName,
      courseSubject: subject,
      courseName: title,
      courseDescription: subtitle,
      createdAt: createdAt,
      projectId: projectId,
      courseImage: bannerUrl,
      updatedAt: updatedAt,
    );
  }
}

extension CourseModuleToCourseModuleFormModel on CourseModule {
  toCourseModuleForm() {
    return CourseModuleFormModel(
      index: index,
      moduleId: moduleId,
      courseId: courseId,
      moduleName: name,
      courseContent: text,
    );
  }
}
