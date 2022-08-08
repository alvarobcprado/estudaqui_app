import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:flutter/material.dart';

import 'package:estudaqui/app/domain/entity/auth/social_auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    Key? key,
    required this.onPressed,
    required this.socialProvider,
  }) : super(key: key);

  final VoidCallback onPressed;
  final SocialAuthProviders socialProvider;

  ImageProvider _getSocialImage(WidgetRef ref) {
    final assets = ref.read(themeProvider).assets;
    switch (socialProvider) {
      case SocialAuthProviders.google:
        return AssetImage(assets.googleIcon);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Material(
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: IconButton(
          onPressed: onPressed,
          icon: ImageIcon(_getSocialImage(ref)),
          color: ref.watch(themeProvider).colors.secondaryVariantColor,
          iconSize: kXXLargeNumber,
        ),
      ),
    );
  }
}
