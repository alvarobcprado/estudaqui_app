import 'package:faeng_courses/app/domain/use_case/subject/get_subjects_uc.dart';
import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:faeng_courses/app/presentation/pages/home/subject_list/subject_list_models.dart';
import 'package:faeng_courses/common/providers/use_case/subject_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubjectListNotifier extends StateNotifier<SubjectListState> {
  SubjectListNotifier({
    required this.getSubjectsUC,
  }) : super(const SubjectListState(status: SubjectListStatus.loading)) {
    getSubjects();
  }

  final GetSubjectsUC getSubjectsUC;

  Future<void> getSubjects() async {
    state = state.copyWith(status: SubjectListStatus.loading);

    final eitherResult = await getSubjectsUC.call(params: NoParams());

    state = eitherResult.fold(
      (failure) {
        return state.copyWith(
            status: SubjectListStatus.error, failure: failure);
      },
      (success) {
        if (success.isEmpty) {
          return state.copyWith(status: SubjectListStatus.error);
        }
        return state.copyWith(
            status: SubjectListStatus.success, subjectList: success);
      },
    );
  }
}

final subjectListNotifierProvider =
    StateNotifierProvider<SubjectListNotifier, SubjectListState>(
  (ref) {
    final getSubjectsUC = ref.watch(getSubjectsUCProvider);
    return SubjectListNotifier(getSubjectsUC: getSubjectsUC);
  },
);
