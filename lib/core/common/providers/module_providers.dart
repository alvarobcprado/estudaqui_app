import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
