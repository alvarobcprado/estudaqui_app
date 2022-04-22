import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/presentation/common/extesions/date_time_format.dart';
import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoursePresentation extends ConsumerWidget {
  const CoursePresentation({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final colors = theme.colors;
    final textStyles = theme.textStyles;

    final name = course.creatorName.isEmpty
        ? S.of(context).default_course_author
        : course.creatorName;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              minRadius: kSmallNumber,
              maxRadius: kSmallNumber * 1.5,
              backgroundColor: colors.secondaryVariantColor,
              child: Text(
                name.characters.first,
                style: textStyles.courseListAuthorRow,
              ),
            ),
            const SizedBox(width: kSmallNumber / 2),
            Text(
              name,
              style: textStyles.courseListAuthorRow,
            ),
            const SizedBox(width: kSmallNumber / 2),
            Text(
              '•',
              style: textStyles.courseListAuthorRow,
            ),
            const SizedBox(width: kSmallNumber / 2),
            Text(
              course.createdAt.toLocalFormatString(),
              style: textStyles.courseListAuthorRow,
            ),
          ],
        ),
        Text(
          course.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: textStyles.courseListBigTitle,
        ),
      ],
    );
  }
}
