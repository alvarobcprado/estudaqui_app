import 'package:faeng_courses/app/presentation/common/constants.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:faeng_courses/generated/l10n.dart';
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
                  Padding(
                    padding: const EdgeInsets.all(kXXLargePadding),
                    child: Text(
                      S.of(context).login_container_title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).login_container_email_field_label,
                      ),
                      TextFormField(),
                      const SizedBox(height: kMediumSpacer),
                      Text(
                        S.of(context).login_container_password_field_label,
                      ),
                      TextFormField(),
                    ],
                  ),
                  const SizedBox(height: kMediumSpacer),
                  TextButton(
                    onPressed: () {},
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
