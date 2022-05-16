import 'package:cached_network_image/cached_network_image.dart';
import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoursesCarouselItem extends ConsumerWidget {
  const CoursesCarouselItem({
    Key? key,
    required this.onPressed,
    required this.courseName,
    required this.courseBanner,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String courseName;
  final String courseBanner;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final assets = theme.assets;
    final textStyles = theme.textStyles;
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kSmallNumber),
            child: AspectRatio(
              aspectRatio: 80 / 120,
              child: CachedNetworkImage(
                imageUrl: courseBanner,
                imageBuilder: (context, imageProvider) {
                  return Image(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  );
                },
                errorWidget: (_, __, ___) {
                  return Image.asset(
                    assets.lastAddedCourseBG,
                    fit: BoxFit.cover,
                  );
                },
                placeholder: (_, __) {
                  return Image.asset(
                    assets.lastAddedCourseBG,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 80 / 120,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSmallNumber),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.white10,
                    Colors.white54,
                    Colors.white,
                    Colors.white,
                  ],
                ),
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 80 / 120,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(kSmallNumber),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    courseName,
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: textStyles.homeCarouselCourseTitle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
