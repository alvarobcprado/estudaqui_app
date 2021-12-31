import 'package:faeng_courses/app/presentation/common/constants.dart';
import 'package:faeng_courses/app/presentation/common/loading_widget.dart';
import 'package:faeng_courses/app/presentation/pages/login/login_container.dart/login_container_models.dart';
import 'package:faeng_courses/app/presentation/pages/login/login_container.dart/login_container_notifier.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:faeng_courses/common/my_route_map.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:routemaster/routemaster.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({
    required this.loginNotifier,
    Key? key,
  }) : super(key: key);

  final LoginContainerNotifier loginNotifier;

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final _formKey = GlobalKey<FormBuilderState>();
  LoginContainerNotifier get _loginNotifier => widget.loginNotifier;
  bool _loadingAuth = false;

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
              child: Consumer(
                builder: (context, ref, child) {
                  ref.listen<LoginState>(
                    loginContainerNotifierProvider,
                    (_, newLoginState) {
                      if (newLoginState is Loading) {
                        setState(
                          () {
                            _loadingAuth = true;
                          },
                        );
                      } else {
                        setState(
                          () {
                            _loadingAuth = false;
                          },
                        );
                      }
                    },
                  );
                  return LoadingWidget(
                    isLoading: _loadingAuth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kMediumPadding),
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
                                    S
                                        .of(context)
                                        .login_container_email_field_label,
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
                                final result =
                                    _formKey.currentState?.saveAndValidate();
                                if (result != null && result) {
                                  final email = _formKey
                                      .currentState!.value['emailField'];
                                  final password = _formKey
                                      .currentState!.value['passwordField'];
                                  _loginNotifier.loginEmailPassword(
                                    email: email,
                                    password: password,
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
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
