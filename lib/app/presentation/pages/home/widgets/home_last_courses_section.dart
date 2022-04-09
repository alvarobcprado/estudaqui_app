import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/common/widgets/unexpected_state_widget.dart';
import 'package:faeng_courses/app/presentation/pages/home/home_page_notifier.dart';
import 'package:faeng_courses/app/presentation/pages/home/widgets/latest_courses_carousel.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeLastCoursesSection extends ConsumerWidget {
  const HomeLastCoursesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(getLastCoursesProvider);
    final colors = ref.watch(themeProvider).colors;
    return SliverToBoxAdapter(
      child: Container(
        color: colors.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: kSmallNumber),
        height: 136,
        child: courses.maybeWhen(
          orElse: () => UnexpectedStateWidget(
            iconColor: colors.white,
            textColor: colors.white,
            onTryAgain: () => ref.refresh(getLastCoursesProvider),
          ),
          loading: () => Center(
            child: CircularProgressIndicator(
              color: colors.secondaryVariantColor,
            ),
          ),
          data: (courseList) => LatestCoursesCarousel(
            courseList: courseList,
          ),
        ),
      ),
    );
  }
}
