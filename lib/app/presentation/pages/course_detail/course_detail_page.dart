import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({
    Key? key,
    required this.courseId,
  }) : super(key: key);

  final String courseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: Find a best way to add the course name
        title: Text(courseId),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return const Center(
            child: Text('CourseDetailPage'),
          );
        },
      ),
    );
  }
}
