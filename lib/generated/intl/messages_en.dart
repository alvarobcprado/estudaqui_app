// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "forgot_password_modal_email_field_label":
            MessageLookupByLibrary.simpleMessage("E-mail"),
        "forgot_password_modal_error_toast":
            MessageLookupByLibrary.simpleMessage(
                "Ocorreu um erro ao enviar o e-mail. Por favor tente novamente"),
        "forgot_password_modal_send_button":
            MessageLookupByLibrary.simpleMessage("Enviar"),
        "forgot_password_modal_success_toast": MessageLookupByLibrary.simpleMessage(
            "E-mail de recuperação enviado com sucesso. Por favor verifique seu e-mail"),
        "forgot_password_modal_title":
            MessageLookupByLibrary.simpleMessage("Recuperação de senha"),
        "project_title":
            MessageLookupByLibrary.simpleMessage("Flutter Boilerplate")
      };
}
