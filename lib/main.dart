import 'package:faeng_courses/common/my_route_map.dart';
import 'package:faeng_courses/firebase_options.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:routemaster/routemaster.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: const RoutemasterParser(),
      routerDelegate: RoutemasterDelegate(
        routesBuilder: (_) => MyRouteMap(),
      ),
    );
  }
}
