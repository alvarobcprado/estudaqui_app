import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faeng_courses/app/data/mapper/domain_to_remote.dart';
import 'package:faeng_courses/app/data/mapper/remote_to_domain.dart';
import 'package:faeng_courses/app/data/remote/model/subject/subject_rm.dart';
import 'package:faeng_courses/app/domain/entity/subject.dart';

class SubjectsRDS {
  SubjectsRDS({
    required FirebaseFirestore db,
  }) : _db = db;

  final FirebaseFirestore _db;
  CollectionReference get _coursesReference => _db.collection('subject');

  CollectionReference<Subject> getSubjectsReference() {
    return _coursesReference.withConverter<Subject>(
      fromFirestore: (snapshot, options) => SubjectRM.fromJson(
        snapshot.data()!,
      ).toDM(),
      toFirestore: (value, options) => value.toRM().toJson(),
    );
  }
}
