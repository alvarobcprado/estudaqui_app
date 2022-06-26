import 'package:estudaqui/app/presentation/pages/auth/widgets/forgot_password_modal.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:estudaqui/generated/l10n.dart';
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
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              context: context,
              builder: (context) {
                return const ForgotPasswordModal();
              },
            );
          },
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
