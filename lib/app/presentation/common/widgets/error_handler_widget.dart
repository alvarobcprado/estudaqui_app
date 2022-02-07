import 'package:flutter/material.dart';

class ErrorHandlerWidget extends StatelessWidget {
  const ErrorHandlerWidget({
    Key? key,
    required this.child,
    this.onTryAgain,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        child,
        Visibility(
          visible: onTryAgain != null,
          child: TextButton.icon(
            onPressed: onTryAgain!,
            icon: const Icon(Icons.refresh),
            label: const Text('Tentar novamente'),
          ),
        )
      ],
    );
  }
}
