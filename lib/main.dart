import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:faeng_courses/core/common/providers/navigation_providers.dart';
import 'package:faeng_courses/firebase_options.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final colors = theme.colors;
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Faeng Courses',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          color: colors.white,
          foregroundColor: colors.primaryColor,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemStatusBarContrastEnforced: true,
          ),
        ),
        progressIndicatorTheme: ProgressIndicatorTheme.of(context).copyWith(
          circularTrackColor: colors.secondaryVariantColor,
          color: colors.primaryColor,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: colors.primaryColor),
        primaryColor: colors.primaryColor,
        scaffoldBackgroundColor: colors.white,
      ),
      routeInformationParser:
          ref.watch(myRoutesProvider).routeInformationParser,
      routerDelegate: ref.watch(myRoutesProvider).routerDelegate,
    );
  }
}
