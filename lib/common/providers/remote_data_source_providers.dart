import 'package:faeng_courses/app/data/remote/data_source/courses_rds.dart';
import 'package:faeng_courses/app/data/remote/data_source/subjects_rds.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coursesRDSProvider = Provider<CoursesRDS>(
  (ref) {
    final database = ref.watch(firebaseFirestoreProvider);
    return CoursesRDS(db: database);
  },
);

final subjectsRDSProvider = Provider<SubjectsRDS>(
  (ref) {
    final database = ref.watch(firebaseFirestoreProvider);
    return SubjectsRDS(db: database);
  },
);
