import 'package:estudaqui/core/common/providers/module_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appVersionProvider = Provider<String>(
  (ref) {
    final packageInfo = ref.watch(packageInfoProvider);
    final appName = packageInfo.whenData((value) => value.version);
    return appName.value ?? '';
  },
);

final appBuildProvider = Provider<String>(
  (ref) {
    final packageInfo = ref.watch(packageInfoProvider);
    final appName = packageInfo.whenData((value) => value.buildNumber);
    return appName.value ?? '';
  },
);
