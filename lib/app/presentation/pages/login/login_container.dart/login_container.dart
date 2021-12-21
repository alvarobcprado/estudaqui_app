import 'package:faeng_courses/app/presentation/common/constants.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginContainer extends ConsumerStatefulWidget {
  const LoginContainer({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends ConsumerState<LoginContainer> {
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
                  const Padding(
                    padding: EdgeInsets.all(kXXLargePadding),
                    child: Text(
                      'FaEng Cursos',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('E-mail'),
                      TextFormField(),
                      const SizedBox(height: kMediumSpacer),
                      const Text('Senha'),
                      TextFormField(),
                    ],
                  ),
                  const SizedBox(height: kMediumSpacer),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Login'),
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
