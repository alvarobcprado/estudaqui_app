import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/course_form/course_form_notifier.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CourseForm extends StatelessWidget {
  const CourseForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderTextField(
          validator: FormBuilderValidators.required(context),
          name: 'courseNameField',
          decoration: InputDecoration(
            label: Text(S.of(context).add_course_form_name_field),
          ),
          textInputAction: TextInputAction.next,
        ),
        FormBuilderTextField(
          name: 'courseDescriptionField',
          validator: FormBuilderValidators.required(context),
          decoration: InputDecoration(
            label: Text(S.of(context).add_course_form_description_field),
          ),
          textInputAction: TextInputAction.next,
        ),
        FormBuilderTextField(
          validator: FormBuilderValidators.required(context),
          name: 'courseImageField',
          decoration: InputDecoration(
            label: Text(S.of(context).add_course_form_banner_field),
          ),
          textInputAction: TextInputAction.next,
        ),
        Consumer(
          builder: (context, ref, child) {
            final subjectList = ref.watch(courseFormNotifierProvider);
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
        ),
        const SizedBox(height: kXLargeSpacer),
      ],
    );
  }
}
