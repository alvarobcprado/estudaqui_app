import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoursesCarouselItem extends ConsumerWidget {
  const CoursesCarouselItem({
    Key? key,
    required this.onPressed,
    required this.courseName,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String courseName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final colors = theme.colors;
    final assets = theme.assets;
    final textStyles = theme.textStyles;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: kSmallNumber * 10,
        padding: const EdgeInsets.all(kSmallNumber),
        margin: const EdgeInsets.symmetric(
          horizontal: kSmallNumber,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSmallNumber),
          color: colors.white,
          image: DecorationImage(
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            image: AssetImage(
              assets.lastAddedCourseBG,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            courseName,
            maxLines: 4,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: textStyles.homeCarouselCourseTitle,
          ),
        ),
      ),
    );
  }
}
