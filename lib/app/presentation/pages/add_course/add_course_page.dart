import 'package:estudaqui/app/presentation/common/utils/constants.dart';
import 'package:estudaqui/app/presentation/common/widgets/action_handler.dart';
import 'package:estudaqui/app/presentation/common/widgets/dialogs.dart';
import 'package:estudaqui/app/presentation/pages/add_course/add_course_notifier.dart';
import 'package:estudaqui/app/presentation/pages/add_course/models/edit_course_form_model.dart';
import 'package:estudaqui/app/presentation/pages/add_course/state/add_course_state.dart';
import 'package:estudaqui/app/presentation/pages/add_course/widgets/course_content_field_button.dart';
import 'package:estudaqui/app/presentation/pages/add_course/widgets/course_info_fields.dart';
import 'package:estudaqui/app/presentation/pages/add_course/widgets/save_course_button.dart';
import 'package:estudaqui/core/common/my_route_map.dart';
import 'package:estudaqui/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class AddCoursePage extends ConsumerStatefulWidget {
  const AddCoursePage({Key? key, this.courseToEdit}) : super(key: key);

  final EditCourseFormModel? courseToEdit;

  @override
  ConsumerState<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends ConsumerState<AddCoursePage> {
  bool isLoading = false;
  late final GlobalKey<FormBuilderState> _formKey;

  EditCourseFormModel? get courseToEdit => widget.courseToEdit;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormBuilderState>();

    // TODO: Refact later
    if (courseToEdit != null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          ref.read(courseContentProvider.state).update(
                (state) =>
                    state = courseToEdit?.courseModuleToAdd.courseContent,
              );
        },
      );
    }
  }

  void onAddCourse() {
    Fluttertoast.showToast(msg: S.of(context).toast_success_add_course);
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

  // TODO: Refact later
  Map<String, dynamic> getInitialFormValue() {
    final formMap = <String, dynamic>{};
    if (widget.courseToEdit != null) {
      formMap.addAll(widget.courseToEdit?.courseToAdd.toJson() ?? {});
      formMap.addAll(widget.courseToEdit?.courseModuleToAdd.toJson() ?? {});
    }
    return formMap;
  }

  Future<bool> onWillPop(BuildContext context) async {
    final result = await DialogHandler.showAlertDialog<bool>(
      context,
      title: courseToEdit == null
          ? S.of(context).cancel_course_creation_dialog_title
          : S.of(context).cancel_course_edition_dialog_title,
      body: courseToEdit == null
          ? S.of(context).cancel_course_creation_dialog_body
          : S.of(context).cancel_course_edition_dialog_body,
      actions: [
        TextButton.icon(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          icon: const Icon(Icons.clear),
          label: Text(S.of(context).cancel_course_creation_dialog_cancel),
        ),
        TextButton.icon(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          icon: const Icon(Icons.check),
          label: Text(S.of(context).cancel_course_creation_dialog_confirm),
        ),
      ],
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => onWillPop(context),
      child: Scaffold(
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
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                title: Text(
                  courseToEdit == null
                      ? S.of(context).add_course_page_title
                      : S.of(context).edit_course_page_title,
                ),
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
                    initialValue: getInitialFormValue(),
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
                              .validateCurrentFormAndSaveCourse(
                                _formKey,
                                widget.courseToEdit,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
