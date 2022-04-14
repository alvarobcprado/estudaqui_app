import 'package:faeng_courses/app/presentation/common/utils/constants.dart';
import 'package:faeng_courses/app/presentation/common/widgets/action_handler.dart';
import 'package:faeng_courses/app/presentation/common/widgets/dialogs.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/add_course_notifier.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/state/add_course_state.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/widgets/course_content_field_button.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/widgets/course_info_fields.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/widgets/save_course_button.dart';
import 'package:faeng_courses/core/common/my_route_map.dart';
import 'package:faeng_courses/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddCoursePage extends ConsumerStatefulWidget {
  const AddCoursePage({Key? key}) : super(key: key);

  @override
  ConsumerState<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends ConsumerState<AddCoursePage> {
  bool isLoading = false;
  late final GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  void onAddCourse() {
    GoRouter.of(context).replaceWithHome();
  }

  void onAddCourseError(String? title, String? reason) async {
    await DialogHandler.showAlertDialog(
      context,
      title: title,
      body: reason,
    );
  }

  void onAddingCourse() async {
    await DialogHandler.showLoadingDialog(
      context,
      loadingText: S.of(context).add_course_saving_dialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ActionHandler<AddCourseState>(
        actionProvider: addCourseNotifierProvider,
        onReceived: (oldState, newState) {
          oldState?.whenOrNull(
            loading: () => Navigator.of(context).pop(),
          );
          newState.whenOrNull(
            loading: onAddingCourse,
            error: onAddCourseError,
            success: onAddCourse,
          );
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Text(S.of(context).add_course_page_title),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kLargeNumber,
                  vertical: kMediumNumber,
                ),
                child: FormBuilder(
                  autoFocusOnValidationFailure: true,
                  key: _formKey,
                  child: Column(
                    children: [
                      const CourseInfoFields(),
                      const CourseContentFieldButton(),
                      const SizedBox(
                        height: kMediumNumber,
                      ),
                      SaveCourseButton(
                        onPressed: () => ref
                            .read(addCourseNotifierProvider.notifier)
                            .validateCurrentFormAndAddCourse(_formKey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
