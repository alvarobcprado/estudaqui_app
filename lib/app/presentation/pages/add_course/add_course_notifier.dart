import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';
import 'package:faeng_courses/app/domain/use_case/courses/add_course_and_module_uc.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/add_course_models.dart';
import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:faeng_courses/core/error/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addCourseNotifierProvider =
    StateNotifierProvider<AddCourseNotifier, AddCourseState>(
  (ref) {
    final addCourseAndModuleUC = ref.watch(addCourseAndModuleUCProvider);
    return AddCourseNotifier(
      addCourseAndModuleUC: addCourseAndModuleUC,
    );
  },
);

final formBuilderKeyProvider =
    Provider.autoDispose<GlobalKey<FormBuilderState>>((ref) {
  return GlobalKey<FormBuilderState>();
});

class AddCourseNotifier extends StateNotifier<AddCourseState> {
  AddCourseNotifier({
    required AddCourseAndModuleUC addCourseAndModuleUC,
  })  : _addCourseAndModuleUC = addCourseAndModuleUC,
        super(
          const AddCourseState(
            status: AddCourseStatus.loading,
          ),
        );

  final AddCourseAndModuleUC _addCourseAndModuleUC;

  Future<void> validateCurrentFormAndAddCourse(
    GlobalKey<FormBuilderState> formKey,
  ) async {
    state = state.copyWith(status: AddCourseStatus.loading);
    final formSaveResult = formKey.currentState?.saveAndValidate();
    late Either<Failure, CourseModule> eitherResult;

    if (formSaveResult != null && formSaveResult) {
      final formValue = formKey.currentState!.value;
      final courseName = formValue['courseNameField'];
      final courseDescription = formValue['courseDescriptionField'];
      final courseImage = formValue['courseImageField'];
      final courseSubject = formValue['courseSubjectField'];
      const courseModuleName = 'Módulo 1';
      final courseModuleText = formValue['courseModuleTextField'];
      // final courseModuleName = formValue['courseModuleNameField'];
      // final courseModuleText = formValue['courseModuleTextField'];

      final courseToAdd = Course(
        courseId: '',
        creatorId: '',
        subject: courseSubject,
        title: courseName,
        subtitle: courseDescription,
        createdAt: DateTime.now(),
        projectId: '',
        bannerUrl: courseImage,
        updatedAt: DateTime.now(),
      );

      final courseModuleToAdd = CourseModule(
        index: 0,
        moduleId: '',
        courseId: '',
        name: courseModuleName,
        text: courseModuleText,
      );

      eitherResult = await _addCourseAndModuleUC(
        params: AddCourseAndModuleParam(
          courseToAdd: courseToAdd,
          moduleToAdd: courseModuleToAdd,
        ),
      );

      state = eitherResult.fold(
        (l) => state.copyWith(status: AddCourseStatus.error),
        (r) => state.copyWith(status: AddCourseStatus.success),
      );
    }
  }
}
