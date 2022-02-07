import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/common/widgets/error_handler_widget.dart';
import 'package:faeng_courses/app/presentation/pages/home/subject_list/subject_list_models.dart';
import 'package:faeng_courses/app/presentation/pages/home/subject_list/subject_list_notifier.dart';
import 'package:faeng_courses/common/my_route_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(subjectListNotifierProvider);
        switch (state.status) {
          case SubjectListStatus.loading:
            return const CircularProgressIndicator();
          case SubjectListStatus.error:
            return ErrorHandlerWidget(
              onTryAgain: () => ref.refresh(subjectListNotifierProvider),
              child: Text(
                state.failure?.toString() ?? "Algo deu errado",
              ),
            );
          case SubjectListStatus.success:
            return SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: state.subjectList
                    .where((subject) => subject.isActive)
                    .map(
                      (subject) => GestureDetector(
                        onTap: () => Routemaster.of(context).pushCoursesOf(
                          subject.subjectId,
                        ),
                        child: Material(
                          elevation: 5,
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(
                            kMediumBorder,
                          ),
                          child: SizedBox(
                            width: 120,
                            height: 110,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  subject.name.substring(0, 3).toUpperCase(),
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
    );
  }
}
