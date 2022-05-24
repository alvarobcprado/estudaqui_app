import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/common/widgets/unexpected_state_widget.dart';
import 'package:estudaqui/app/presentation/pages/home/home_page_notifier.dart';
import 'package:estudaqui/app/presentation/pages/home/widgets/subjects_sliver_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeSubjectsSection extends ConsumerWidget {
  const HomeSubjectsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjects = ref.watch(getSubjectsProvider);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kLargeNumber),
      sliver: subjects.maybeWhen(
        orElse: () => SliverToBoxAdapter(
          child: UnexpectedStateWidget(
            onTryAgain: () => ref.refresh(getSubjectsProvider),
          ),
        ),
        loading: () => const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        data: (subjectList) => SubjectsSliverGrid(
          subjectList: subjectList,
        ),
      ),
    );
  }
}
