import 'package:estudaqui/app/data/repository/auth_imp_repository.dart';
import 'package:estudaqui/app/data/repository/courses_imp_repository.dart';
import 'package:estudaqui/app/data/repository/subjects_imp_repository.dart';
import 'package:estudaqui/app/domain/data_repository/courses_data_repository.dart';
import 'package:estudaqui/app/domain/data_repository/subjects_data_repository.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthImpRepository>(
  (ref) {
    final authProvider = ref.watch<FirebaseAuth>(
      firebaseAuthProvider,
    );

    return AuthImpRepository(
      authProvider: authProvider,
    );
  },
);

final coursesRepositoryProvider = Provider<CoursesDataRepository>(
  (ref) {
    final coursesRDS = ref.watch(coursesRDSProvider);
    return CoursesImpRepository(coursesRDS: coursesRDS);
  },
);

final subjectsRepositoryProvider = Provider<SubjectDataRepository>(
  (ref) {
    final subjectsRDS = ref.watch(subjectsRDSProvider);
    return SubjectImpRepository(subjectsRDS: subjectsRDS);
  },
);
