import 'package:cached_network_image/cached_network_image.dart';
import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseCardImage extends ConsumerWidget {
  const CourseCardImage({
    Key? key,
    required this.subjectName,
    required this.courseBannerUrl,
  }) : super(key: key);

  final String subjectName;
  final String courseBannerUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final colors = theme.colors;
    final textStyles = theme.textStyles;
    final assets = theme.assets;
    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: 80 / 120,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSmallNumber),
              color: colors.primaryColor,
              image: DecorationImage(
                image: AssetImage(
                  assets.defaultCourseListBanner,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                subjectName.characters.first.toUpperCase(),
                style: textStyles.courseListBanner,
              ),
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 80 / 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kSmallNumber),
            child: CachedNetworkImage(
              imageUrl: courseBannerUrl,
              fit: BoxFit.cover,
              errorWidget: (_, __, ___) => const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
