import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/common/widgets/error_handler_widget.dart';
import 'package:faeng_courses/app/presentation/pages/home/home_page_notifier.dart';
import 'package:faeng_courses/app/presentation/pages/home/widgets/subjects_sliver_grid.dart';
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
    );
  }
}
