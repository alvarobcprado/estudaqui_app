import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/use_case/courses/get_courses_by_subject_uc.dart';
import 'package:faeng_courses/app/domain/use_case/courses/get_courses_uc.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/app/presentation/pages/course_list/state/course_list_state.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:faeng_courses/core/error/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final courseListNotifierProvider =
    StateNotifierProvider.family<CourseListNotifier, CourseListState, String>(
  (ref, subjectQuery) {
    final _getCoursesUC = ref.watch(getCoursesUCProvider);
    final _getCoursesBySubjectUC = ref.watch(getCoursesBySubjectProvider);

    return CourseListNotifier(
      _getCoursesUC,
      _getCoursesBySubjectUC,
      subjectQuery,
    );
  },
);

class CourseListNotifier extends StateNotifier<CourseListState> {
  CourseListNotifier(
    this._getCoursesUC,
    this._getCoursesBySubjectUC,
    this.query,
  ) : super(CourseListState.initial()) {
    getCourses();
  }

  final GetCoursesUC _getCoursesUC;
  final GetCoursesBySubjectUC _getCoursesBySubjectUC;
  final String query;

  Future<void> getCourses() async {
    state = CourseListState.initialLoading();
    final eitherResult = await _shouldFilterQuery(query);

    state = await eitherResult.fold(
      (failure) {
        return CourseListState.failed(
          errorTitle: failure.title,
          errorBody: failure.message,
        );
      },
      (success) async {
        if (success.isEmpty) {
          return CourseListState.empty();
        }
        return CourseListState.success(courseList: success);
      },
    );
  }

  Future<Either<Failure, List<Course>>> _shouldFilterQuery(String query) async {
    if (query.isEmpty) {
      return _getCoursesUC(params: NoParams());
    } else {
      return _getCoursesBySubjectUC(
          params: GetCoursesBySubjectParam(
        subjectID: query,
      ));
    }
  }
}
