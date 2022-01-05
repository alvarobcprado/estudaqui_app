import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.child,
    this.isLoading = true,
    this.opacity = 0.5,
    this.color = Colors.black,
  }) : super(key: key);

  final Widget? child;
  final bool isLoading;
  final double opacity;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child ?? const SizedBox(),
        Visibility(
          visible: isLoading,
          child: Opacity(
            opacity: opacity,
            child: ModalBarrier(
              dismissible: false,
              color: color,
            ),
          ),
        ),
        Visibility(
          visible: isLoading,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
