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

  /// `Tela inicial`
  String get drawer_options_home {
    return Intl.message(
      'Tela inicial',
      name: 'drawer_options_home',
      desc: '',
      args: [],
    );
  }

  /// `Página teste`
  String get drawer_options_test {
    return Intl.message(
      'Página teste',
      name: 'drawer_options_test',
      desc: '',
      args: [],
    );
  }

  /// `Adicionar curso`
  String get drawer_options_add_course {
    return Intl.message(
      'Adicionar curso',
      name: 'drawer_options_add_course',
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

  /// `Sair`
  String get drawer_options_signout {
    return Intl.message(
      'Sair',
      name: 'drawer_options_signout',
      desc: '',
      args: [],
    );
  }

  /// `Matérias`
  String get subject_list_title {
    return Intl.message(
      'Matérias',
      name: 'subject_list_title',
      desc: '',
      args: [],
    );
  }

  /// `Bem vindo tal tal tal`
  String get home_page_welcome_title {
    return Intl.message(
      'Bem vindo tal tal tal',
      name: 'home_page_welcome_title',
      desc: '',
      args: [],
    );
  }

  /// `Uma grande mensagem`
  String get home_page_welcome_message {
    return Intl.message(
      'Uma grande mensagem',
      name: 'home_page_welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Ops, algo deu errado`
  String get error_default_message {
    return Intl.message(
      'Ops, algo deu errado',
      name: 'error_default_message',
      desc: '',
      args: [],
    );
  }

  /// `Tentar novamente`
  String get error_default_try_again_message {
    return Intl.message(
      'Tentar novamente',
      name: 'error_default_try_again_message',
      desc: '',
      args: [],
    );
  }

  /// `Adicionar Curso`
  String get add_course_page_title {
    return Intl.message(
      'Adicionar Curso',
      name: 'add_course_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Nome do curso`
  String get add_course_form_name_field {
    return Intl.message(
      'Nome do curso',
      name: 'add_course_form_name_field',
      desc: '',
      args: [],
    );
  }

  /// `Descrição`
  String get add_course_form_description_field {
    return Intl.message(
      'Descrição',
      name: 'add_course_form_description_field',
      desc: '',
      args: [],
    );
  }

  /// `Imagem/Banner URL`
  String get add_course_form_banner_field {
    return Intl.message(
      'Imagem/Banner URL',
      name: 'add_course_form_banner_field',
      desc: '',
      args: [],
    );
  }

  /// `Matérias`
  String get add_course_form_subject_field {
    return Intl.message(
      'Matérias',
      name: 'add_course_form_subject_field',
      desc: '',
      args: [],
    );
  }

  /// `Módulos: {quantity}`
  String add_course_modules_title(Object quantity) {
    return Intl.message(
      'Módulos: $quantity',
      name: 'add_course_modules_title',
      desc: '',
      args: [quantity],
    );
  }

  /// `Nome do módulo`
  String get add_course_module_name_field {
    return Intl.message(
      'Nome do módulo',
      name: 'add_course_module_name_field',
      desc: '',
      args: [],
    );
  }

  /// `Texto`
  String get add_course_module_text_field {
    return Intl.message(
      'Texto',
      name: 'add_course_module_text_field',
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
