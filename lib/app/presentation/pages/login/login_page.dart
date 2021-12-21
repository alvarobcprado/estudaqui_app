import 'package:faeng_courses/app/presentation/pages/login/login_container.dart/login_container.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider).colors;
    return Scaffold(
      backgroundColor: colors.loginPageBackground,
      body: const LoginContainer(),
    );
  }
}
