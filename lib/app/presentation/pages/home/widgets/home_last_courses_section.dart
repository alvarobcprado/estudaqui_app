import 'package:faeng_courses/app/presentation/common/widgets/error_handler_widget.dart';
import 'package:faeng_courses/app/presentation/pages/home/home_page_notifier.dart';
import 'package:faeng_courses/app/presentation/pages/home/widgets/latest_courses_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeLastCoursesSection extends ConsumerWidget {
  const HomeLastCoursesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(getLastCoursesProvider);
    return SliverToBoxAdapter(
      child: courses.maybeWhen(
        orElse: () => ErrorHandlerWidget(
          child: const SizedBox(),
          onTryAgain: () => ref.refresh(getLastCoursesProvider),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (courseList) => LatestCoursesCarousel(
          courseList: courseList,
        ),
      ),
    );
  }
}
