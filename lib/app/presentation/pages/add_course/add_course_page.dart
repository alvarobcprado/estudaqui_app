import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCoursePage extends StatelessWidget {
  const AddCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).add_course_page_title),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return const Center(
            child: Text('Add course page'),
          );
        },
      ),
    );
  }
}
