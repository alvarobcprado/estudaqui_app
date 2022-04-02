import 'package:flutter/material.dart';

class SliverSizedBoxAdapter extends StatelessWidget {
  const SliverSizedBoxAdapter({
    Key? key,
    this.height,
    this.width,
    this.child,
  }) : super(key: key);

  final double? height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      key: key,
      child: SizedBox(
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
