import 'package:faeng_courses/app/presentation/pages/base/base_page.dart';
import 'package:faeng_courses/app/presentation/pages/course_detail/course_detail_page.dart';
import 'package:faeng_courses/app/presentation/pages/course_list/course_list_page.dart';
import 'package:faeng_courses/app/presentation/pages/home/home_page.dart';
import 'package:faeng_courses/app/presentation/pages/login/login_page.dart';
import 'package:faeng_courses/app/presentation/pages/not_found/not_found_page.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

const _basePath = '/';
const _homePath = '${_basePath}home';
const _courseListPathWithoutParam = '${_basePath}courses';
const _courseListPathWithParam = '${_basePath}courses/:subject';
const _courseDetailPath = '$_courseListPathWithParam/detail';
const _loginPath = '${_basePath}login';
const _notFoundPath = '${_basePath}not-found';

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
            _homePath: (_) => const MaterialPage(
                  name: 'Home',
                  child: HomePage(),
                ),
            _courseListPathWithParam: (routeData) => MaterialPage(
                  name: 'Course List',
                  child: CourseListPage(
                    subject: routeData.pathParameters['subject'] ?? '',
                  ),
                ),
            _courseDetailPath: (routeData) {
              final queryParam = routeData.queryParameters['id'];
              return MaterialPage(
                name: 'Course Detail',
                child: CourseDetailPage(
                  courseId: queryParam!,
                ),
              );
            },
            _loginPath: (_) => const MaterialPage(
                  name: 'Login',
                  child: LoginPage(),
                ),
            _notFoundPath: (_) => const MaterialPage(
                  name: 'Page not Found',
                  child: NotFoundPage(),
                ),
          },
        );
}

extension MyPageRoutes on Routemaster {
  void pushLogin() => push(_loginPath);
  void pushHome() => push(_homePath);
  void pushTest() => push(_notFoundPath);
  void pushCoursesOf(String subject) => push(
        '$_courseListPathWithoutParam/$subject',
      );
  void pushAllCourses() => push('$_courseListPathWithoutParam/all');
  void pushCourseDetail(String courseName, String courseId) => push(
        'detail',
        queryParameters: {
          'id': courseId,
        },
      );

  void replaceWithHome() => replace(_homePath);
  void replaceWithNotFound() => replace(_notFoundPath);
}
