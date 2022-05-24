import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/common/widgets/my_dropdown_field.dart';
import 'package:estudaqui/app/presentation/common/widgets/my_form_field.dart';
import 'package:estudaqui/app/presentation/pages/add_course/add_course_notifier.dart';
import 'package:estudaqui/app/presentation/pages/add_course/utils/form_field_constants.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CourseInfoFields extends ConsumerWidget {
  const CourseInfoFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider).colors;
    final backgroundColor = colors.primaryColor.withOpacity(0.2);
    final textColor = colors.primaryColor;

    return Column(
      children: [
        MyFormField(
          labelText: S.of(context).add_course_form_name_field,
          fieldName: FormFieldNames.courseName.name,
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(
                context,
                errorText: S.of(context).form_error_text_required_field,
              ),
              FormBuilderValidators.minLength(
                context,
                2,
                errorText: S.of(context).form_error_text_min_length_field(2),
              ),
            ],
          ),
          prefixIcon: null,
          backgroundColor: backgroundColor,
          labelColor: textColor,
        ),
        const SizedBox(height: kMediumNumber),
        MyFormField(
          labelText: S.of(context).add_course_form_description_field,
          fieldName: FormFieldNames.courseDescription.name,
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(
                context,
                errorText: S.of(context).form_error_text_required_field,
              ),
              FormBuilderValidators.minLength(
                context,
                2,
                errorText: S.of(context).form_error_text_min_length_field(2),
              ),
            ],
          ),
          prefixIcon: null,
          backgroundColor: backgroundColor,
          labelColor: textColor,
        ),
        const SizedBox(height: kMediumNumber),
        MyFormField(
          labelText: S.of(context).add_course_form_banner_field,
          fieldName: FormFieldNames.courseImage.name,
          validator: null,
          prefixIcon: null,
          backgroundColor: backgroundColor,
          labelColor: textColor,
        ),
        const SizedBox(height: kMediumNumber),
        Consumer(
          builder: (context, ref, child) {
            final subjectList = ref.watch(courseSubjectsProvider);
            return MyDropdownField(
              subjectList: subjectList,
              fieldName: FormFieldNames.courseSubject.name,
              labelText: S.of(context).add_course_form_subject_field,
              validator: FormBuilderValidators.required(
                context,
                errorText: S.of(context).form_error_text_required_field,
              ),
              backgroundColor: backgroundColor,
              labelColor: textColor,
              items: <DropdownMenuItem>[
                for (var subject in subjectList)
                  DropdownMenuItem<String>(
                    child: Text(
                      subject.name,
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                    value: subject.subjectId,
                  ),
              ],
            );
          },
        ),
        const SizedBox(height: kMediumNumber),
      ],
    );
  }
}
