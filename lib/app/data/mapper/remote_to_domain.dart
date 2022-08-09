import 'package:estudaqui/app/data/remote/model/course/course_module_rm.dart';
import 'package:estudaqui/app/data/remote/model/course/course_rm.dart';
import 'package:estudaqui/app/data/remote/model/subject/subject_rm.dart';
import 'package:estudaqui/app/domain/entity/auth/social_auth_data.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/entity/course_module.dart';
import 'package:estudaqui/app/domain/entity/subject.dart';
import 'package:google_sign_in/google_sign_in.dart';

extension CourseRMToDM on CourseRM {
  Course toDM() {
    return Course(
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
}

extension CourseModuleRMToDM on CourseModuleRM {
  CourseModule toDM() {
    return CourseModule(
      index: index,
      moduleId: moduleId,
      courseId: courseId,
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

extension SubjectRMToDM on SubjectRM {
  Subject toDM() {
    return Subject(
      subjectId: subjectId,
      bannerUrl: bannerUrl,
      description: description,
      name: name,
      isActive: isActive,
    );
  }
}

extension SubjectRMListToDMList on List<SubjectRM> {
  List<Subject> toDMList() {
    return map((subjectRM) => subjectRM.toDM()).toList();
  }
}

extension GoogleSignInAccountToDM on GoogleSignInAccount {
  Future<SocialAuthData> toDM() async {
    return SocialAuthData(
      email: email,
      displayName: displayName,
      userId: id,
      tokenId: (await authentication).idToken,
      photoUrl: photoUrl,
      accessToken: (await authentication).accessToken,
      serverAuthCode: serverAuthCode,
    );
  }
}
