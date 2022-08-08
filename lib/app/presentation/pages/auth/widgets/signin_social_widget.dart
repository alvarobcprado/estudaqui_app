import 'package:estudaqui/app/domain/entity/auth/social_auth_providers.dart';
import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/common/widgets/social_login_button.dart';
import 'package:estudaqui/app/presentation/pages/auth/login_container.dart/login_container.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SigninSocialWidget extends StatelessWidget {
  const SigninSocialWidget({
    Key? key,
    required this.onSocialButtonPressed,
  }) : super(key: key);

  final SocialButtonCallback onSocialButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final theme = ref.read(themeProvider);
      final colors = theme.colors;
      return Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Divider(
                  color: colors.white,
                ),
              ),
              Text(
                S.of(context).auth_form_sigin_social_divider,
                style: TextStyle(color: colors.white),
              ),
              Flexible(
                child: Divider(
                  color: colors.white,
                ),
              )
            ],
          ),
          const SizedBox(height: kSmallNumber),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialLoginButton(
                socialProvider: SocialAuthProviders.google,
                onPressed: () => onSocialButtonPressed(
                  provider: SocialAuthProviders.google,
                ),
              )
            ],
          ),
        ],
      );
    });
  }
}
