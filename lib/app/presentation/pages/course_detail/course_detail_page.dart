import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/common/widgets/unexpected_state_widget.dart';
import 'package:faeng_courses/app/presentation/pages/course_detail/course_detail_page_notifier.dart';
import 'package:faeng_courses/app/presentation/pages/course_detail/widgets/course_content_view.dart';
import 'package:faeng_courses/app/presentation/pages/course_detail/widgets/course_presentation.dart';
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
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kMediumNumber,
                vertical: kSmallNumber,
              ),
              child: Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(
                    courseDetailNotifierProvider(courseId),
                  );

                  return state.maybeWhen(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    success: (course, courseContent) {
                      final content = courseContent.text;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: kSmallNumber,
                            ),
                            child: CoursePresentation(
                              course: course,
                            ),
                          ),
                          CourseContentView(
                            content: content,
                          ),
                        ],
                      );
                    },
                    orElse: () => UnexpectedStateWidget(
                      onTryAgain: () => ref.refresh(
                        courseDetailNotifierProvider(courseId),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
