import 'package:faeng_courses/app/presentation/common/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = MyTheme.of(ref).colors;
    return Scaffold(
      backgroundColor: colors.homeSidebarBackground,
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
