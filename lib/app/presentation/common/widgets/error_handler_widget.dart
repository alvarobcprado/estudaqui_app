import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';

class ErrorHandlerWidget extends StatelessWidget {
  const ErrorHandlerWidget({
    Key? key,
    required this.child,
    this.onTryAgain,
    this.primaryColor,
    this.textStyle,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onTryAgain;
  final Color? primaryColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        child,
        Visibility(
          visible: onTryAgain != null,
          child: TextButton.icon(
            style: TextButton.styleFrom(
              primary: primaryColor,
            ),
            onPressed: onTryAgain,
            icon: const Icon(Icons.refresh),
            label: Text(
              S.of(context).error_default_try_again_message,
              style: textStyle,
            ),
          ),
          replacement: TextButton.icon(
            onPressed: null,
            icon: const Icon(Icons.cancel_outlined),
            label: Text(
              S.of(context).error_default_message,
            ),
          ),
        )
      ],
    );
  }
}
