import 'package:faeng_courses/app/presentation/common/widgets/error_handler_widget.dart';
import 'package:faeng_courses/app/presentation/pages/course_detail/course_detail_page_notifier.dart';
import 'package:faeng_courses/app/presentation/pages/course_detail/course_detail_models.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({
    Key? key,
    required this.courseId,
    required this.courseName,
  }) : super(key: key);

  final String courseId;
  final String courseName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          courseName.replaceAll('+', ' '),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(courseDetailNotifierProvider(courseId));
          switch (state.status) {
            case CourseDetailStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CourseDetailStatus.error:
              return ErrorHandlerWidget(
                onTryAgain: () => ref.refresh(
                  courseDetailNotifierProvider(courseId),
                ),
                child: Text(state.failure?.toString() ??
                    S.of(context).error_default_message),
              );
            case CourseDetailStatus.success:
              return Center(
                child: Text(state.moduleList.first.text),
              );
          }
        },
      ),
    );
  }
}
