import 'package:faeng_courses/app/presentation/pages/add_course/subject_dropdown/subjects_dropdown_notifier.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SubjectsDropdownWidget extends StatelessWidget {
  const SubjectsDropdownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final subjectList = ref.watch(subjectDropdownNotifierProvider);
        return FormBuilderDropdown(
          validator: FormBuilderValidators.required(context),
          name: 'courseSubjectField',
          decoration: InputDecoration(
            labelText: S.of(context).add_course_form_subject_field,
          ),
          allowClear: true,
          items: <DropdownMenuItem>[
            for (var subject in subjectList)
              DropdownMenuItem<String>(
                child: Text(subject.name),
                value: subject.subjectId,
              ),
          ],
        );
      },
    );
  }
}
