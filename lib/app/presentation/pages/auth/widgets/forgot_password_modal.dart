import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/common/widgets/my_form_field.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ForgotPasswordModal extends ConsumerStatefulWidget {
  const ForgotPasswordModal({Key? key}) : super(key: key);

  @override
  ConsumerState<ForgotPasswordModal> createState() =>
      _ForgotPasswordModalState();
}

class _ForgotPasswordModalState extends ConsumerState<ForgotPasswordModal> {
  late final TextEditingController _emailController;
  ValueNotifier<bool> isActiveButton = ValueNotifier(false);
  late final _fieldValidator = FormBuilderValidators.compose(
    [
      FormBuilderValidators.email(
        context,
        errorText: S.of(context).form_error_valid_email_field,
      ),
      FormBuilderValidators.required(
        context,
        errorText: S.of(context).form_error_text_required_field,
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _emailController.addListener(_handleButtonStatus);
  }

  @override
  void dispose() {
    _emailController.removeListener(_handleButtonStatus);
    _emailController.dispose();
    super.dispose();
  }

  void _handleButtonStatus() {
    if (_fieldValidator.call(_emailController.text) != null) {
      isActiveButton.value = false;
    } else {
      isActiveButton.value = true;
    }
  }

  void _onTapSendEmail() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text,
      );
      Fluttertoast.showToast(
        msg: S.of(context).forgot_password_modal_success_toast,
      );
      Navigator.of(context).pop();
    } catch (e) {
      Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        msg: S.of(context).forgot_password_modal_error_toast,
      );
    }
  }

  // TODO: Refact this with correct clean arch structure
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final colors = theme.colors;
    final textStyles = theme.textStyles;
    final backgroundColor = colors.primaryColor.withOpacity(0.2);
    final textColor = colors.primaryColor;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: const EdgeInsets.only(
        left: kMediumNumber,
        right: kMediumNumber,
        top: kMediumNumber,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.close),
            ),
          ),
          Text(
            S.of(context).forgot_password_modal_title,
            style: textStyles.forgotPasswordModalTitle,
          ),
          const SizedBox(
            height: kLargeNumber,
          ),
          MyFormField(
            labelText: S.of(context).forgot_password_modal_email_field_label,
            fieldName: 'forgotPasswordField',
            backgroundColor: backgroundColor,
            labelColor: textColor,
            controller: _emailController,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.email(
                  context,
                  errorText: S.of(context).form_error_valid_email_field,
                ),
                FormBuilderValidators.required(
                  context,
                  errorText: S.of(context).form_error_text_required_field,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ValueListenableBuilder<bool>(
              valueListenable: isActiveButton,
              builder: (context, isActive, _) => TextButton.icon(
                style: TextButton.styleFrom(primary: colors.primaryColor),
                onPressed: isActive ? _onTapSendEmail : null,
                icon: const Icon(Icons.send),
                label: Text(S.of(context).forgot_password_modal_send_button),
              ),
            ),
          ),
          SizedBox(
            height: keyboardHeight + kMediumNumber,
          )
        ],
      ),
    );
  }
}
