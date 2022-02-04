import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/pages/home/home_models.dart';
import 'package:faeng_courses/app/presentation/pages/home/home_page_notifier.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              child: Card(
                color: Colors.grey.shade200,
                elevation: 3.0,
                child: const Center(
                  child: Text('Texto inicial temporário'),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(homePageNotifierProvider);
                switch (state.status) {
                  case HomeStatus.loading:
                    return const CircularProgressIndicator();
                  case HomeStatus.error:
                    return Center(
                      child: Text(
                        state.failure.toString(),
                      ),
                    );
                  case HomeStatus.success:
                    return SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        children: state.subjectList
                            .where((subject) => subject.isActive)
                            .map(
                              (subject) => GestureDetector(
                                onTap: () =>
                                    Routemaster.of(context).pushCoursesOf(
                                  subject.subjectId,
                                ),
                                child: SizedBox(
                                  width: 125,
                                  height: 100,
                                  child: Card(
                                    color: Colors.grey.shade200,
                                    elevation: 3.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          subject.name
                                              .substring(0, 3)
                                              .toUpperCase(),
                                        ),
                                        Text(
                                          subject.description,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
