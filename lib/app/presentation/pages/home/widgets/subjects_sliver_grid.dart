import 'package:estudaqui/app/domain/entity/subject.dart';
import 'package:estudaqui/app/presentation/pages/home/widgets/subjects_grid_item.dart';
import 'package:estudaqui/core/common/my_route_map.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubjectsSliverGrid extends StatelessWidget {
  const SubjectsSliverGrid({
    Key? key,
    required this.subjectList,
  }) : super(key: key);

  final List<Subject> subjectList;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 88 + 24,
        mainAxisExtent: 96,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == subjectList.length) {
            return SubjectsGridItem(
              name: S.of(context).home_grid_all_courses,
              imageUrl: '',
              cutName: false,
              onPressed: () => GoRouter.of(context).pushAllCourses(),
            );
          }
          final subject = subjectList[index];
          return SubjectsGridItem(
            name: subject.name,
            imageUrl: subject.bannerUrl,
            onPressed: () => GoRouter.of(context).pushCoursesOf(
              subject.subjectId,
              subject.name,
            ),
          );
        },
        childCount: subjectList.length + 1,
      ),
    );
  }
}
