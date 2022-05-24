import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/domain/entity/course.dart';
import 'package:estudaqui/app/domain/entity/course_module.dart';
import 'package:estudaqui/app/domain/entity/subject.dart';
import 'package:estudaqui/app/domain/use_case/authentication/get_current_user_uc.dart';
import 'package:estudaqui/app/domain/use_case/courses/add_course_and_module_uc.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/app/presentation/pages/add_course/models/add_course_form_model.dart';
import 'package:estudaqui/app/presentation/pages/add_course/state/add_course_state.dart';
import 'package:estudaqui/core/common/general_providers.dart';
import 'package:estudaqui/core/common/providers/use_case/subject_usecase_provider.dart';
import 'package:estudaqui/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addCourseNotifierProvider =
    StateNotifierProvider<AddCourseNotifier, AddCourseState>(
  (ref) {
    final addCourseAndModuleUC = ref.watch(addCourseAndModuleUCProvider);
    final getCurrentUserUC = ref.watch(getCurrentUserUCProvider);
    return AddCourseNotifier(
      addCourseAndModuleUC: addCourseAndModuleUC,
      getCurrentUserUC: getCurrentUserUC,
    );
  },
);

final formBuilderKeyProvider =
    Provider.autoDispose<GlobalKey<FormBuilderState>>(
  (ref) {
    return GlobalKey<FormBuilderState>();
  },
);

final _getSubjectsProvider = FutureProvider<List<Subject>>(
  (ref) async {
    final getSubjectsUC = ref.watch(getSubjectsUCProvider);
    final eitherResult = await getSubjectsUC.call(params: NoParams());
    return eitherResult.fold((failure) => [], (success) => success);
  },
);

final courseSubjectsProvider = StateProvider.autoDispose<List<Subject>>(
  (ref) {
    final asyncSubjects = ref.watch(_getSubjectsProvider);
    return asyncSubjects.when(
      data: (subjects) => subjects,
      error: (_, __) => [],
      loading: () => [],
    );
  },
);

final courseContentProvider = StateProvider.autoDispose<String?>(
  (ref) {
    return null;
  },
);

class AddCourseNotifier extends StateNotifier<AddCourseState> {
  AddCourseNotifier({
    required AddCourseAndModuleUC addCourseAndModuleUC,
    required GetCurrentUserUC getCurrentUserUC,
  })  : _addCourseAndModuleUC = addCourseAndModuleUC,
        _getCurrentUserUC = getCurrentUserUC,
        super(const AddCourseState.initial());

  final AddCourseAndModuleUC _addCourseAndModuleUC;
  final GetCurrentUserUC _getCurrentUserUC;

  bool _validateCurrentForm(GlobalKey<FormBuilderState> formKey) {
    final formSaveResult = formKey.currentState?.saveAndValidate();
    return formSaveResult != null && formSaveResult;
  }

  Future<User?> _getUser() async {
    final eitherCurrentUser = await _getCurrentUserUC(params: NoParams());

    final currentUser = eitherCurrentUser.fold(
      (l) => null,
      (user) {
        return user.isAnonymous ? null : user;
      },
    );
    return currentUser;
  }

  Future<void> validateCurrentFormAndAddCourse(
    GlobalKey<FormBuilderState> formKey,
  ) async {
    state = const AddCourseState.loading();
    late Either<Failure, CourseModule> eitherResult;

    if (_validateCurrentForm(formKey)) {
      final formValue = formKey.currentState!.value;

      final courseFormInfos = AddCourseFormModel.fromJson(formValue);
      final user = await _getUser();

      final courseToAdd = Course(
        courseId: '',
        creatorId: user?.uid ?? '',
        creatorName: user?.displayName ?? '',
        subject: courseFormInfos.courseSubject,
        title: courseFormInfos.courseName,
        subtitle: courseFormInfos.courseDescription,
        createdAt: DateTime.now(),
        projectId: '',
        bannerUrl: courseFormInfos.courseImage,
        updatedAt: DateTime.now(),
      );

      final courseModuleToAdd = CourseModule(
        index: 0,
        moduleId: '',
        courseId: '',
        name: 'Módulo 1',
        text: courseFormInfos.courseContent,
      );

      eitherResult = await _addCourseAndModuleUC(
        params: AddCourseAndModuleParam(
          courseToAdd: courseToAdd,
          moduleToAdd: courseModuleToAdd,
        ),
      );

      state = eitherResult.fold(
        (l) => AddCourseState.error(errorTitle: l.title, errorBody: l.message),
        (r) => const AddCourseState.success(),
      );
    }
    state = const AddCourseState.error(
      errorTitle: 'Problema ao adicionar curso',
      errorBody: 'Por favor, verifique os campos do formulário x.x',
    );
  }
}
