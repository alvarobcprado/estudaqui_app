import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/common/widgets/conditional_widget.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubjectsGridItem extends ConsumerWidget {
  const SubjectsGridItem({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.onPressed,
  }) : super(key: key);

  final String name;
  final String imageUrl;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider).colors;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSmallNumber),
          color: colors.primaryColor,
        ),
        height: kSmallNumber * 12,
        width: kSmallNumber * 11,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ConditionalWidget(
              condition: imageUrl.isNotEmpty,
              conditionalChild: Image.network(
                imageUrl,
                height: kXXLargeNumber,
                width: kXXLargeNumber,
              ),
              child: Icon(
                Icons.book,
                size: kXXLargeNumber,
                color: colors.secondaryVariantColor,
              ),
            ),
            Text(
              name.substring(0, 3).toUpperCase(),
              style: TextStyle(
                fontSize: kMediumNumber,
                fontWeight: FontWeight.w600,
                color: colors.secondaryVariantColor,
                height: kLargeNumber / kMediumNumber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
