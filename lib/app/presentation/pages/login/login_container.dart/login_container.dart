import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/use_case/signin_with_email_and_password_uc.dart';
import 'package:faeng_courses/app/presentation/common/constants.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginContainer extends ConsumerStatefulWidget {
  const LoginContainer({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends ConsumerState<LoginContainer> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final colors = ref.watch(themeProvider).colors;
    return Center(
      child: Padding(
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
                                FormBuilderValidators.email(context),
                                FormBuilderValidators.required(context),
                              ],
                            )),
                        const SizedBox(height: kMediumSpacer),
                        Text(
                          S.of(context).login_container_password_field_label,
                        ),
                        FormBuilderTextField(
                          name: 'passwordField',
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.minLength(
                                context,
                                5,
                                errorText:
                                    'A senha deve ter pelo menos 6 caracteres',
                              ),
                              FormBuilderValidators.required(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: kMediumSpacer),
                  TextButton(
                    onPressed: () async {
                      final result = _formKey.currentState?.saveAndValidate();
                      if (result != null && result) {}
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
  }
}
