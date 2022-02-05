import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/pages/home/home_models.dart';
import 'package:faeng_courses/app/presentation/pages/home/home_page_notifier.dart';
import 'package:faeng_courses/generated/l10n.dart';
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
            Material(
              elevation: 5,
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(kMediumBorder),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).home_page_welcome_title),
                    Text(S.of(context).home_page_welcome_message),
                  ],
                ),
              ),
            ),
            const SizedBox(height: kLargeSpacer),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).subject_list_title),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: const Divider(thickness: 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: kSmallSpacer),
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
                        alignment: WrapAlignment.spaceBetween,
                        children: state.subjectList
                            .where((subject) => subject.isActive)
                            .map(
                              (subject) => GestureDetector(
                                onTap: () =>
                                    Routemaster.of(context).pushCoursesOf(
                                  subject.subjectId,
                                ),
                                child: Material(
                                  elevation: 5,
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(
                                    kMediumBorder,
                                  ),
                                  child: SizedBox(
                                    width: 125,
                                    height: 110,
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
