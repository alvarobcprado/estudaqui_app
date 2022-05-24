import 'package:cached_network_image/cached_network_image.dart';
import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/core/common/general_providers.dart';
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
            CachedNetworkImage(
              imageUrl: imageUrl,
              height: kXXLargeNumber,
              width: kXXLargeNumber,
              placeholder: (_, __) => CircularProgressIndicator(
                color: colors.secondaryVariantColor,
                strokeWidth: 2,
              ),
              errorWidget: (_, __, ___) => Icon(
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
