import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/common/general_providers.dart';
import 'package:faeng_courses/core/error/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:faeng_courses/app/domain/use_case/courses/add_course_uc.dart';
import 'package:faeng_courses/app/presentation/pages/add_course/add_course_models.dart';

class AddCourseNotifier extends StateNotifier<AddCourseState> {
  AddCourseNotifier({
    required AddCourseUC addCourseUC,
  })  : _addCourseUC = addCourseUC,
        super(
          const AddCourseState(
            status: AddCourseStatus.loading,
          ),
        );

  final AddCourseUC _addCourseUC;

  Future<void> validateCurrentFormAndAddCourse(
    GlobalKey<FormBuilderState> formKey,
  ) async {
    state = state.copyWith(status: AddCourseStatus.loading);
    final formSaveResult = formKey.currentState?.saveAndValidate();
    late Either<Failure, Course> eitherResult;

    if (formSaveResult != null && formSaveResult) {
      final formValue = formKey.currentState!.value;
      final courseName = formValue['courseNameField'];
      final courseDescription = formValue['courseDescriptionField'];
      final courseImage = formValue['courseImageField'];
      final courseSubject = formValue['courseSubjectField'];

      eitherResult = await _addCourseUC.call(
        params: AddCourseParam(
          course: Course(
            courseId: '',
            creatorId: '',
            subject: courseSubject,
            title: courseName,
            subtitle: courseDescription,
            createdAt: DateTime.now(),
            projectId: '',
            bannerUrl: courseImage,
            updatedAt: DateTime.now(),
          ),
        ),
      );

      state = eitherResult.fold(
        (failure) => state.copyWith(
          status: AddCourseStatus.error,
          failure: failure,
        ),
        (success) => state.copyWith(
          status: AddCourseStatus.success,
        ),
      );
    }
    state = state.copyWith(status: AddCourseStatus.error);
  }
}

final addCourseNotifierProvider =
    StateNotifierProvider<AddCourseNotifier, AddCourseState>(
  (ref) {
    final addCourseUC = ref.watch(addCourseUCProvider);
    return AddCourseNotifier(addCourseUC: addCourseUC);
  },
);
