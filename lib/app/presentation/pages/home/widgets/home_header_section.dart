import 'package:faeng_courses/app/presentation/pages/home/home_page_notifier.dart';
import 'package:faeng_courses/app/presentation/pages/home/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeaderSection extends ConsumerWidget {
  const HomeHeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(getUserNameProvider);
    return SliverPersistentHeader(
      delegate: HomeAppBar(
        userName: userName.value ?? '',
      ),
      pinned: true,
    );
  }
}
