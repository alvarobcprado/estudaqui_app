import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyButton extends ConsumerWidget {
  const MyButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgrounColor,
    this.textColor,
    this.hasFixedHeight = true,
    this.hasExpandedWidth = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color? backgrounColor;
  final Color? textColor;
  final bool? hasFixedHeight;
  final bool? hasExpandedWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider).colors;
    return SizedBox(
      height: hasFixedHeight! ? kXXLargeNumber : null,
      width: hasExpandedWidth! ? double.infinity : null,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgrounColor ?? colors.secondaryVariantColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kSmallNumber),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor ?? colors.primaryColor),
        ),
      ),
    );
  }
}
