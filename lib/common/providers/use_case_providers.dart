import 'package:faeng_courses/app/domain/use_case/authentication/get_current_user_uc.dart';
import 'package:faeng_courses/app/domain/use_case/authentication/signin_anonmously_uc.dart';
import 'package:faeng_courses/app/domain/use_case/authentication/signin_email_password_uc.dart';
import 'package:faeng_courses/app/domain/use_case/authentication/signout_uc.dart';
import 'package:faeng_courses/app/domain/use_case/authentication/signup_email_password_uc.dart';
import 'package:faeng_courses/app/domain/use_case/courses/add_course_module_uc.dart';
import 'package:faeng_courses/app/domain/use_case/courses/add_course_uc.dart';
import 'package:faeng_courses/app/domain/use_case/courses/get_course_by_id_uc.dart';
import 'package:faeng_courses/app/domain/use_case/courses/get_course_module_by_id_uc.dart';
import 'package:faeng_courses/app/domain/use_case/courses/get_course_modules_uc.dart';
import 'package:faeng_courses/app/domain/use_case/courses/get_courses_uc.dart';
import 'package:faeng_courses/common/general_providers.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final signinEmailPasswordUCProvider = Provider<SigninEmailPasswordUC>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return SigninEmailPasswordUC(authDataRepository: authRepository);
  },
);

final signinAnonmouslyUCProvider = Provider<SigninAnonmouslyUC>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return SigninAnonmouslyUC(authRepository: authRepository);
  },
);

final signoutUCProvider = Provider<SignOutUC>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return SignOutUC(authDataRepository: authRepository);
  },
);

final getCurrentUserUCProvider = Provider<GetCurrentUserUC>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return GetCurrentUserUC(authRepository: authRepository);
  },
);

final signupEmailPasswordUCProvider = Provider<SignupEmailPasswordUC>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return SignupEmailPasswordUC(authDataRepository: authRepository);
  },
);

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
