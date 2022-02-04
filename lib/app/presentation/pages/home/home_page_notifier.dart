import 'package:faeng_courses/app/domain/use_case/use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:faeng_courses/app/domain/use_case/subject/get_subjects_uc.dart';
import 'package:faeng_courses/app/presentation/pages/home/home_models.dart';
import 'package:faeng_courses/common/providers/use_case/subject_usecase_provider.dart';

class HomePageNotifier extends StateNotifier<HomeState> {
  HomePageNotifier({
    required this.getSubjectsUC,
  }) : super(const HomeState(status: HomeStatus.loading)) {
    getSubjects();
  }

  final GetSubjectsUC getSubjectsUC;

  Future<void> getSubjects() async {
    state = state.copyWith(status: HomeStatus.loading);

    final eitherResult = await getSubjectsUC.call(params: NoParams());

    state = eitherResult.fold(
      (failure) {
        return state.copyWith(status: HomeStatus.error, failure: failure);
      },
      (success) {
        return state.copyWith(status: HomeStatus.success, subjectList: success);
      },
    );
  }
}

final homePageNotifierProvider =
    StateNotifierProvider<HomePageNotifier, HomeState>(
  (ref) {
    final getSubjectsUC = ref.watch(getSubjectsUCProvider);
    return HomePageNotifier(getSubjectsUC: getSubjectsUC);
  },
);
