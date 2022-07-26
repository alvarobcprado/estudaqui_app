import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/common/widgets/my_form_field.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({
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
            fieldName: 'passwordField',
            shouldObfuscateField: true,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  context,
                  errorText: S.of(context).form_error_text_required_field,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
