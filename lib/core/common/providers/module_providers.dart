import 'package:estudaqui/core/common/env_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:twitter_login/twitter_login.dart';

final packageInfoProvider = FutureProvider<PackageInfo>(
  (ref) async {
    return await PackageInfo.fromPlatform();
  },
);

final googleSigninProvider = Provider<GoogleSignIn>(
  (ref) {
    return GoogleSignIn(scopes: ['email', 'profile']);
  },
);

final twitterSigninProvider = Provider<TwitterLogin>(
  (ref) {
    return TwitterLogin(
      apiKey: EnvConfig.twitterApiKey,
      apiSecretKey: EnvConfig.twitterApiSecret,
      redirectURI: 'estudaqui://',
    );
  },
);
