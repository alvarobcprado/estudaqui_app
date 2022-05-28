import 'package:estudaqui/app/presentation/common/extensions/string_capitalize.dart';
import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/common/widgets/unexpected_state_widget.dart';
import 'package:estudaqui/app/presentation/pages/course_list/course_list_notifier.dart';
import 'package:estudaqui/app/presentation/pages/course_list/widgets/course_list_tile.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({
    Key? key,
    required this.listId,
    required this.listName,
  }) : super(key: key);

  final String listId;
  final String listName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Text(
                listName.capitalized(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: kLargeNumber,
              ),
              sliver: Consumer(
                builder: (context, ref, child) {
                  final coursesState = ref.watch(
                    courseListNotifierProvider(listId),
                  );
                  return coursesState.maybeWhen(
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
                            return CourseListTile(
                              course: course,
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
                            S.of(context).course_list_empty_state_message(
                                  listName,
                                ),
                        onTryAgain: () => ref
                            .read(
                              courseListNotifierProvider(listId).notifier,
                            )
                            .getCourses(),
                      ),
                    ),
                    orElse: () => SliverFillRemaining(
                      hasScrollBody: false,
                      child: UnexpectedStateWidget(
                        onTryAgain: () => ref
                            .read(
                              courseListNotifierProvider(listId).notifier,
                            )
                            .getCourses(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
