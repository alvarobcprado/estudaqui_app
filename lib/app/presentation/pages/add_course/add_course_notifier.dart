import 'package:dartz/dartz.dart';
import 'package:faeng_courses/app/domain/entity/course.dart';
import 'package:faeng_courses/app/domain/entity/course_module.dart';
import 'package:faeng_courses/app/domain/use_case/courses/add_course_module_uc.dart';
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
    required AddCourseModuleUC addCourseModuleUC,
  })  : _addCourseUC = addCourseUC,
        _addCourseModuleUC = addCourseModuleUC,
        super(
          const AddCourseState(
            status: AddCourseStatus.loading,
          ),
        );

  final AddCourseUC _addCourseUC;
  final AddCourseModuleUC _addCourseModuleUC;

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
      final courseModuleName = formValue['courseModuleNameField'];
      final courseModuleText = formValue['courseModuleTextField'];

      eitherResult = await _addCourseUC
          .call(
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
      )
          .then(
        (eitherParcial) {
          return eitherParcial.fold(
            (failure) => Left(failure),
            (courseAdded) async {
              final eitherAddModuleResult = await _addCourseModule(
                courseAdded.courseId,
                CourseModule(
                  index: 0,
                  moduleId: '',
                  courseId: '',
                  name: courseModuleName,
                  text: courseModuleText,
                ),
              );
              return eitherAddModuleResult.fold(
                (failure) => Left(failure),
                (success) => Right(success),
              );
            },
          );
        },
      );

      state = eitherResult.fold(
        (l) => state.copyWith(status: AddCourseStatus.error),
        (r) => state.copyWith(status: AddCourseStatus.success),
      );
    }
    state = state.copyWith(status: AddCourseStatus.error);
  }

  Future<Either<Failure, CourseModule>> _addCourseModule(
    String courseId,
    CourseModule courseModule,
  ) async {
    return await _addCourseModuleUC.call(
      params: AddCourseModuleParam(
        courseId: courseId,
        courseModule: courseModule,
      ),
    );
  }
}

final addCourseNotifierProvider =
    StateNotifierProvider<AddCourseNotifier, AddCourseState>(
  (ref) {
    final addCourseUC = ref.watch(addCourseUCProvider);
    final addCourseModuleUC = ref.watch(addCourseModuleUCProvider);
    return AddCourseNotifier(
      addCourseUC: addCourseUC,
      addCourseModuleUC: addCourseModuleUC,
    );
  },
);
