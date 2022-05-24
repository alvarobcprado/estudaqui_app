import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyDrawerTile extends ConsumerWidget {
  const MyDrawerTile({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback onTap;
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider).colors;
    return ListTile(
      iconColor: colors.primaryColor,
      textColor: colors.primaryColor,
      selected: isSelected,
      selectedColor: colors.primaryColor,
      selectedTileColor: colors.primaryVariantLightColor.withOpacity(
        0.50,
      ),
      dense: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kSmallNumber / 2),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: kSmallNumber,
      ),
      onTap: onTap,
      leading: icon,
      title: Text(title),
    );
  }
}
