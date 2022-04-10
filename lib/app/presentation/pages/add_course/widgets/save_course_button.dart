import 'package:faeng_courses/app/presentation/common/widgets/my_button.dart';
import 'package:faeng_courses/generated/l10n.dart';
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
          text: S.of(context).save_course_button,
        ),
      ),
    );
  }
}
