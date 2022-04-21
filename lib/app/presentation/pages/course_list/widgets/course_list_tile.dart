import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/presentation/common/extesions/date_time_format.dart';
import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/pages/course_list/widgets/course_author_row.dart';
import 'package:faeng_courses/app/presentation/pages/course_list/widgets/course_card_image.dart';
import 'package:faeng_courses/app/presentation/pages/course_list/widgets/course_info_column.dart';
import 'package:faeng_courses/core/common/my_route_map.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourseListTile extends StatelessWidget {
  const CourseListTile({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kMediumNumber),
      height: 120,
      child: InkWell(
        borderRadius: BorderRadius.circular(kSmallNumber),
        onTap: () {
          GoRouter.of(context).pushCourseDetail(
            course.subject,
            course.title,
            course.courseId,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CourseCardImage(
              subjectName: course.subject,
              courseBannerUrl: course.bannerUrl,
            ),
            const SizedBox(width: kMediumNumber),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CourseAuthorRow(authorName: course.creatorName),
                  CourseInfoColumn(
                    courseName: course.title,
                    courseDescription: course.subtitle,
                    courseDate: course.createdAt.toLocalFormatString(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
