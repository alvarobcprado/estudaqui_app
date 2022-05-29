import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/use_case/authentication/get_current_user_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/get_course_modules_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/get_courses_by_author_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/remove_course_uc.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/app/presentation/common/extensions/mappers.dart';
import 'package:estudaqui/app/presentation/pages/add_course/models/edit_course_form_model.dart';
import 'package:estudaqui/app/presentation/pages/user_courses/state/user_courses_state.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userCoursesNotifierProvider =
    StateNotifierProvider.autoDispose<UserCoursesNotifier, UserCoursesState>(
  (ref) {
    final _getCurrentUserUC = ref.watch(getCurrentUserUCProvider);
    final _getCoursesByAuthorUC = ref.watch(getCoursesByAuthorProvider);
    final _deleteCourseUC = ref.watch(removeCourseUCProvider);
    final _getCourseModules = ref.watch(getCourseModulesUCProvider);

    return UserCoursesNotifier(
      _getCoursesByAuthorUC,
      _getCurrentUserUC,
      _deleteCourseUC,
      _getCourseModules,
    );
  },
);

class UserCoursesNotifier extends StateNotifier<UserCoursesState> {
  UserCoursesNotifier(
    this._getCoursesByAuthorUC,
    this._getCurrentUserUC,
    this._deleteCourseUC,
    this._getCourseModulesUC,
  ) : super(UserCoursesState.initial()) {
    getUserCourses();
  }

  final GetCoursesByAuthorUC _getCoursesByAuthorUC;
  final GetCurrentUserUC _getCurrentUserUC;
  final RemoveCourseUC _deleteCourseUC;
  final GetCourseModulesUC _getCourseModulesUC;

  Future<void> getUserCourses() async {
    state = UserCoursesState.initialLoading();

    final userEither = await _getCurrentUserUC(params: NoParams());

    state = await userEither.fold(
      (l) => UserCoursesState.failed(
        errorTitle: l.title,
        errorBody: l.message,
      ),
      (r) async {
        final eitherResult = await _getCoursesByAuthorUC(
          params: GetCoursesByAuthorParam(authorID: r.uid),
        );
        return eitherResult.fold(
          (failure) {
            return UserCoursesState.failed(
              errorTitle: failure.title,
              errorBody: failure.message,
            );
          },
          (success) async {
            if (success.isEmpty) {
              return UserCoursesState.empty();
            }
            return UserCoursesState.success(courseList: success);
          },
        );
      },
    );
  }

  Future<bool> deleteCourse(Course course) async {
    final eitherResult = await _deleteCourseUC(
      params: RemoveCourseParam(courseId: course.courseId),
    );

    return eitherResult.fold(
      (l) => false,
      (r) async {
        await getUserCourses();
        return true;
      },
    );
  }

  Future<EditCourseFormModel?> getEditCourseForm(
    Course course,
  ) async {
    final eitherCourseModule = await _getCourseModulesUC(
      params: GetCourseModulesParam(
        courseId: course.courseId,
      ),
    );

    final result = eitherCourseModule.fold(
      (l) => null,
      (courseModules) {
        if (courseModules.isEmpty) {
          return null;
        }

        final module = courseModules.first;

        return EditCourseFormModel(
          courseToAdd: course.toCourseFormModel(),
          courseModuleToAdd: module.toCourseModuleForm(),
        );
      },
    );
    return result;
  }
}
