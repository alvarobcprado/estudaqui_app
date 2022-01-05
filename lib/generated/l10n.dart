// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter Boilerplate`
  String get project_title {
    return Intl.message(
      'Flutter Boilerplate',
      name: 'project_title',
      desc: '',
      args: [],
    );
  }

  /// `FaEng Cursos`
  String get login_container_title {
    return Intl.message(
      'FaEng Cursos',
      name: 'login_container_title',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get login_container_email_field_label {
    return Intl.message(
      'E-mail',
      name: 'login_container_email_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Insira seu e-mail`
  String get login_container_email_field_hint {
    return Intl.message(
      'Insira seu e-mail',
      name: 'login_container_email_field_hint',
      desc: '',
      args: [],
    );
  }

  /// `Senha`
  String get login_container_password_field_label {
    return Intl.message(
      'Senha',
      name: 'login_container_password_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Digite sua senha`
  String get login_container_password_field_hint {
    return Intl.message(
      'Digite sua senha',
      name: 'login_container_password_field_hint',
      desc: '',
      args: [],
    );
  }

  /// `Entrar`
  String get login_container_signin_button {
    return Intl.message(
      'Entrar',
      name: 'login_container_signin_button',
      desc: '',
      args: [],
    );
  }

  /// `FaEng Cursos`
  String get drawer_header_unauthenticated_title {
    return Intl.message(
      'FaEng Cursos',
      name: 'drawer_header_unauthenticated_title',
      desc: '',
      args: [],
    );
  }

  /// `Olá, {name}`
  String drawer_header_authenticated_title(Object name) {
    return Intl.message(
      'Olá, $name',
      name: 'drawer_header_authenticated_title',
      desc: '',
      args: [name],
    );
  }

  /// `Sair`
  String get drawer_options_signout {
    return Intl.message(
      'Sair',
      name: 'drawer_options_signout',
      desc: '',
      args: [],
    );
  }

  /// `Entrar`
  String get drawer_options_signin {
    return Intl.message(
      'Entrar',
      name: 'drawer_options_signin',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
