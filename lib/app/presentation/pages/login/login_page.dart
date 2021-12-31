import 'package:faeng_courses/app/presentation/common/loading_widget.dart';
import 'package:faeng_courses/app/presentation/common/state_response_view.dart';
import 'package:faeng_courses/app/presentation/pages/login/login_container.dart/login_container.dart';
import 'package:faeng_courses/app/presentation/pages/login/login_container.dart/login_container_notifier.dart';
import 'package:faeng_courses/app/presentation/pages/login/login_page_notifier.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:faeng_courses/common/my_route_map.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          body: LoginContainer(
            loginNotifier: loginNotifier,
          ),
        );
      },
    );
  }
}
