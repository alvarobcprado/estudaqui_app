import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/common/widgets/action_handler.dart';
import 'package:estudaqui/app/presentation/common/widgets/custom_gradient.dart';
import 'package:estudaqui/app/presentation/common/widgets/dialogs.dart';
import 'package:estudaqui/app/presentation/pages/auth/auth_notifier.dart';
import 'package:estudaqui/app/presentation/pages/auth/login_container.dart/login_container.dart';
import 'package:estudaqui/app/presentation/pages/auth/signup_container.dart/signup_container.dart';
import 'package:estudaqui/app/presentation/pages/auth/state/auth_state.dart';
import 'package:estudaqui/app/presentation/pages/auth/widgets/form_select_widget.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:estudaqui/core/common/my_route_map.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

enum AuthMode { signIn, signUp }

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthMode authMode = AuthMode.signIn;

  void onAuthenticated(AuthMethod method) {
    if (method == AuthMethod.emailPassword) {
      Fluttertoast.showToast(msg: S.of(context).toast_success_login);
      GoRouter.of(context).replaceWithHome();
    }
  }

  void onFailAuthenticated(String? title, String? reason) async {
    await DialogHandler.showAlertDialog(
      context,
      title: title,
      body: reason,
    );
  }

  void onAuthenticating() async {
    await DialogHandler.showLoadingDialog(context);
  }

  void switchForm(AuthMode mode) {
    setState(() {
      authMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final colors = ref.watch(themeProvider).colors;
        final assets = ref.watch(themeProvider).assets;
        final authNotifier = ref.watch(authNotifierProvider.notifier);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: ActionHandler<AuthState>(
            actionProvider: authNotifierProvider,
            onReceived: (oldState, newState) {
              oldState?.whenOrNull(
                authenticating: () => Navigator.of(context).pop(),
              );
              newState.maybeWhen(
                authenticated: onAuthenticated,
                failedAuthentication: onFailAuthenticated,
                authenticating: onAuthenticating,
                orElse: () {},
              );
            },
            child: CustomGradient(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(kLargeNumber),
                    child: Column(
                      children: [
                        const SizedBox(height: kXXLargeNumber),
                        Image.asset(assets.logoOrange),
                        const SizedBox(height: kXXLargeNumber),
                        FormSelectWidget(
                          colors: colors,
                          onSwitch: switchForm,
                        ),
                        const SizedBox(height: kSmallNumber),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: authMode == AuthMode.signIn
                              ? LoginContainer(
                                  onValidated: authNotifier.loginEmailPassword,
                                )
                              : SignUpContainer(
                                  onValidated: authNotifier.registerUser,
                                ),
                        ),
                      ],
                    ),
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
