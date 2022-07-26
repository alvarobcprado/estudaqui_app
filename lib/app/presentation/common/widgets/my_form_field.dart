import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef MyFormValidator = String? Function(String?)?;

class MyFormField extends StatefulWidget {
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
    this.controller,
  }) : super(key: key);

  final String labelText;
  final String fieldName;
  final MyFormValidator validator;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final Color? backgroundColor;
  final Color? labelColor;
  final bool? hasBackground;
  final bool? shouldObfuscateField;

  @override
  State<MyFormField> createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {
  late bool _isHiddenField;

  @override
  void initState() {
    super.initState();
    _isHiddenField = widget.shouldObfuscateField!;
  }

  void _changeFieldVisibility() {
    setState(() {
      _isHiddenField = !_isHiddenField;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _colors = ref.watch(themeProvider).colors;
      return FormBuilderTextField(
        cursorColor: widget.labelColor ?? _colors.authFormTextColor,
        name: widget.fieldName,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: _isHiddenField,
        textInputAction: TextInputAction.next,
        style: TextStyle(color: widget.labelColor ?? _colors.authFormTextColor),
        decoration: InputDecoration(
          suffixIcon: !widget.shouldObfuscateField!
              ? null
              : GestureDetector(
                  onTap: _changeFieldVisibility,
                  child: Icon(
                    _isHiddenField ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
          contentPadding: const EdgeInsets.all(kMediumNumber),
          labelStyle: TextStyle(
            color: widget.labelColor?.withOpacity(0.75) ??
                _colors.authFormTextColor.withOpacity(0.75),
            fontWeight: FontWeight.w500,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(kSmallNumber),
            ),
          ),
          labelText: widget.labelText,
          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                  color: widget.labelColor ?? _colors.authFormTextColor,
                )
              : null,
          fillColor: widget.backgroundColor ?? _colors.authFormBackground,
          filled: widget.hasBackground ?? true,
        ),
        validator: widget.validator,
      );
    });
  }
}
