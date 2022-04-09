import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/common/widgets/my_button.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UnexpectedStateWidget extends StatelessWidget {
  const UnexpectedStateWidget({
    Key? key,
    this.onTryAgain,
    this.stateIcon,
    this.stateMessage,
    this.buttonMessage,
  }) : super(key: key);

  final VoidCallback? onTryAgain;
  final IconData? stateIcon;
  final String? stateMessage;
  final String? buttonMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          stateIcon ?? Icons.warning_amber,
          size: kXXLargeNumber,
        ),
        const SizedBox(height: kSmallNumber),
        Text(
          stateMessage ?? S.of(context).error_default_message,
        ),
        const SizedBox(height: kSmallNumber),
        MyButton(
          onPressed: onTryAgain ?? () => GoRouter.of(context).refresh(),
          text: buttonMessage ?? S.of(context).error_default_try_again_message,
        ),
      ],
    );
  }
}
