import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/common/widgets/action_handler.dart';
import 'package:faeng_courses/app/presentation/pages/auth/auth_container.dart/auth_container.dart';
import 'package:faeng_courses/app/presentation/pages/auth/auth_notifier.dart';
import 'package:faeng_courses/app/presentation/pages/auth/state/auth_state.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:faeng_courses/common/my_route_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final colors = ref.watch(themeProvider).colors;
        final authNotifier = ref.watch(authNotifierProvider.notifier);
        return Scaffold(
          backgroundColor: colors.loginPageBackground,
          body: ActionHandler<AuthState>(
            actionProvider: authNotifierProvider,
            onReceived: (oldState, newState) {
              oldState?.whenOrNull(
                authenticating: () => Navigator.of(context).pop(),
              );
              newState.maybeWhen(
                authenticated: (method) {
                  if (method == AuthMethod.emailPassword) {
                    GoRouter.of(context).replaceWithHome();
                  }
                },
                failedAuthentication: (title, reason) async {
                  await showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(title ?? 'Problema ao logar'),
                      content: Text(
                        reason ??
                            'Algo deu errado ao fazer o login.\nTente novamente daqui a pouco!',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Fechar'),
                        ),
                      ],
                    ),
                  );
                },
                authenticating: () async {
                  await showDialog(
                    context: context,
                    builder: (ctx) => Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(kMediumPadding),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: kSmallSpacer,
                            ),
                            Text('Autenticando...'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                orElse: () {},
              );
            },
            child: AuthContainer(
              onValidated: authNotifier.loginEmailPassword,
            ),
          ),
        );
      },
    );
  }
}
