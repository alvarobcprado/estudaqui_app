import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SliverNamedSectionAdapter extends ConsumerWidget {
  const SliverNamedSectionAdapter({
    Key? key,
    this.color,
    this.padding,
    required this.sectionTitle,
  }) : super(key: key);

  final Color? color;
  final EdgeInsetsGeometry? padding;
  final String sectionTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider).colors;
    final textStyles = ref.watch(themeProvider).textStyles;
    return SliverToBoxAdapter(
      child: Padding(
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: kLargeNumber,
              vertical: kSmallNumber,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sectionTitle,
              style: textStyles.sectionTitle.copyWith(
                color: color,
              ),
            ),
            Divider(
              thickness: 2,
              height: 0,
              color: color ?? colors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
