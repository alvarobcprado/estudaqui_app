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

  /// `Estudaqui`
  String get auth_form_title {
    return Intl.message(
      'Estudaqui',
      name: 'auth_form_title',
      desc: '',
      args: [],
    );
  }

  /// `seu nome`
  String get auth_form_name_field_label {
    return Intl.message(
      'seu nome',
      name: 'auth_form_name_field_label',
      desc: '',
      args: [],
    );
  }

  /// `seu@email.com`
  String get auth_form_email_field_label {
    return Intl.message(
      'seu@email.com',
      name: 'auth_form_email_field_label',
      desc: '',
      args: [],
    );
  }

  /// `senha`
  String get auth_form_password_field_label {
    return Intl.message(
      'senha',
      name: 'auth_form_password_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Entrar`
  String get auth_form_signin_button {
    return Intl.message(
      'Entrar',
      name: 'auth_form_signin_button',
      desc: '',
      args: [],
    );
  }

  /// `Cadastrar`
  String get auth_form_signup_button {
    return Intl.message(
      'Cadastrar',
      name: 'auth_form_signup_button',
      desc: '',
      args: [],
    );
  }

  /// `entrar`
  String get auth_form_select_signin {
    return Intl.message(
      'entrar',
      name: 'auth_form_select_signin',
      desc: '',
      args: [],
    );
  }

  /// `cadastrar`
  String get auth_form_select_signup {
    return Intl.message(
      'cadastrar',
      name: 'auth_form_select_signup',
      desc: '',
      args: [],
    );
  }

  /// `esqueceu sua senha?`
  String get auth_form_forgot_password {
    return Intl.message(
      'esqueceu sua senha?',
      name: 'auth_form_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Estudaqui`
  String get drawer_header_unauthenticated_title {
    return Intl.message(
      'Estudaqui',
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

  /// `Sobre o app`
  String get drawer_options_app_info {
    return Intl.message(
      'Sobre o app',
      name: 'drawer_options_app_info',
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

  /// `Editar curso`
  String get edit_course_page_title {
    return Intl.message(
      'Editar curso',
      name: 'edit_course_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Adicionar curso`
  String get add_course_page_title {
    return Intl.message(
      'Adicionar curso',
      name: 'add_course_page_title',
      desc: '',
      args: [],
    );
  }

  /// `nome do curso*`
  String get add_course_form_name_field {
    return Intl.message(
      'nome do curso*',
      name: 'add_course_form_name_field',
      desc: '',
      args: [],
    );
  }

  /// `descrição*`
  String get add_course_form_description_field {
    return Intl.message(
      'descrição*',
      name: 'add_course_form_description_field',
      desc: '',
      args: [],
    );
  }

  /// `url do banner / imagem`
  String get add_course_form_banner_field {
    return Intl.message(
      'url do banner / imagem',
      name: 'add_course_form_banner_field',
      desc: '',
      args: [],
    );
  }

  /// `matérias*`
  String get add_course_form_subject_field {
    return Intl.message(
      'matérias*',
      name: 'add_course_form_subject_field',
      desc: '',
      args: [],
    );
  }

  /// `Adicionar conteúdo`
  String get add_course_content_button {
    return Intl.message(
      'Adicionar conteúdo',
      name: 'add_course_content_button',
      desc: '',
      args: [],
    );
  }

  /// `Editar conteúdo`
  String get add_course_content_edit_button {
    return Intl.message(
      'Editar conteúdo',
      name: 'add_course_content_edit_button',
      desc: '',
      args: [],
    );
  }

  /// `Corrigir conteúdo`
  String get add_course_content_error_button {
    return Intl.message(
      'Corrigir conteúdo',
      name: 'add_course_content_error_button',
      desc: '',
      args: [],
    );
  }

  /// `Salvar curso`
  String get add_course_save_button {
    return Intl.message(
      'Salvar curso',
      name: 'add_course_save_button',
      desc: '',
      args: [],
    );
  }

  /// `Salvando curso...`
  String get add_course_saving_dialog {
    return Intl.message(
      'Salvando curso...',
      name: 'add_course_saving_dialog',
      desc: '',
      args: [],
    );
  }

  /// `Adicionar conteúdo`
  String get add_course_content_page_title {
    return Intl.message(
      'Adicionar conteúdo',
      name: 'add_course_content_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Insira o conteúdo do seu curso aqui.`
  String get add_course_content_editor_hint {
    return Intl.message(
      'Insira o conteúdo do seu curso aqui.',
      name: 'add_course_content_editor_hint',
      desc: '',
      args: [],
    );
  }

  /// `Conteúdo do curso`
  String get add_module_text_dialog_title {
    return Intl.message(
      'Conteúdo do curso',
      name: 'add_module_text_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Adicionar módulo`
  String get add_module_text_add_button {
    return Intl.message(
      'Adicionar módulo',
      name: 'add_module_text_add_button',
      desc: '',
      args: [],
    );
  }

  /// `Editar módulo`
  String get add_module_text_edit_button {
    return Intl.message(
      'Editar módulo',
      name: 'add_module_text_edit_button',
      desc: '',
      args: [],
    );
  }

  /// `Salvar módulo`
  String get add_module_text_save_button {
    return Intl.message(
      'Salvar módulo',
      name: 'add_module_text_save_button',
      desc: '',
      args: [],
    );
  }

  /// `Limpar`
  String get add_module_text_clear_button {
    return Intl.message(
      'Limpar',
      name: 'add_module_text_clear_button',
      desc: '',
      args: [],
    );
  }

  /// `Algo deu errado`
  String get default_error_dialog_title {
    return Intl.message(
      'Algo deu errado',
      name: 'default_error_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, tente novamente mais tarde`
  String get default_error_dialog_body {
    return Intl.message(
      'Por favor, tente novamente mais tarde',
      name: 'default_error_dialog_body',
      desc: '',
      args: [],
    );
  }

  /// `Fechar`
  String get default_error_dialog_button {
    return Intl.message(
      'Fechar',
      name: 'default_error_dialog_button',
      desc: '',
      args: [],
    );
  }

  /// `Carregando...`
  String get default_loading_dialog_text {
    return Intl.message(
      'Carregando...',
      name: 'default_loading_dialog_text',
      desc: '',
      args: [],
    );
  }

  /// `Matérias`
  String get home_subjects_section {
    return Intl.message(
      'Matérias',
      name: 'home_subjects_section',
      desc: '',
      args: [],
    );
  }

  /// `Últimos cursos adicionados`
  String get home_latest_courses_section {
    return Intl.message(
      'Últimos cursos adicionados',
      name: 'home_latest_courses_section',
      desc: '',
      args: [],
    );
  }

  /// `FaEng Cursos`
  String get home_page_title {
    return Intl.message(
      'FaEng Cursos',
      name: 'home_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Bem-vindo(a) ao Estudaqui,\nseu lugar de aprendizado.`
  String get home_welcome_message {
    return Intl.message(
      'Bem-vindo(a) ao Estudaqui,\nseu lugar de aprendizado.',
      name: 'home_welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Olá `
  String get home_greeting_user {
    return Intl.message(
      'Olá ',
      name: 'home_greeting_user',
      desc: '',
      args: [],
    );
  }

  /// `TODAS`
  String get home_grid_all_courses {
    return Intl.message(
      'TODAS',
      name: 'home_grid_all_courses',
      desc: '',
      args: [],
    );
  }

  /// `Desconhecido`
  String get default_course_author {
    return Intl.message(
      'Desconhecido',
      name: 'default_course_author',
      desc: '',
      args: [],
    );
  }

  /// `Ops, nenhum curso de {subject} encontrado`
  String course_list_empty_state_message(Object subject) {
    return Intl.message(
      'Ops, nenhum curso de $subject encontrado',
      name: 'course_list_empty_state_message',
      desc: '',
      args: [subject],
    );
  }

  /// `Buscar novamente`
  String get course_list_empty_state_button {
    return Intl.message(
      'Buscar novamente',
      name: 'course_list_empty_state_button',
      desc: '',
      args: [],
    );
  }

  /// `Adicionado em {date}`
  String course_list_date_added(Object date) {
    return Intl.message(
      'Adicionado em $date',
      name: 'course_list_date_added',
      desc: '',
      args: [date],
    );
  }

  /// `Este campo não pode ser vazio`
  String get form_error_text_required_field {
    return Intl.message(
      'Este campo não pode ser vazio',
      name: 'form_error_text_required_field',
      desc: '',
      args: [],
    );
  }

  /// `Este campo precisa de um e-mail válido`
  String get form_error_valid_email_field {
    return Intl.message(
      'Este campo precisa de um e-mail válido',
      name: 'form_error_valid_email_field',
      desc: '',
      args: [],
    );
  }

  /// `Este campo precisa ter ao menos {length} caracteres`
  String form_error_text_min_length_field(Object length) {
    return Intl.message(
      'Este campo precisa ter ao menos $length caracteres',
      name: 'form_error_text_min_length_field',
      desc: '',
      args: [length],
    );
  }

  /// `Sobre o App`
  String get app_info_page_title {
    return Intl.message(
      'Sobre o App',
      name: 'app_info_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Aplicativo desenvolvido como parte dos requisitos necessários para a aprovação na disciplina de Trabalho de conclusão de curso, sob orientação da Prof.ª Drª. Gracyeli Guarienti`
  String get app_info_text {
    return Intl.message(
      'Aplicativo desenvolvido como parte dos requisitos necessários para a aprovação na disciplina de Trabalho de conclusão de curso, sob orientação da Prof.ª Drª. Gracyeli Guarienti',
      name: 'app_info_text',
      desc: '',
      args: [],
    );
  }

  /// `Estudaqui`
  String get app_info_name {
    return Intl.message(
      'Estudaqui',
      name: 'app_info_name',
      desc: '',
      args: [],
    );
  }

  /// `Versão {version}`
  String app_info_version(Object version) {
    return Intl.message(
      'Versão $version',
      name: 'app_info_version',
      desc: '',
      args: [version],
    );
  }

  /// `© {year} Álvaro Prado`
  String app_info_copyrigth(Object year) {
    return Intl.message(
      '© $year Álvaro Prado',
      name: 'app_info_copyrigth',
      desc: '',
      args: [year],
    );
  }

  /// `Adicionar vídeo`
  String get add_video_dialog_title {
    return Intl.message(
      'Adicionar vídeo',
      name: 'add_video_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get add_video_dialog_cancel {
    return Intl.message(
      'Cancelar',
      name: 'add_video_dialog_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Por favor adicione uma URL válida`
  String get add_video_dialog_empty {
    return Intl.message(
      'Por favor adicione uma URL válida',
      name: 'add_video_dialog_empty',
      desc: '',
      args: [],
    );
  }

  /// `Adicionar imagem`
  String get add_picture_dialog_title {
    return Intl.message(
      'Adicionar imagem',
      name: 'add_picture_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Selecionar da galeria`
  String get add_picture_dialog_select_from_files {
    return Intl.message(
      'Selecionar da galeria',
      name: 'add_picture_dialog_select_from_files',
      desc: '',
      args: [],
    );
  }

  /// `Escolha a imagem`
  String get add_picture_dialog_pick_file {
    return Intl.message(
      'Escolha a imagem',
      name: 'add_picture_dialog_pick_file',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get add_picture_dialog_cancel {
    return Intl.message(
      'Cancelar',
      name: 'add_picture_dialog_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Por favor adicione uma URL válida ou selecione uma imagem`
  String get add_picture_dialog_empty {
    return Intl.message(
      'Por favor adicione uma URL válida ou selecione uma imagem',
      name: 'add_picture_dialog_empty',
      desc: '',
      args: [],
    );
  }

  /// `Por favor adicione uma URL válida ou selecione uma imagem, não ambos`
  String get add_picture_dialog_both_filled {
    return Intl.message(
      'Por favor adicione uma URL válida ou selecione uma imagem, não ambos',
      name: 'add_picture_dialog_both_filled',
      desc: '',
      args: [],
    );
  }

  /// `Confirmar deleção`
  String get user_courses_dialog_title {
    return Intl.message(
      'Confirmar deleção',
      name: 'user_courses_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Quer mesmo deletar o curso {name}?`
  String user_courses_dialog_content(Object name) {
    return Intl.message(
      'Quer mesmo deletar o curso $name?',
      name: 'user_courses_dialog_content',
      desc: '',
      args: [name],
    );
  }

  /// `Sim`
  String get user_courses_dialog_confirm {
    return Intl.message(
      'Sim',
      name: 'user_courses_dialog_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Não`
  String get user_courses_dialog_cancel {
    return Intl.message(
      'Não',
      name: 'user_courses_dialog_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Login realizado com sucesso`
  String get toast_success_login {
    return Intl.message(
      'Login realizado com sucesso',
      name: 'toast_success_login',
      desc: '',
      args: [],
    );
  }

  /// `Logout realizado com sucesso`
  String get toast_success_logout {
    return Intl.message(
      'Logout realizado com sucesso',
      name: 'toast_success_logout',
      desc: '',
      args: [],
    );
  }

  /// `Curso adicionado com sucesso`
  String get toast_success_add_course {
    return Intl.message(
      'Curso adicionado com sucesso',
      name: 'toast_success_add_course',
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
