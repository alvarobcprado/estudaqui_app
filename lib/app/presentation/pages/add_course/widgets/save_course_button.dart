import 'package:estudaqui/app/presentation/common/widgets/my_button.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';

class SaveCourseButton extends StatelessWidget {
  const SaveCourseButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: MyButton(
          hasExpandedWidth: true,
          onPressed: onPressed,
          text: S.of(context).add_course_save_button,
        ),
      ),
    );
  }
}
