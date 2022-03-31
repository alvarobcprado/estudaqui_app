import 'package:faeng_courses/app/presentation/common/drawer/my_drawer.dart';
import 'package:faeng_courses/app/presentation/common/slivers/sliver_named_section.dart';
import 'package:faeng_courses/app/presentation/common/slivers/sliver_sized_box_adapter.dart';
import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/common/widgets/error_handler_widget.dart';
import 'package:faeng_courses/app/presentation/pages/home/home_page_notifier.dart';
import 'package:faeng_courses/app/presentation/pages/home/widgets/home_app_bar.dart';
import 'package:faeng_courses/app/presentation/pages/home/widgets/latest_courses_carousel.dart';
import 'package:faeng_courses/app/presentation/pages/home/widgets/subjects_sliver_grid.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    final colors = ref.watch(themeProvider).colors;
    final userName = ref.watch(getUserNameProvider);
    final courses = ref.watch(getLastCoursesProvider);
    final subjects = ref.watch(getSubjectsProvider);
    return Container(
      color: colors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          drawer: const MyDrawer(),
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: HomeAppBar(
                  userName: userName.value ?? '',
                ),
                pinned: true,
              ),
              const SliverSizedBoxAdapter(height: kMediumNumber),
              SliverNamedSectionAdapter(
                sectionTitle: S.of(context).home_latest_courses_section,
              ),
              SliverToBoxAdapter(
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
              ),
              const SliverSizedBoxAdapter(height: kMediumNumber),
              SliverNamedSectionAdapter(
                sectionTitle: S.of(context).home_subjects_section,
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: kLargeNumber),
                sliver: subjects.maybeWhen(
                  orElse: () => SliverToBoxAdapter(
                    child: ErrorHandlerWidget(
                      child: const SizedBox(),
                      onTryAgain: () => ref.refresh(getSubjectsProvider),
                    ),
                  ),
                  loading: () => const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  data: (subjectList) => SubjectsSliverGrid(
                    subjectList: subjectList,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
