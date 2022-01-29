import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:faeng_courses/common/my_route_map.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text('home page'),
            ),
            TextButton(
              onPressed: () =>
                  Routemaster.of(context).pushCoursesOf('portuguese'),
              child: const Text('Go to Math courses'),
            ),
            TextButton(
              onPressed: () => Routemaster.of(context).pushAllCourses(),
              child: const Text('Go to All courses'),
            ),
          ],
        );
      },
    );
  }
}
