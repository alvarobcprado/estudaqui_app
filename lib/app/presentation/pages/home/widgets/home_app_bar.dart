import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeAppBar extends SliverPersistentHeaderDelegate {
  const HomeAppBar({
    this.expandedHeight = 188 + 24,
    required this.userName,
  });

  final double? expandedHeight;
  final String userName;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    double progress = shrinkOffset / expandedHeight!;
    return Consumer(
      builder: (context, ref, _) {
        final colors = ref.watch(themeProvider).colors;
        final textStyles = ref.watch(themeProvider).textStyles;
        return Container(
          decoration: BoxDecoration(
            color: colors.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                96 * (1 - progress),
              ),
            ),
          ),
          child: Stack(
            clipBehavior: Clip.hardEdge,
            fit: StackFit.expand,
            children: [
              Opacity(
                opacity: (1 - progress),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: kXXLargeNumber,
                    top: kXXXLargeNumber,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: S.of(context).home_greeting_user,
                            style: textStyles.homeAppBarGreeting,
                            children: [
                              TextSpan(
                                text: userName,
                                style: textStyles.homeAppBarUserName,
                              ),
                              const TextSpan(text: ','),
                            ],
                          ),
                        ),
                        Text(
                          S.of(context).home_welcome_message,
                          style: textStyles.homeAppBarWelcome,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Opacity(
                  opacity: progress,
                  child: Text(
                    S.of(context).home_page_title,
                    style: textStyles.homeAppBarTitle,
                  ),
                ),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                foregroundColor: colors.white,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => expandedHeight!;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
