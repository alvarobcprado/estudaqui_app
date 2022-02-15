import 'package:faeng_courses/common/my_route_map.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:routemaster/routemaster.dart';

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
              Text(S.of(context).add_course_modules_title('')),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: const Divider(
                  thickness: 5,
                ),
              ),
              FormBuilderTextField(
                validator: FormBuilderValidators.required(context),
                name: 'courseModuleNameField',
                decoration: InputDecoration(
                  label: Text(S.of(context).add_course_module_name_field),
                ),
                textInputAction: TextInputAction.next,
              ),
              // TODO: Enhance Module Text Input
              Consumer(
                builder: (context, ref, child) {
                  return GestureDetector(
                    onTap: () => Routemaster.of(context).pushAddModuleText(),
                    child: FormBuilderTextField(
                      validator: FormBuilderValidators.required(context),
                      name: 'courseModuleTextField',
                      decoration: InputDecoration(
                        label: Text(S.of(context).add_course_module_text_field),
                      ),
                      enabled: false,
                      readOnly: true,
                    ),
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
