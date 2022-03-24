import 'package:faeng_courses/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomGradient extends ConsumerWidget {
  const CustomGradient({
    this.child,
    this.height,
    this.width,
    this.stops,
    this.colors,
    Key? key,
  })  : assert(
          stops?.length == colors?.length,
          'stops and colors should be same lenght',
        ),
        super(key: key);

  final Widget? child;
  final double? height;
  final double? width;
  final List<double>? stops;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _colors = ref.watch(themeProvider).colors;
    return Container(
      height: height ?? MediaQuery.of(context).size.height,
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: stops ?? const [0.0, 0.25, 0.75, 1],
          colors: colors ?? _colors.loginPageGradient,
        ),
      ),
      child: child,
    );
  }
}
