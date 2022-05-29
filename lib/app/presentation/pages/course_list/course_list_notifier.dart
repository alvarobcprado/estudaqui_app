import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/use_case/authentication/get_current_user_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/get_courses_by_author_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/get_courses_by_subject_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/get_courses_uc.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/app/presentation/pages/course_list/state/course_list_state.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:estudaqui/core/error/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final courseListNotifierProvider = StateNotifierProvider.family
    .autoDispose<CourseListNotifier, CourseListState, String>(
  (ref, subjectQuery) {
    final _getCurrentUserUC = ref.watch(getCurrentUserUCProvider);
    final _getCoursesUC = ref.watch(getCoursesUCProvider);
    final _getCoursesBySubjectUC = ref.watch(getCoursesBySubjectProvider);
    final _getCoursesByAuthorUC = ref.watch(getCoursesByAuthorProvider);

    return CourseListNotifier(
      _getCoursesUC,
      _getCoursesBySubjectUC,
      _getCoursesByAuthorUC,
      _getCurrentUserUC,
      subjectQuery,
    );
  },
);

class CourseListNotifier extends StateNotifier<CourseListState> {
  CourseListNotifier(
    this._getCoursesUC,
    this._getCoursesBySubjectUC,
    this._getCoursesByAuthorUC,
    this._getCurrentUserUC,
    this.query,
  ) : super(CourseListState.initial()) {
    getCourses();
  }

  final GetCoursesUC _getCoursesUC;
  final GetCoursesBySubjectUC _getCoursesBySubjectUC;
  final GetCoursesByAuthorUC _getCoursesByAuthorUC;
  final GetCurrentUserUC _getCurrentUserUC;
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

  // TODO: Refact later
  Future<Either<Failure, List<Course>>> _shouldFilterQuery(String query) async {
    if (query.isEmpty || query == 'all') {
      return _getCoursesUC(params: NoParams());
    } else if (query == 'my-courses') {
      final user = await _getCurrentUserUC(params: NoParams());

      return user.fold(
        (l) => Left(l),
        (r) {
          return _getCoursesByAuthorUC(
            params: GetCoursesByAuthorParam(authorID: r.uid),
          );
        },
      );
    } else {
      return _getCoursesBySubjectUC(
        params: GetCoursesBySubjectParam(
          subjectID: query,
        ),
      );
    }
  }
}
