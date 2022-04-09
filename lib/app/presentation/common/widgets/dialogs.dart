import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class DialogHandler {
  static showLoadingDialog<T>(BuildContext context, {String? loadingText}) {
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (ctx) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(kMediumPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: kSmallNumber),
                Text(S.of(ctx).default_loading_dialog_text),
              ],
            ),
          ),
        );
      },
    );
  }

  static showAlertDialog<T>(
    BuildContext context, {
    String? title,
    String? body,
    List<Widget>? actions,
    bool isDismissible = false,
    bool useRootNavigator = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: isDismissible,
      useRootNavigator: useRootNavigator,
      builder: (ctx) {
        return Consumer(builder: (context, ref, _) {
          final colors = ref.watch(themeProvider).colors;
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kSmallNumber),
            ),
            title: Text(title ?? S.of(ctx).default_error_dialog_title),
            titleTextStyle: TextStyle(color: colors.errorColor),
            content: Text(
              body ?? S.of(ctx).default_error_dialog_body,
            ),
            actions: actions ??
                [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text(S.of(ctx).default_error_dialog_button),
                  ),
                ],
          );
        });
      },
    );
  }
}
