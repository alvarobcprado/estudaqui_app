import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/presentation/common/extensions/date_time_format.dart';
import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/common/utils/responsive.dart';
import 'package:estudaqui/app/presentation/common/widgets/dialogs.dart';
import 'package:estudaqui/app/presentation/pages/course_list/widgets/course_author_row.dart';
import 'package:estudaqui/app/presentation/pages/course_list/widgets/course_card_image.dart';
import 'package:estudaqui/app/presentation/pages/course_list/widgets/course_info_column.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:estudaqui/core/common/my_route_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserCourseListTile extends StatelessWidget {
  const UserCourseListTile({
    Key? key,
    required this.course,
    required this.onDeleteTap,
    required this.onEditTap,
  }) : super(key: key);

  final Course course;
  final VoidCallback onDeleteTap;
  final VoidCallback onEditTap;

  void _onDeleteTap(BuildContext context) async {
    await DialogHandler.showAlertDialog<bool>(
      context,
      title: 'Confirmar deleção',
      body: 'Quer mesmo deletar o curso ${course.title}?',
      actions: [
        TextButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.clear),
          label: const Text('Não'),
        ),
        TextButton.icon(
          onPressed: () {
            onDeleteTap.call();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.check),
          label: const Text('Sim'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isPortrait(context) ? 310 / 150 : 610 / 140,
      child: Container(
        margin: const EdgeInsets.only(bottom: kMediumNumber),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CourseCardImage(
                subjectName: course.subject,
                courseBannerUrl: course.bannerUrl,
              ),
              const SizedBox(width: kMediumNumber),
              Expanded(
                child: SingleChildScrollView(
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
              ),
              Consumer(builder: (context, ref, _) {
                final colors = ref.watch(themeProvider).colors;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: onEditTap,
                      padding: const EdgeInsets.all(kSmallNumber / 2),
                      splashRadius: kLargeNumber,
                      constraints: const BoxConstraints(),
                      icon: Icon(
                        Icons.edit,
                        color: colors.secondaryVariantColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () => _onDeleteTap(context),
                      padding: const EdgeInsets.all(kSmallNumber / 2),
                      splashRadius: kLargeNumber,
                      constraints: const BoxConstraints(),
                      icon: Icon(
                        Icons.delete,
                        color: colors.errorColor,
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
