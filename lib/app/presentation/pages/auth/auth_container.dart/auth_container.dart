import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

typedef EmailPasswordCallback = Future<void> Function({
  required String email,
  required String password,
});

class AuthContainer extends StatefulWidget {
  const AuthContainer({
    Key? key,
    required this.onValidated,
  }) : super(key: key);

  final EmailPasswordCallback onValidated;

  @override
  State<AuthContainer> createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
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
    return Consumer(
      builder: (context, ref, child) {
        final colors = ref.watch(themeProvider).colors;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: kXLargePadding),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: colors.loginContainerBackground,
              ),
              width: 500,
              height: 400,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(kXXLargePadding),
                        child: Text(
                          S.of(context).login_container_title,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FormBuilder(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).login_container_email_field_label,
                            ),
                            FormBuilderTextField(
                                name: 'emailField',
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.email(
                                      context,
                                    ),
                                    FormBuilderValidators.required(
                                      context,
                                    ),
                                  ],
                                )),
                            const SizedBox(height: kMediumSpacer),
                            Text(
                              S
                                  .of(context)
                                  .login_container_password_field_label,
                            ),
                            FormBuilderTextField(
                              name: 'passwordField',
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.minLength(
                                    context,
                                    5,
                                  ),
                                  FormBuilderValidators.required(
                                    context,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: kMediumSpacer),
                      TextButton(
                        onPressed: () async {
                          if (_isValidForm()) {
                            widget.onValidated(
                              email: _email,
                              password: _password,
                            );
                          }
                        },
                        child: Text(
                          S.of(context).login_container_signin_button,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
