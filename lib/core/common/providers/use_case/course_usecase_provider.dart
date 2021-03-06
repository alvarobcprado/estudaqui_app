import 'package:estudaqui/app/domain/use_case/courses/add_course_and_module_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/add_course_module_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/add_course_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/get_course_by_id_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/get_course_module_by_id_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/get_course_modules_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/get_courses_by_author_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/get_courses_by_subject_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/get_courses_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/get_latest_courses_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/remove_course_module_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/remove_course_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/update_course_module_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/update_course_uc.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addCourseUCProvider = Provider<AddCourseUC>(
  (ref) {
    final coursesRepository = ref.watch(coursesRepositoryProvider);
    return AddCourseUC(coursesRepository: coursesRepository);
  },
);

final addCourseModuleUCProvider = Provider<AddCourseModuleUC>(
  (ref) {
    final coursesRepository = ref.watch(coursesRepositoryProvider);
    return AddCourseModuleUC(coursesRepository: coursesRepository);
  },
);

final getCoursesUCProvider = Provider<GetCoursesUC>(
  (ref) {
    final coursesRepository = ref.watch(coursesRepositoryProvider);
    return GetCoursesUC(coursesRepository: coursesRepository);
  },
);

final getCourseModulesUCProvider = Provider<GetCourseModulesUC>(
  (ref) {
    final coursesRepository = ref.watch(coursesRepositoryProvider);
    return GetCourseModulesUC(coursesRepository: coursesRepository);
  },
);

final getCourseByIdUCProvider = Provider<GetCourseByIdUC>(
  (ref) {
    final coursesRepository = ref.watch(coursesRepositoryProvider);
    return GetCourseByIdUC(coursesRepository: coursesRepository);
  },
);

final getCourseModuleByIdUCProvider = Provider<GetCourseModuleByIdUC>(
  (ref) {
    final coursesRepository = ref.watch(coursesRepositoryProvider);
    return GetCourseModuleByIdUC(coursesRepository: coursesRepository);
  },
);

final addCourseAndModuleUCProvider = Provider<AddCourseAndModuleUC>(
  (ref) {
    final coursesRepository = ref.watch(coursesRepositoryProvider);
    return AddCourseAndModuleUC(coursesDataRepository: coursesRepository);
  },
);

final getLatestCoursesUCProvider = Provider<GetLatestCoursesUC>(
  (ref) {
    final coursesRepository = ref.watch(coursesRepositoryProvider);
    return GetLatestCoursesUC(coursesRepository: coursesRepository);
  },
);

final getCoursesBySubjectProvider = Provider<GetCoursesBySubjectUC>(
  (ref) {
    final coursesRepository = ref.watch(coursesRepositoryProvider);
    return GetCoursesBySubjectUC(coursesDataRepository: coursesRepository);
  },
);

final getCoursesByAuthorProvider = Provider<GetCoursesByAuthorUC>(
  (ref) {
    final coursesRepository = ref.watch(coursesRepositoryProvider);
    return GetCoursesByAuthorUC(coursesDataRepository: coursesRepository);
  },
);

final removeCourseUCProvider = Provider<RemoveCourseUC>(
  (ref) {
    final repository = ref.watch(coursesRepositoryProvider);
    return RemoveCourseUC(repository: repository);
  },
);

final removeCourseModuleUCProvider = Provider<RemoveCourseModuleUC>(
  (ref) {
    final repository = ref.watch(coursesRepositoryProvider);
    return RemoveCourseModuleUC(repository: repository);
  },
);

final updateCourseUCProvider = Provider<UpdateCourseUC>(
  (ref) {
    final repository = ref.watch(coursesRepositoryProvider);
    return UpdateCourseUC(repository: repository);
  },
);

final updateCourseModuleUCProvider = Provider<UpdateCourseModuleUC>(
  (ref) {
    final repository = ref.watch(coursesRepositoryProvider);
    return UpdateCourseModuleUC(repository: repository);
  },
);
