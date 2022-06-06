// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_BR locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt_BR';

  static String m0(year) => "© ${year} Álvaro Prado";

  static String m1(version) => "Versão ${version}";

  static String m2(date) => "Adicionado em ${date}";

  static String m3(subject) => "Ops, nenhum curso de ${subject} encontrado";

  static String m4(name) => "Olá, ${name}";

  static String m5(length) =>
      "Este campo precisa ter ao menos ${length} caracteres";

  static String m6(name) => "Quer mesmo deletar o curso ${name}?";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add_course_content_button":
            MessageLookupByLibrary.simpleMessage("Adicionar conteúdo"),
        "add_course_content_edit_button":
            MessageLookupByLibrary.simpleMessage("Editar conteúdo"),
        "add_course_content_editor_hint": MessageLookupByLibrary.simpleMessage(
            "Insira o conteúdo do seu curso aqui."),
        "add_course_content_error_button":
            MessageLookupByLibrary.simpleMessage("Corrigir conteúdo"),
        "add_course_content_page_title":
            MessageLookupByLibrary.simpleMessage("Adicionar conteúdo"),
        "add_course_form_banner_field":
            MessageLookupByLibrary.simpleMessage("url do banner / imagem"),
        "add_course_form_description_field":
            MessageLookupByLibrary.simpleMessage("descrição*"),
        "add_course_form_name_field":
            MessageLookupByLibrary.simpleMessage("nome do curso*"),
        "add_course_form_subject_field":
            MessageLookupByLibrary.simpleMessage("matérias*"),
        "add_course_page_title":
            MessageLookupByLibrary.simpleMessage("Adicionar curso"),
        "add_course_save_button":
            MessageLookupByLibrary.simpleMessage("Salvar curso"),
        "add_course_saving_dialog":
            MessageLookupByLibrary.simpleMessage("Salvando curso..."),
        "add_module_text_add_button":
            MessageLookupByLibrary.simpleMessage("Adicionar módulo"),
        "add_module_text_clear_button":
            MessageLookupByLibrary.simpleMessage("Limpar"),
        "add_module_text_dialog_title":
            MessageLookupByLibrary.simpleMessage("Conteúdo do curso"),
        "add_module_text_edit_button":
            MessageLookupByLibrary.simpleMessage("Editar módulo"),
        "add_module_text_save_button":
            MessageLookupByLibrary.simpleMessage("Salvar módulo"),
        "add_picture_dialog_both_filled": MessageLookupByLibrary.simpleMessage(
            "Por favor adicione uma URL válida ou selecione uma imagem, não ambos"),
        "add_picture_dialog_cancel":
            MessageLookupByLibrary.simpleMessage("Cancelar"),
        "add_picture_dialog_empty": MessageLookupByLibrary.simpleMessage(
            "Por favor adicione uma URL válida ou selecione uma imagem"),
        "add_picture_dialog_pick_file":
            MessageLookupByLibrary.simpleMessage("Escolha a imagem"),
        "add_picture_dialog_select_from_files":
            MessageLookupByLibrary.simpleMessage("Selecionar da galeria"),
        "add_picture_dialog_title":
            MessageLookupByLibrary.simpleMessage("Adicionar imagem"),
        "add_video_dialog_cancel":
            MessageLookupByLibrary.simpleMessage("Cancelar"),
        "add_video_dialog_empty": MessageLookupByLibrary.simpleMessage(
            "Por favor adicione uma URL válida"),
        "add_video_dialog_title":
            MessageLookupByLibrary.simpleMessage("Adicionar vídeo"),
        "app_info_copyrigth": m0,
        "app_info_name": MessageLookupByLibrary.simpleMessage("Estudaqui"),
        "app_info_page_title":
            MessageLookupByLibrary.simpleMessage("Sobre o App"),
        "app_info_text": MessageLookupByLibrary.simpleMessage(
            "Aplicativo desenvolvido como parte dos requisitos necessários para a aprovação na disciplina de Trabalho de conclusão de curso, sob orientação da Prof.ª Drª. Gracyeli Guarienti"),
        "app_info_version": m1,
        "auth_form_email_field_label":
            MessageLookupByLibrary.simpleMessage("seu@email.com"),
        "auth_form_forgot_password":
            MessageLookupByLibrary.simpleMessage("esqueceu sua senha?"),
        "auth_form_name_field_label":
            MessageLookupByLibrary.simpleMessage("seu nome"),
        "auth_form_password_field_label":
            MessageLookupByLibrary.simpleMessage("senha"),
        "auth_form_select_signin":
            MessageLookupByLibrary.simpleMessage("entrar"),
        "auth_form_select_signup":
            MessageLookupByLibrary.simpleMessage("cadastrar"),
        "auth_form_signin_button":
            MessageLookupByLibrary.simpleMessage("Entrar"),
        "auth_form_signup_button":
            MessageLookupByLibrary.simpleMessage("Cadastrar"),
        "auth_form_title": MessageLookupByLibrary.simpleMessage("Estudaqui"),
        "cancel_course_creation_dialog_body":
            MessageLookupByLibrary.simpleMessage(
                "Você quer mesmo cancelar a criação do curso?"),
        "cancel_course_creation_dialog_cancel":
            MessageLookupByLibrary.simpleMessage("Não"),
        "cancel_course_creation_dialog_confirm":
            MessageLookupByLibrary.simpleMessage("Sim"),
        "cancel_course_creation_dialog_title":
            MessageLookupByLibrary.simpleMessage("Cancelar criação de curso"),
        "course_list_date_added": m2,
        "course_list_empty_state_button":
            MessageLookupByLibrary.simpleMessage("Buscar novamente"),
        "course_list_empty_state_message": m3,
        "default_course_author":
            MessageLookupByLibrary.simpleMessage("Desconhecido"),
        "default_error_dialog_body": MessageLookupByLibrary.simpleMessage(
            "Por favor, tente novamente mais tarde"),
        "default_error_dialog_button":
            MessageLookupByLibrary.simpleMessage("Fechar"),
        "default_error_dialog_title":
            MessageLookupByLibrary.simpleMessage("Algo deu errado"),
        "default_loading_dialog_text":
            MessageLookupByLibrary.simpleMessage("Carregando..."),
        "drawer_header_authenticated_title": m4,
        "drawer_header_unauthenticated_title":
            MessageLookupByLibrary.simpleMessage("Estudaqui"),
        "drawer_options_add_course":
            MessageLookupByLibrary.simpleMessage("Adicionar curso"),
        "drawer_options_app_info":
            MessageLookupByLibrary.simpleMessage("Sobre o app"),
        "drawer_options_home":
            MessageLookupByLibrary.simpleMessage("Tela inicial"),
        "drawer_options_signin": MessageLookupByLibrary.simpleMessage("Entrar"),
        "drawer_options_signout": MessageLookupByLibrary.simpleMessage("Sair"),
        "drawer_options_test":
            MessageLookupByLibrary.simpleMessage("Página teste"),
        "edit_course_page_title":
            MessageLookupByLibrary.simpleMessage("Editar curso"),
        "error_default_message":
            MessageLookupByLibrary.simpleMessage("Ops, algo deu errado"),
        "error_default_try_again_message":
            MessageLookupByLibrary.simpleMessage("Tentar novamente"),
        "form_error_text_min_length_field": m5,
        "form_error_text_required_field": MessageLookupByLibrary.simpleMessage(
            "Este campo não pode ser vazio"),
        "form_error_valid_email_field": MessageLookupByLibrary.simpleMessage(
            "Este campo precisa de um e-mail válido"),
        "home_greeting_user": MessageLookupByLibrary.simpleMessage("Olá "),
        "home_grid_all_courses": MessageLookupByLibrary.simpleMessage("TODAS"),
        "home_latest_courses_section":
            MessageLookupByLibrary.simpleMessage("Últimos cursos adicionados"),
        "home_page_title": MessageLookupByLibrary.simpleMessage("FaEng Cursos"),
        "home_subjects_section":
            MessageLookupByLibrary.simpleMessage("Matérias"),
        "home_welcome_message": MessageLookupByLibrary.simpleMessage(
            "Bem-vindo(a) ao Estudaqui,\nseu lugar de aprendizado."),
        "project_title":
            MessageLookupByLibrary.simpleMessage("Flutter Boilerplate"),
        "subject_list_title": MessageLookupByLibrary.simpleMessage("Matérias"),
        "toast_success_add_course": MessageLookupByLibrary.simpleMessage(
            "Curso adicionado com sucesso"),
        "toast_success_login":
            MessageLookupByLibrary.simpleMessage("Login realizado com sucesso"),
        "toast_success_logout": MessageLookupByLibrary.simpleMessage(
            "Logout realizado com sucesso"),
        "user_courses_dialog_cancel":
            MessageLookupByLibrary.simpleMessage("Não"),
        "user_courses_dialog_confirm":
            MessageLookupByLibrary.simpleMessage("Sim"),
        "user_courses_dialog_content": m6,
        "user_courses_dialog_title":
            MessageLookupByLibrary.simpleMessage("Confirmar deleção")
      };
}
