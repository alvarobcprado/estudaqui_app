import 'package:faeng_courses/app/presentation/pages/home/home_page.dart';
import 'package:faeng_courses/app/presentation/pages/not_found/not_found_page.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

const _homePath = '/';
const _notFoundPath = '${_homePath}not-found';

class MyRouteMap extends RouteMap {
  MyRouteMap()
      : super(
          routes: {
            _homePath: (_) => const MaterialPage(
                  name: 'Home',
                  child: HomePage(),
                ),
            _notFoundPath: (_) => const MaterialPage(
                  name: 'Page not Found',
                  child: NotFoundPage(),
                ),
          },
        );
}
