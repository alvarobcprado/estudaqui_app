import 'package:faeng_courses/app/domain/entity/subject.dart';
import 'package:faeng_courses/app/domain/use_case/subject/get_subjects_uc.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/core/common/providers/use_case/subject_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseFormNotifier extends StateNotifier<List<Subject>> {
  CourseFormNotifier({
    required GetSubjectsUC getSubjectsUC,
  })  : _getSubjectsUC = getSubjectsUC,
        super([]) {
    getSubjectList();
  }

  final GetSubjectsUC _getSubjectsUC;

  Future<void> getSubjectList() async {
    final eitherResult = await _getSubjectsUC.call(params: NoParams());

    state = eitherResult.fold((failure) => [], (success) => success);
  }
}

final courseFormNotifierProvider =
    StateNotifierProvider.autoDispose<CourseFormNotifier, List<Subject>>(
  (ref) {
    final GetSubjectsUC getSubjectsUC = ref.watch(getSubjectsUCProvider);

    return CourseFormNotifier(getSubjectsUC: getSubjectsUC);
  },
);
