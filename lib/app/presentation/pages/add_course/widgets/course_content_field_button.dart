import 'package:estudaqui/app/presentation/common/widgets/my_button.dart';
import 'package:estudaqui/app/presentation/pages/add_course/add_course_notifier.dart';
import 'package:estudaqui/app/presentation/pages/add_course/utils/form_field_constants.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:estudaqui/core/common/my_route_map.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class CourseContentFieldButton extends ConsumerWidget {
  const CourseContentFieldButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider).colors;
    return FormBuilderField<String>(
      name: FormFieldNames.courseContent.name,
      validator: FormBuilderValidators.required(
        context,
        errorText: S.of(context).form_error_text_required_field,
      ),
      builder: (field) {
        return Consumer(
          builder: (context, ref, child) {
            ref.listen<String?>(
              courseContentProvider,
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
                child: MyButton(
                  onPressed: () => GoRouter.of(context).pushAddCourseContent(),
                  textColor: field.isValid ? colors.primaryColor : colors.white,
                  backgrounColor: field.hasError
                      ? colors.errorColor
                      : field.isValid
                          ? colors.secondaryVariantColor
                          : colors.primaryColor,
                  text: field.hasError
                      ? S.of(context).add_course_content_error_button
                      : field.isValid
                          ? S.of(context).add_course_content_edit_button
                          : S.of(context).add_course_content_button,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
