import 'package:flutter/material.dart';

class SliverPaddingAdapter extends StatelessWidget {
  const SliverPaddingAdapter({
    Key? key,
    required this.padding,
    required this.child,
  }) : super(key: key);

  final EdgeInsetsGeometry padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding,
      sliver: SliverToBoxAdapter(
        child: child,
      ),
    );
  }
}
