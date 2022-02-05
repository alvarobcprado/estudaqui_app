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

  static String m0(name) => "Olá, ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "drawer_header_authenticated_title": m0,
        "drawer_header_unauthenticated_title":
            MessageLookupByLibrary.simpleMessage("FaEng Cursos"),
        "drawer_options_signin": MessageLookupByLibrary.simpleMessage("Entrar"),
        "drawer_options_signout": MessageLookupByLibrary.simpleMessage("Sair"),
        "home_page_welcome_message":
            MessageLookupByLibrary.simpleMessage("Uma grande mensagem"),
        "home_page_welcome_title":
            MessageLookupByLibrary.simpleMessage("Bem vindo tal tal tal"),
        "login_container_email_field_hint":
            MessageLookupByLibrary.simpleMessage("Insira seu e-mail"),
        "login_container_email_field_label":
            MessageLookupByLibrary.simpleMessage("E-mail"),
        "login_container_password_field_hint":
            MessageLookupByLibrary.simpleMessage("Digite sua senha"),
        "login_container_password_field_label":
            MessageLookupByLibrary.simpleMessage("Senha"),
        "login_container_signin_button":
            MessageLookupByLibrary.simpleMessage("Entrar"),
        "login_container_title":
            MessageLookupByLibrary.simpleMessage("FaEng Cursos"),
        "project_title":
            MessageLookupByLibrary.simpleMessage("Flutter Boilerplate"),
        "subject_list_title": MessageLookupByLibrary.simpleMessage("Matérias")
      };
}
