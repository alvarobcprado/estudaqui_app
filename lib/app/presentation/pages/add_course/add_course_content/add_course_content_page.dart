import 'package:faeng_courses/app/presentation/pages/add_course/add_course_content/widgets/sliver_html_editor.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddCourseContentDialog extends StatelessWidget {
  const AddCourseContentDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
            ),
            floating: true,
            title: Text(S.of(context).add_course_content_page_title),
            actions: [
              IconButton(
                icon: const Icon(Icons.save),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          SliverHtmlEditor(),
        ],
      ),
    );
  }
}
