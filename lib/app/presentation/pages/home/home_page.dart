import 'package:faeng_courses/app/presentation/common/drawer/my_drawer.dart';
import 'package:faeng_courses/app/presentation/common/slivers/sliver_named_section.dart';
import 'package:faeng_courses/app/presentation/common/slivers/sliver_sized_box_adapter.dart';
import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/pages/home/widgets/home_header_section.dart';
import 'package:faeng_courses/app/presentation/pages/home/widgets/home_last_courses_section.dart';
import 'package:faeng_courses/app/presentation/pages/home/widgets/home_subjects_section.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';

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
          body: CustomScrollView(
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
            ],
          ),
        ),
      ),
    );
  }
}
