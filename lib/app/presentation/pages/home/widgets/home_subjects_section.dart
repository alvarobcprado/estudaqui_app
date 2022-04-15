import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/common/widgets/unexpected_state_widget.dart';
import 'package:faeng_courses/app/presentation/pages/home/home_page_notifier.dart';
import 'package:faeng_courses/app/presentation/pages/home/widgets/subjects_sliver_grid.dart';
import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeSubjectsSection extends ConsumerWidget {
  const HomeSubjectsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjects = ref.watch(getSubjectsProvider);
    final colors = ref.watch(themeProvider).colors;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kLargeNumber),
      sliver: subjects.maybeWhen(
        orElse: () => SliverToBoxAdapter(
          child: UnexpectedStateWidget(
            onTryAgain: () => ref.refresh(getSubjectsProvider),
          ),
        ),
        loading: () => SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: CircularProgressIndicator(
              color: colors.secondaryVariantColor,
            ),
          ),
        ),
        data: (subjectList) => SubjectsSliverGrid(
          subjectList: subjectList,
        ),
      ),
    );
  }
}
