import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseAuthorRow extends ConsumerWidget {
  const CourseAuthorRow({
    Key? key,
    required this.authorName,
  }) : super(key: key);

  final String authorName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final colors = theme.colors;
    final textStyles = theme.textStyles;

    final name =
        authorName.isEmpty ? S.of(context).default_course_author : authorName;
    return Row(
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
      ],
    );
  }
}
