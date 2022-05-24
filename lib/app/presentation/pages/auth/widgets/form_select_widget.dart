import 'package:estudaqui/app/presentation/common/theme/my_theme.dart';
import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/pages/auth/auth_page.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';

class FormSelectWidget extends StatefulWidget {
  const FormSelectWidget({
    Key? key,
    required this.colors,
    required this.onSwitch,
  }) : super(key: key);

  final MyColors colors;
  final void Function(AuthMode) onSwitch;

  @override
  State<FormSelectWidget> createState() => _FormSelectWidgetState();
}

class _FormSelectWidgetState extends State<FormSelectWidget> {
  final List<bool> _isSelected = [true, false];

  void switchButton(int index) {
    for (var button = 0; button < _isSelected.length; button++) {
      if (button == index) {
        _isSelected[button] = true;
      } else {
        _isSelected[button] = false;
      }
    }
    if (index == 0) {
      widget.onSwitch(AuthMode.signIn);
    } else {
      widget.onSwitch(AuthMode.signUp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kXLargeNumber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ToggleButtons(
            isSelected: _isSelected,
            borderRadius: BorderRadius.circular(kSmallNumber),
            renderBorder: false,
            onPressed: (index) {
              setState(() => switchButton(index));
            },
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMediumNumber),
                child: Text(
                  S.of(context).auth_form_select_signin,
                  style: TextStyle(color: widget.colors.secondaryVariantColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMediumNumber),
                child: Text(
                  S.of(context).auth_form_select_signup,
                  style:
                      TextStyle(color: widget.colors.primaryVariantLightColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
