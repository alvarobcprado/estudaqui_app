import 'package:faeng_courses/app/presentation/pages/add_course/add_course_page.dart';
import 'package:faeng_courses/app/presentation/pages/base/base_page.dart';
import 'package:faeng_courses/app/presentation/pages/course_detail/course_detail_page.dart';
import 'package:faeng_courses/app/presentation/pages/course_list/course_list_page.dart';
import 'package:faeng_courses/app/presentation/pages/home/home_page.dart';
import 'package:faeng_courses/app/presentation/pages/login/login_page.dart';
import 'package:faeng_courses/app/presentation/pages/not_found/not_found_page.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

const _basePath = '/';
const _notFoundPath = '${_basePath}not-found';
const _homePath = '${_basePath}home';
const _loginPath = '${_basePath}login';
const _addCoursePath = '${_basePath}add-course';
const _courseListPathWithoutParam = '${_basePath}courses';
const _courseListPathWithParam = '${_basePath}courses/:subject';
const _courseDetailPath = '$_courseListPathWithParam/detail';

class MyRouteMap extends RouteMap {
  MyRouteMap()
      : super(
          onUnknownRoute: (_) => const Redirect(_notFoundPath),
          routes: {
            _basePath: (_) => const IndexedPage(
                  child: BasePage(),
                  paths: [
                    _homePath,
                    _notFoundPath,
                  ],
                ),
            _notFoundPath: (_) => const MaterialPage(
                  name: 'Page not Found',
                  child: NotFoundPage(),
                ),
            _homePath: (_) => const MaterialPage(
                  name: 'Home',
                  child: HomePage(),
                ),
            _loginPath: (_) => const MaterialPage(
                  name: 'Login',
                  child: LoginPage(),
                ),
            _addCoursePath: (_) => const MaterialPage(
                  name: 'Add course',
                  child: AddCoursePage(),
                ),
            _courseListPathWithParam: (routeData) => MaterialPage(
                  name: 'Course List',
                  child: CourseListPage(
                    subject: routeData.pathParameters['subject'] ?? '',
                  ),
                ),
            _courseDetailPath: (routeData) {
              final queryIdParam = routeData.queryParameters['id'];
              final queryNameParam = routeData.queryParameters['course'];
              return MaterialPage(
                name: 'Course Detail',
                child: CourseDetailPage(
                  courseId: queryIdParam!,
                  courseName: queryNameParam!,
                ),
              );
            },
          },
        );
}

extension MyPageRoutes on Routemaster {
  void pushLogin() => push(_loginPath);
  void pushHome() => push(_homePath);
  void pushTest() => push(_notFoundPath);
  void pushAddCourse() => push(_addCoursePath);
  void pushCoursesOf(String subject) => push(
        '$_courseListPathWithoutParam/$subject',
      );
  void pushAllCourses() => push('$_courseListPathWithoutParam/all');
  void pushCourseDetail(String courseName, String courseId) => push(
        'detail',
        queryParameters: {
          'course': courseName.replaceAll(' ', '+'),
          'id': courseId,
        },
      );

  void replaceWithHome() => replace(_homePath);
  void replaceWithNotFound() => replace(_notFoundPath);
}
