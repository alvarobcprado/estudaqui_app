import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/entity/subject.dart';
import 'package:faeng_courses/app/domain/use_case/courses/get_latest_courses_uc.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:faeng_courses/core/common/providers/use_case/subject_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getLastCoursesProvider = FutureProvider.autoDispose<List<Course>>(
  (ref) async {
    final useCase = ref.watch(getLatestCoursesUCProvider);
    final eitherResult = await useCase(
      params: GetLatestCoursesParam(coursesNumber: 5),
    );

    return eitherResult.fold(
      (failure) => throw Exception(),
      (courseList) => courseList.isNotEmpty ? courseList : throw Exception(),
    );
  },
);

final getSubjectsProvider = FutureProvider<List<Subject>>(
  (ref) async {
    final useCase = ref.watch(getSubjectsUCProvider);
    final eitherResult = await useCase(params: NoParams());

    return eitherResult.fold(
      (failure) => throw Exception(),
      (subjectList) => subjectList.isNotEmpty ? subjectList : throw Exception(),
    );
  },
);

final getUserNameProvider = StreamProvider<String>(
  (ref) async* {
    final useCase = ref.watch(getUserChangesUCProvider);
    const anonmouslyUser = '';
    final eitherResult = await useCase(params: NoParams());

    yield* eitherResult.fold(
      (l) async* {
        yield anonmouslyUser;
      },
      (stream) async* {
        await for (final user in stream) {
          if (user?.isAnonymous ?? true) {
            yield anonmouslyUser;
          } else {
            yield user?.displayName?.split(' ')[0] ?? anonmouslyUser;
          }
        }
      },
    );
  },
);
