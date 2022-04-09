import 'package:faeng_courses/app/domain/entity/subject.dart';
import 'package:faeng_courses/app/presentation/pages/home/widgets/subjects_grid_item.dart';
import 'package:faeng_courses/common/my_route_map.dart';
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
        childCount: subjectList.length,
      ),
    );
  }
}
