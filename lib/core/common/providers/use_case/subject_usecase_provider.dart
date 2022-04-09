import 'package:faeng_courses/app/domain/use_case/subject/get_subject_by_id_uc.dart';
import 'package:faeng_courses/app/domain/use_case/subject/get_subjects_uc.dart';
import 'package:faeng_courses/core/common/general_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getSubjectsUCProvider = Provider<GetSubjectsUC>(
  (ref) {
    final subjectsRepository = ref.watch(subjectsRepositoryProvider);
    return GetSubjectsUC(subjectsRepository: subjectsRepository);
  },
);

final getSubjectByIdUCProvider = Provider<GetSubjectByIdUC>(
  (ref) {
    final subjectsRepository = ref.watch(subjectsRepositoryProvider);
    return GetSubjectByIdUC(subjectDataRepository: subjectsRepository);
  },
);
