import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef MyFormValidator = String? Function(String?)?;

class MyFormField extends ConsumerWidget {
  const MyFormField({
    Key? key,
    required this.labelText,
    required this.fieldName,
    required this.validator,
    required this.prefixIcon,
    this.backgroundColor,
    this.labelColor,
    this.hasBackground,
    this.shouldObfuscateField = false,
  }) : super(key: key);

  final String labelText;
  final String fieldName;
  final MyFormValidator validator;
  final IconData prefixIcon;
  final Color? backgroundColor;
  final Color? labelColor;
  final bool? hasBackground;
  final bool? shouldObfuscateField;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _colors = ref.watch(themeProvider).colors;
    return FormBuilderTextField(
      name: fieldName,
      obscureText: shouldObfuscateField!,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: kMediumNumber),
        labelStyle: TextStyle(
          color: labelColor?.withOpacity(0.80) ??
              _colors.authFormTextColor.withOpacity(0.80),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(kSmallNumber),
          ),
        ),
        labelText: labelText,
        prefixIcon: Icon(
          prefixIcon,
          color: labelColor ?? _colors.authFormTextColor,
        ),
        fillColor: backgroundColor ?? _colors.authFormBackground,
        filled: hasBackground ?? true,
      ),
      validator: validator,
    );
  }
}
