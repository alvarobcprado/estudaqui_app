import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/common/widgets/my_button.dart';
import 'package:estudaqui/app/presentation/pages/auth/widgets/signup_form_widget.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef RegisterCallback = Future<void> Function({
  required String name,
  required String email,
  required String password,
});

class SignUpContainer extends StatefulWidget {
  const SignUpContainer({
    Key? key,
    required this.onValidated,
  }) : super(key: key);

  final RegisterCallback onValidated;

  @override
  State<SignUpContainer> createState() => _SignUpContainerState();
}

class _SignUpContainerState extends State<SignUpContainer> {
  final _formKey = GlobalKey<FormBuilderState>();
  late String _name = '';
  late String _email = '';
  late String _password = '';

  bool _isValidForm() {
    final formSaveResult = _formKey.currentState?.saveAndValidate();

    if (formSaveResult != null && formSaveResult) {
      _name = _formKey.currentState!.value['nameField'];
      _email = _formKey.currentState!.value['emailField'];
      _password = _formKey.currentState!.value['passwordField'];
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SignUpFormWidget(formKey: _formKey),
          const SizedBox(height: kXXLargeNumber),
          Consumer(builder: (context, ref, child) {
            final colors = ref.watch(themeProvider).colors;
            return Row(
              children: [
                Expanded(
                  child: MyButton(
                    onPressed: () async {
                      if (_isValidForm()) {
                        widget.onValidated(
                          name: _name,
                          email: _email,
                          password: _password,
                        );
                      }
                    },
                    textColor: colors.primaryColor,
                    backgrounColor: colors.white,
                    text: S.of(context).auth_form_signup_button,
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
