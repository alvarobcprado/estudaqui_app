import 'package:faeng_courses/app/domain/use_case/courses/get_course_by_id_uc.dart';
import 'package:faeng_courses/app/domain/use_case/courses/get_course_modules_uc.dart';
import 'package:faeng_courses/app/presentation/pages/course_detail/state/course_detail_state.dart';
import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final courseDetailNotifierProvider = StateNotifierProvider.family
    .autoDispose<CourseDetailPageNotifier, CourseDetailState, String>(
  (ref, courseId) {
    final getCoursesModulesUC = ref.watch(getCourseModulesUCProvider);
    final getCourseByIdUC = ref.watch(getCourseByIdUCProvider);
    return CourseDetailPageNotifier(
      courseId: courseId,
      getCourseModulesUC: getCoursesModulesUC,
      getCourseByIdUC: getCourseByIdUC,
    );
  },
);

class CourseDetailPageNotifier extends StateNotifier<CourseDetailState> {
  CourseDetailPageNotifier({
    required this.courseId,
    required GetCourseModulesUC getCourseModulesUC,
    required GetCourseByIdUC getCourseByIdUC,
  })  : _getCourseModules = getCourseModulesUC,
        _getCourseByIdUC = getCourseByIdUC,
        super(CourseDetailState.loading()) {
    fetchCourseContent();
  }

  final String courseId;
  final GetCourseModulesUC _getCourseModules;
  final GetCourseByIdUC _getCourseByIdUC;

  Future<void> fetchCourseContent() async {
    state = CourseDetailState.loading();

    final eitherCourseResult = await _getCourseByIdUC(
      params: GetCourseByIdParam(courseId: courseId),
    );

    final eitherCourseContentResult = await _getCourseModules(
      params: GetCourseModulesParam(courseId: courseId),
    );

    state = eitherCourseResult.fold(
      (failureCourse) {
        return CourseDetailState.failed(
          errorTitle: failureCourse.title,
          errorBody: failureCourse.message,
        );
      },
      (course) {
        return eitherCourseContentResult.fold(
          (failureContent) {
            return CourseDetailState.failed(
              errorTitle: failureContent.title,
              errorBody: failureContent.message,
            );
          },
          (courseContent) {
            if (courseContent.isNotEmpty) {
              return CourseDetailState.success(
                course: course,
                courseContent: courseContent.first,
              );
            }
            return CourseDetailState.failed();
          },
        );
      },
    );
  }
}
