import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/common/widgets/unexpected_state_widget.dart';
import 'package:estudaqui/app/presentation/pages/user_courses/user_courses_notifier.dart';
import 'package:estudaqui/app/presentation/pages/user_courses/widgets/user_course_list_tile.dart';
import 'package:estudaqui/core/common/my_route_map.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class UserCourseListPage extends StatelessWidget {
  const UserCourseListPage({
    Key? key,
  }) : super(key: key);

  void _onDeleteTapped(WidgetRef ref, Course course) async {
    final didDeleteCourse = await ref
        .read(userCoursesNotifierProvider.notifier)
        .deleteCourse(course);

    if (didDeleteCourse) {
      Fluttertoast.showToast(
        msg: 'Curso removido com sucesso',
      );
    }
  }

  void _onEditTapped(
    BuildContext context,
    WidgetRef ref,
    Course course,
  ) async {
    GoRouter.of(context).pushEditCourse(
      await ref
          .read(
            userCoursesNotifierProvider.notifier,
          )
          .getEditCourseForm(course),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).pushAddCourse();
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Scrollbar(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverAppBar(
                pinned: true,
                title: Text(
                  'Meus cursos',
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kLargeNumber,
                ),
                sliver: Consumer(
                  builder: (context, ref, child) {
                    final userCoursesState = ref.watch(
                      userCoursesNotifierProvider,
                    );
                    return userCoursesState.maybeWhen(
                      initialLoading: () => const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      success: (courseList) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final course = courseList[index];
                              return UserCourseListTile(
                                course: course,
                                onDeleteTap: () => _onDeleteTapped(ref, course),
                                onEditTap: () => _onEditTapped(
                                  context,
                                  ref,
                                  course,
                                ),
                              );
                            },
                            childCount: courseList.length,
                          ),
                        );
                      },
                      empty: () => SliverFillRemaining(
                        hasScrollBody: false,
                        child: UnexpectedStateWidget(
                          buttonMessage:
                              S.of(context).course_list_empty_state_button,
                          stateMessage:
                              S.of(context).course_list_empty_state_message(''),
                          onTryAgain: () => ref
                              .read(
                                userCoursesNotifierProvider.notifier,
                              )
                              .getUserCourses(),
                        ),
                      ),
                      orElse: () => SliverFillRemaining(
                        hasScrollBody: false,
                        child: UnexpectedStateWidget(
                          onTryAgain: () => ref
                              .read(
                                userCoursesNotifierProvider.notifier,
                              )
                              .getUserCourses(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
