import 'package:faeng_courses/app/presentation/pages/add_course/module_form/module_form_notifier.dart';
import 'package:faeng_courses/core/common/my_route_map.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class ModuleForm extends StatelessWidget {
  const ModuleForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TODO: Enhance Module Text Input
              FormBuilderField<String>(
                name: 'courseModuleTextField',
                validator: FormBuilderValidators.required(context),
                builder: (field) {
                  return Consumer(
                    builder: (context, ref, child) {
                      ref.listen<String?>(
                        moduleTextProvider,
                        (oldText, newText) {
                          if (oldText != newText) {
                            field.didChange(newText);
                          }
                        },
                      );
                      return InputDecorator(
                        decoration: InputDecoration(
                          errorText: field.errorText,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () =>
                                GoRouter.of(context).pushAddModuleText(),
                            child: Text(
                              field.isValid
                                  ? S.of(context).add_module_text_edit_button
                                  : S.of(context).add_module_text_add_button,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
