import 'package:estudaqui/app/presentation/common/drawer/my_drawer.dart';
import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/pages/app_info/app_info_notifier.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppInfoPage extends ConsumerWidget {
  const AppInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = ref.watch(themeProvider).textStyles;
    return Scaffold(
      drawer: const SafeArea(child: MyDrawer()),
      appBar: AppBar(title: const Text('Sobre o app')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kLargeNumber,
            vertical: kMediumNumber,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                S.of(context).app_info_text,
                textAlign: TextAlign.justify,
                style: textStyles.appInfos,
              ),
              const SizedBox(height: kSmallNumber * 8),
              Text(
                S.of(context).app_info_name,
                style: textStyles.appInfos,
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).app_info_version(
                      "${ref.watch(appVersionProvider)}+${ref.watch(appBuildProvider)}",
                    ),
                style: textStyles.appInfos,
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).app_info_copyrigth(DateTime.now().year),
                style: textStyles.appInfos,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
