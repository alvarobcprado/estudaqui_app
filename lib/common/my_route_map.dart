import 'package:faeng_courses/app/presentation/pages/add_course/add_course_page.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/module_form/module_text_dialog.dart';
import 'package:faeng_courses/app/presentation/pages/auth/auth_page.dart';
import 'package:faeng_courses/app/presentation/pages/course_detail/course_detail_page.dart';
import 'package:faeng_courses/app/presentation/pages/course_list/course_list_page.dart';
import 'package:faeng_courses/app/presentation/pages/home/home_page.dart';
import 'package:faeng_courses/app/presentation/pages/not_found/not_found_page.dart';
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

/// courses/:subject
const _courseListPath = 'courses/:subject';

/// :course-name
const _courseDetailPath = ':course';

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
                  path: 'add_course',
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
                        child: const ModuleTextDialog(),
                      ),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'courses/:subject',
                  name: _courseListPath,
                  pageBuilder: (context, state) {
                    final subject = state.params['subject'];
                    return MaterialPage(
                      key: state.pageKey,
                      child: CourseListPage(
                        subject: subject ?? '',
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
              ],
            ),
          ],
        );
}

extension MyPageRoutes on GoRouter {
  void pushLogin() => pushNamed(_loginPath);
  void pushHome() => pushNamed(_homePath);
  void pushTest() => pushNamed(_notFoundPath);
  void pushAddCourse() => pushNamed(_addCourseInfoPath);
  void pushAddModuleText() => pushNamed(_addCourseContentPath);
  void pushCoursesOf(String subject) => pushNamed(
        _courseListPath,
        params: {
          'subject': subject,
        },
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

  void replaceWithHome() => goNamed(_homePath);
  void replaceWithNotFound() => goNamed(_notFoundPath);
}
