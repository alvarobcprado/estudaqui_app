import 'package:faeng_courses/app/presentation/common/utils/mappers.dart';
import 'package:faeng_courses/app/presentation/pages/course_list/course_list_models.dart';
import 'package:faeng_courses/app/presentation/pages/course_list/course_list_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({
    required this.subject,
    Key? key,
  }) : super(key: key);

  final String subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: Find a best way to implement the subjectName
        title: Text(subject.trySubjectName()),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(courseListNotifierProvider(subject));

          switch (state.status) {
            case CourseListStatus.initial:
              return Container();
            case CourseListStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CourseListStatus.error:
              return const Center(
                child: Text('Error'),
              );
            case CourseListStatus.success:
              return ListView.builder(
                itemCount: state.courses.length,
                itemBuilder: (context, index) {
                  final course = state.courses[index];
                  return ListTile(
                    // TODO: Implement the course navigation
                    onTap: () {},
                    title: Text(course.title),
                    subtitle: Text(course.subtitle),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
