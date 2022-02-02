import 'package:faeng_courses/app/presentation/pages/course_detail/course_detail_page_notifier.dart';
import 'package:faeng_courses/app/presentation/pages/course_detail/couse_detail_models.dart';
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
              return const Center(
                child: Text('Error'),
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
