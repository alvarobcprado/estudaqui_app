import 'package:faeng_courses/common/my_route_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final myRoutesProvider = Provider<GoRouter>(
  (ref) {
    return MyRouteMap();
  },
);
