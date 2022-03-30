import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/entity/subject.dart';
import 'package:faeng_courses/app/domain/use_case/courses/get_latest_courses_uc.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:faeng_courses/common/providers/use_case/subject_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getLastCoursesProvider = FutureProvider<List<Course>>(
  (ref) async {
    final useCase = ref.watch(getLatestCoursesUCProvider);
    final eitherResult = await useCase(
      params: GetLatestCoursesParam(coursesNumber: 5),
    );

    return eitherResult.fold((failure) => [], (courseList) => courseList);
  },
);

final getSubjectsProvider = FutureProvider<List<Subject>>(
  (ref) async {
    final useCase = ref.watch(getSubjectsUCProvider);
    final eitherResult = await useCase(params: NoParams());

    return eitherResult.fold(
        (failure) => throw Exception(), (subjectList) => subjectList);
  },
);

final getUserNameProvider = FutureProvider<String>(
  (ref) async {
    final useCase = ref.watch(getCurrentUserUCProvider);
    const anonmouslyUser = '';
    final eitherResult = await useCase(params: NoParams());

    final userName = eitherResult.fold(
      (failure) => '',
      (user) {
        if (user.isAnonymous) {
          return anonmouslyUser;
        }
        return user.displayName?.split(' ')[0] ?? anonmouslyUser;
      },
    );

    return userName;
  },
);
