import 'package:estudaqui/core/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UnauthenticatedHeader extends ConsumerWidget {
  const UnauthenticatedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(themeProvider).assets;
    return DrawerHeader(
      child: Image.asset(assets.logoNamedBlue),
    );
  }
}
