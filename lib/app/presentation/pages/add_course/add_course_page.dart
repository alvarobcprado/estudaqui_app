import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/common/widgets/action_handler.dart';
import 'package:faeng_courses/app/presentation/common/widgets/loading_widget.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/add_course_models.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/add_course_notifier.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/course_form/course_form.dart';
import 'package:faeng_courses/common/my_route_map.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({Key? key}) : super(key: key);

  @override
  State<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).add_course_page_title),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return ActionHandler<AddCourseState>(
            ref: ref,
            actionProvider: addCourseNotifierProvider,
            onReceived: (_, newState) {
              switch (newState.status) {
                case AddCourseStatus.loading:
                  setState(() => isLoading = true);
                  break;
                case AddCourseStatus.error:
                  // TODO: Add error handler
                  setState(() => isLoading = false);
                  break;
                case AddCourseStatus.success:
                  setState(() => isLoading = false);
                  Routemaster.of(context).replaceWithHome();
                  break;
              }
            },
            child: LoadingWidget(
              isLoading: isLoading,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: kSmallPadding,
                    horizontal: kMediumPadding,
                  ),
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        const CourseForm(),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(S.of(context).add_course_modules_title('')),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: const Divider(
                                  thickness: 5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            ref
                                .read(addCourseNotifierProvider.notifier)
                                .validateCurrentFormAndAddCourse(_formKey);
                          },
                          child: const Text('Criar curso'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
