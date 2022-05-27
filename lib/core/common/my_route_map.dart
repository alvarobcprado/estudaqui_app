import 'package:estudaqui/app/presentation/pages/add_course/add_course_content/add_course_content_page.dart';
import 'package:estudaqui/app/presentation/pages/add_course/add_course_page.dart';
import 'package:estudaqui/app/presentation/pages/app_info/app_info_page.dart';
import 'package:estudaqui/app/presentation/pages/auth/auth_page.dart';
import 'package:estudaqui/app/presentation/pages/course_detail/course_detail_page.dart';
import 'package:estudaqui/app/presentation/pages/course_list/course_list_page.dart';
import 'package:estudaqui/app/presentation/pages/home/home_page.dart';
import 'package:estudaqui/app/presentation/pages/not_found/not_found_page.dart';
import 'package:estudaqui/app/presentation/pages/user_courses/user_courses_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// not-found
const _notFoundPath = 'not-found';

/// home
const _homePath = 'home';

/// login
const _loginPath = 'login';

/// add-course
const _addCourseInfoPath = 'add-course';

/// content
const _addCourseContentPath = 'content';

/// my-courses
const _myCoursesPath = 'my-courses';

/// courses/:subject
const _courseListPath = 'courses/:subject';

/// :course-name
const _courseDetailPath = ':course';

/// app-info
const _appInfoPath = 'app-info';

class MyRouteMap extends GoRouter {
  MyRouteMap()
      : super(
          debugLogDiagnostics: true,
          errorPageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const NotFoundPage(),
          ),
          routes: [
            GoRoute(
              path: '/',
              name: _homePath,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                child: const HomePage(),
              ),
              routes: [
                GoRoute(
                  path: 'login',
                  name: _loginPath,
                  pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    child: const AuthPage(),
                  ),
                ),
                GoRoute(
                  path: 'add-course',
                  name: _addCourseInfoPath,
                  pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    child: const AddCoursePage(),
                  ),
                  routes: [
                    GoRoute(
                      path: 'content',
                      name: _addCourseContentPath,
                      pageBuilder: (context, state) => MaterialPage(
                        key: state.pageKey,
                        child: const AddCourseContentDialog(),
                      ),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'my-courses',
                  name: _myCoursesPath,
                  pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    child: const UserCourseListPage(),
                  ),
                ),
                GoRoute(
                  path: 'courses/:subject',
                  name: _courseListPath,
                  pageBuilder: (context, state) {
                    final subjectId = state.params['subject'];
                    final subjectName = state.extra as String?;
                    return MaterialPage(
                      key: state.pageKey,
                      child: CourseListPage(
                        listId: subjectId ?? '',
                        listName: subjectName ?? '',
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: ':course',
                      name: _courseDetailPath,
                      pageBuilder: (context, state) {
                        final courseName = state.params['course'];
                        final courseId = state.queryParams['id'];
                        return MaterialPage(
                          key: state.pageKey,
                          child: CourseDetailPage(
                            courseId: courseId!,
                            courseName: courseName!,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                GoRoute(
                  path: 'app-info',
                  name: _appInfoPath,
                  pageBuilder: (context, state) {
                    return const MaterialPage(
                      child: AppInfoPage(),
                    );
                  },
                ),
              ],
            ),
          ],
        );
}

extension MyPageRoutes on GoRouter {
  void pushAppInfo() => pushNamed(_appInfoPath);
  void pushLogin() => pushNamed(_loginPath);
  void pushHome() => pushNamed(_homePath);
  void pushTest() => pushNamed(_notFoundPath);
  void pushAddCourse() => pushNamed(_addCourseInfoPath);
  void pushAddCourseContent() => pushNamed(_addCourseContentPath);
  void pushCoursesOf(String subjectId, String subjectName) => pushNamed(
        _courseListPath,
        params: {
          'subject': subjectId,
        },
        extra: subjectName,
      );
  void pushCourseDetail(
    String courseSubject,
    String courseName,
    String courseId,
  ) {
    pushNamed(
      _courseDetailPath,
      params: {
        'subject': courseSubject,
        'course': courseName,
      },
      queryParams: {
        'id': courseId,
      },
    );
  }

  void pushUserCourses() => pushNamed(_myCoursesPath);

  void pushAllCourses() => pushNamed(
        _courseListPath,
        params: {
          'subject': 'all',
        },
        extra: 'Cursos',
      );

  void replaceWithHome() => goNamed(_homePath);
  void replaceWithNotFound() => goNamed(_notFoundPath);
}
