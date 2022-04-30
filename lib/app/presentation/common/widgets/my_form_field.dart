import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/core/common/general_providers.dart';
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
    this.prefixIcon,
    this.backgroundColor,
    this.labelColor,
    this.hasBackground,
    this.shouldObfuscateField = false,
  }) : super(key: key);

  final String labelText;
  final String fieldName;
  final MyFormValidator validator;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final Color? labelColor;
  final bool? hasBackground;
  final bool? shouldObfuscateField;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _colors = ref.watch(themeProvider).colors;
    return FormBuilderTextField(
      cursorColor: labelColor ?? _colors.authFormTextColor,
      name: fieldName,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: shouldObfuscateField!,
      textInputAction: TextInputAction.next,
      style: TextStyle(color: labelColor ?? _colors.authFormTextColor),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(kMediumNumber),
        labelStyle: TextStyle(
          color: labelColor?.withOpacity(0.75) ??
              _colors.authFormTextColor.withOpacity(0.75),
          fontWeight: FontWeight.w500,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(kSmallNumber),
          ),
        ),
        labelText: labelText,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: labelColor ?? _colors.authFormTextColor,
              )
            : null,
        fillColor: backgroundColor ?? _colors.authFormBackground,
        filled: hasBackground ?? true,
      ),
      validator: validator,
    );
  }
}
