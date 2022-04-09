import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/pages/home/widgets/courses_carousel_item.dart';
import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:faeng_courses/core/common/my_route_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LatestCoursesCarousel extends ConsumerStatefulWidget {
  const LatestCoursesCarousel({
    Key? key,
    required this.courseList,
  }) : super(key: key);

  final List<Course> courseList;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LatestCoursesCarouselState();
}

class _LatestCoursesCarouselState extends ConsumerState<LatestCoursesCarousel> {
  late final ScrollController _carouselCtrl;
  late double _currentIndex;
  List<Course> get courseList => widget.courseList;

  void onTapNext() {
    if (_currentIndex < courseList.length) {
      _currentIndex++;
      _carouselCtrl.animateTo(
        _currentIndex * 96,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
    }
  }

  void onTapBack() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _carouselCtrl.animateTo(
        _currentIndex * 96,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _carouselCtrl = ScrollController();
    _currentIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _carouselCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = ref.watch(themeProvider).colors;
    return Row(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: onTapBack,
            child: Icon(
              Icons.keyboard_arrow_left,
              color: colors.secondaryVariantColor,
              size: kXLargeNumber,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: _carouselCtrl,
            scrollDirection: Axis.horizontal,
            itemCount: courseList.length,
            itemBuilder: (context, index) {
              final course = courseList[index];
              return CoursesCarouselItem(
                courseName: course.title,
                onPressed: () => GoRouter.of(context).pushCourseDetail(
                  course.subject,
                  course.title,
                  course.courseId,
                ),
              );
            },
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: onTapNext,
            child: Icon(
              Icons.keyboard_arrow_right,
              color: colors.secondaryVariantColor,
              size: kXLargeNumber,
            ),
          ),
        ),
      ],
    );
  }
}
