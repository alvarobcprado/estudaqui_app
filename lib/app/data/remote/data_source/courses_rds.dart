import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estudaqui/app/data/mapper/domain_to_remote.dart';
import 'package:estudaqui/app/data/mapper/remote_to_domain.dart';
import 'package:estudaqui/app/data/remote/model/course/course_module_rm.dart';
import 'package:estudaqui/app/data/remote/model/course/course_rm.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/entity/course_module.dart';

class CoursesRDS {
  const CoursesRDS({required FirebaseFirestore db}) : _db = db;

  final FirebaseFirestore _db;
  CollectionReference get _coursesReference => _db.collection('courses');

  CollectionReference<Course> getCoursesReference() {
    return _coursesReference.withConverter<Course>(
      fromFirestore: (snapshot, options) => CourseRM.fromJson(
        snapshot.data()!,
      ).toDM(),
      toFirestore: (value, options) => value.toRM().toJson(),
    );
  }

  CollectionReference<CourseModule> getCourseModulesReference(String courseId) {
    return _coursesReference
        .doc(courseId)
        .collection('module')
        .withConverter<CourseModule>(
          fromFirestore: (snapshot, options) =>
              CourseModuleRM.fromJson(snapshot.data()!).toDM(),
          toFirestore: (value, options) => value.toRM().toJson(),
        );
  }
}
