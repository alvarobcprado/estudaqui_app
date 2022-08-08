import 'package:estudaqui/app/presentation/pages/auth/widgets/signin_social_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:estudaqui/app/domain/entity/auth/social_auth_providers.dart';
import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/common/widgets/my_button.dart';
import 'package:estudaqui/app/presentation/pages/auth/widgets/forgot_password_button.dart';
import 'package:estudaqui/app/presentation/pages/auth/widgets/signin_form_widget.dart';
import 'package:estudaqui/generated/l10n.dart';

typedef EmailPasswordCallback = Future<void> Function({
  required String email,
  required String password,
});

typedef SocialButtonCallback = Future<void> Function(
    {required SocialAuthProviders provider});

class LoginContainer extends StatefulWidget {
  const LoginContainer({
    Key? key,
    required this.onValidated,
    required this.onSocialButtonPressed,
  }) : super(key: key);

  final EmailPasswordCallback onValidated;
  final SocialButtonCallback onSocialButtonPressed;

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final _formKey = GlobalKey<FormBuilderState>();
  late String _email = '';
  late String _password = '';

  bool _isValidForm() {
    final formSaveResult = _formKey.currentState?.saveAndValidate();

    if (formSaveResult != null && formSaveResult) {
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
          SignInFormWidget(formKey: _formKey),
          const ForgotPasswordButton(),
          const SizedBox(height: kLargeNumber),
          Row(
            children: [
              Expanded(
                child: MyButton(
                  onPressed: () async {
                    if (_isValidForm()) {
                      widget.onValidated(
                        email: _email,
                        password: _password,
                      );
                    }
                  },
                  text: S.of(context).auth_form_signin_button,
                ),
              ),
            ],
          ),
          const SizedBox(height: kLargeNumber),
          SigninSocialWidget(
            onSocialButtonPressed: widget.onSocialButtonPressed,
          ),
        ],
      ),
    );
  }
}
