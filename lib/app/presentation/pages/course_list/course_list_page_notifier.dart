import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:faeng_courses/app/domain/use_case/courses/get_courses_uc.dart';
import 'package:faeng_courses/app/presentation/pages/course_list/course_list_models.dart';

class CourseListPageNotifier extends StateNotifier<CourseListState> {
  CourseListPageNotifier(
    this._getCoursesUC,
    this.query,
  ) : super(const CourseListState(status: CourseListStatus.initial)) {
    getCourses();
  }

  final GetCoursesUC _getCoursesUC;
  final String query;

  Future<void> getCourses() async {
    state = state.copyWith(status: CourseListStatus.loading);
    final eitherResult = await _getCoursesUC.call(params: NoParams());

    state = await eitherResult.fold(
      (failure) {
        return state.copyWith(
          status: CourseListStatus.error,
          failure: failure,
        );
      },
      (success) async {
        final courses = success
            .where(
              (element) => query.isNotEmpty ? element.subject == query : true,
            )
            .toList();
        return state.copyWith(
          courses: courses,
          status: CourseListStatus.success,
        );
      },
    );
  }
}

final courseListNotifierProvider = StateNotifierProvider.family<
    CourseListPageNotifier, CourseListState, String>(
  (ref, subjectQuery) {
    final _getCoursesUC = ref.watch(getCoursesUCProvider);
    return CourseListPageNotifier(_getCoursesUC, subjectQuery);
  },
);
