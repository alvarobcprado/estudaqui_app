import 'package:faeng_courses/app/domain/entity/subject.dart';
import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/core/common/providers/theme_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef MyDropdownValidator = String? Function(dynamic)?;

class MyDropdownField extends ConsumerWidget {
  const MyDropdownField({
    Key? key,
    required this.labelText,
    required this.fieldName,
    required this.validator,
    required this.items,
    this.prefixIcon,
    this.backgroundColor,
    this.labelColor,
    this.hasBackground,
    this.shouldObfuscateField = false,
    required this.subjectList,
  }) : super(key: key);

  final String labelText;
  final String fieldName;
  final MyDropdownValidator validator;
  final List<DropdownMenuItem> items;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final Color? labelColor;
  final bool? hasBackground;
  final bool? shouldObfuscateField;
  final List<Subject> subjectList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider).colors;
    return FormBuilderDropdown(
      validator: validator,
      autofocus: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: fieldName,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: kMediumNumber),
        labelStyle: TextStyle(
          color: labelColor?.withOpacity(0.75) ??
              colors.authFormTextColor.withOpacity(0.75),
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
                color: labelColor ?? colors.authFormTextColor,
              )
            : null,
        fillColor: backgroundColor ?? colors.authFormBackground,
        filled: hasBackground ?? true,
      ),
      allowClear: true,
      items: items,
    );
  }
}
