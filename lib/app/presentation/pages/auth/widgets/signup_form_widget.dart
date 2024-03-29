import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/common/widgets/my_form_field.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          MyFormField(
            prefixIcon: Icons.person_outline,
            labelText: S.of(context).auth_form_name_field_label,
            fieldName: 'nameField',
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  context,
                  errorText: S.of(context).form_error_text_required_field,
                ),
              ],
            ),
          ),
          const SizedBox(height: kMediumNumber),
          MyFormField(
            prefixIcon: Icons.email_outlined,
            labelText: S.of(context).auth_form_email_field_label,
            fieldName: 'emailField',
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  context,
                  errorText: S.of(context).form_error_text_required_field,
                ),
                FormBuilderValidators.email(
                  context,
                  errorText: S.of(context).form_error_valid_email_field,
                ),
              ],
            ),
          ),
          const SizedBox(height: kMediumNumber),
          MyFormField(
            prefixIcon: Icons.lock_outlined,
            labelText: S.of(context).auth_form_password_field_label,
            shouldObfuscateField: true,
            fieldName: 'passwordField',
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  context,
                  errorText: S.of(context).form_error_text_required_field,
                ),
                FormBuilderValidators.minLength(
                  context,
                  6,
                  errorText: S.of(context).form_error_text_min_length_field(6),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
