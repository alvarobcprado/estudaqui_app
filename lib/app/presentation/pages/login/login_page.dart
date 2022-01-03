import 'package:faeng_courses/app/presentation/common/action_handler.dart';
import 'package:faeng_courses/app/presentation/pages/login/login_container.dart/login_container.dart';
import 'package:faeng_courses/app/presentation/pages/login/login_container.dart/login_container_models.dart';
import 'package:faeng_courses/app/presentation/pages/login/login_container.dart/login_container_notifier.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:faeng_courses/common/my_route_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final colors = ref.watch(themeProvider).colors;
        final loginNotifier =
            ref.watch(loginContainerNotifierProvider.notifier);
        return Scaffold(
          backgroundColor: colors.loginPageBackground,
          body: ActionHandler<LoginState>(
            actionProvider: loginContainerNotifierProvider,
            ref: ref,
            onReceived: (_, newState) {
              if (newState is Success && newState.isUserAuthenticated) {
                Routemaster.of(context).replaceWithHome();
              }
            },
            child: LoginContainer(
              loginNotifier: loginNotifier,
            ),
          ),
        );
      },
    );
  }
}
