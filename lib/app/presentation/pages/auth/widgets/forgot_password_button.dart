import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordButton extends ConsumerWidget {
  const ForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            S.of(context).auth_form_forgot_password,
            style: TextStyle(
              color: ref.watch(themeProvider).colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
