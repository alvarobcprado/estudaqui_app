import 'package:estudaqui/app/presentation/common/drawer/my_drawer.dart';
import 'package:estudaqui/app/presentation/common/slivers/sliver_named_section.dart';
import 'package:estudaqui/app/presentation/common/slivers/sliver_sized_box_adapter.dart';
import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/common/widgets/unexpected_state_widget.dart';
import 'package:estudaqui/app/presentation/pages/home/home_page_notifier.dart';
import 'package:estudaqui/app/presentation/pages/home/widgets/home_header_section.dart';
import 'package:estudaqui/app/presentation/pages/home/widgets/home_last_courses_section.dart';
import 'package:estudaqui/app/presentation/pages/home/widgets/home_subjects_section.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          drawer: const MyDrawer(),
          body: Consumer(
            builder: (context, ref, child) {
              final userInit = ref.watch(userInitializerProvider);

              return userInit.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, __) => Center(
                  child: UnexpectedStateWidget(
                    onTryAgain: () => ref.refresh(userInitializerProvider),
                  ),
                ),
                data: (_) => RefreshIndicator(
                  onRefresh: () async {
                    ref.refresh(getLastCoursesProvider);
                  },
                  child: child!,
                ),
              );
            },
            child: CustomScrollView(
              slivers: [
                const HomeHeaderSection(),
                const SliverSizedBoxAdapter(height: kMediumNumber),
                SliverNamedSectionAdapter(
                  sectionTitle: S.of(context).home_latest_courses_section,
                ),
                const HomeLastCoursesSection(),
                const SliverSizedBoxAdapter(height: kMediumNumber),
                SliverNamedSectionAdapter(
                  sectionTitle: S.of(context).home_subjects_section,
                ),
                const HomeSubjectsSection(),
                const SliverSizedBoxAdapter(height: kMediumNumber),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
