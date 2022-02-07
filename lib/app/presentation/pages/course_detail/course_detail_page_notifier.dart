import 'package:faeng_courses/app/domain/use_case/courses/get_course_modules_uc.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:faeng_courses/app/presentation/pages/course_detail/course_detail_models.dart';

class CourseDetailPageNotifier extends StateNotifier<CourseDetailState> {
  CourseDetailPageNotifier({
    required this.courseId,
    required GetCourseModulesUC getCourseModulesUC,
  })  : _getCourseModules = getCourseModulesUC,
        super(CourseDetailState()) {
    _fetchCourseModules();
  }

  final String courseId;
  final GetCourseModulesUC _getCourseModules;

  Future<void> _fetchCourseModules() async {
    state = state.copyWith(status: CourseDetailStatus.loading);

    final eitherModulesResult = await _getCourseModules.call(
      params: GetCourseModulesParam(courseId: courseId),
    );

    state = eitherModulesResult.fold(
      (failure) {
        return state.copyWith(
          status: CourseDetailStatus.error,
          failure: failure,
        );
      },
      (moduleList) {
        return state.copyWith(
          status: CourseDetailStatus.success,
          currentModule: 0,
          moduleList: moduleList,
        );
      },
    );
  }
}

final courseDetailNotifierProvider = StateNotifierProvider.family
    .autoDispose<CourseDetailPageNotifier, CourseDetailState, String>(
  (ref, courseId) {
    final getCoursesModulesUC = ref.watch(getCourseModulesUCProvider);
    return CourseDetailPageNotifier(
      courseId: courseId,
      getCourseModulesUC: getCoursesModulesUC,
    );
  },
);
