import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UnauthenticatedHeader extends ConsumerWidget {
  const UnauthenticatedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider).colors;
    return Container(
      height: kSmallNumber * 20,
      alignment: Alignment.center,
      child: Text(
        S.of(context).drawer_header_unauthenticated_title,
        style: TextStyle(
          fontSize: kLargeNumber,
          fontWeight: FontWeight.bold,
          color: colors.primaryColor,
        ),
      ),
    );
  }
}
