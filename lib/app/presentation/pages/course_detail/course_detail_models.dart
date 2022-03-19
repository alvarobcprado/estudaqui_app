import 'package:faeng_courses/app/domain/entity/course_module.dart';
import 'package:faeng_courses/core/error/failure.dart';

enum CourseDetailStatus { loading, error, success }

class CourseDetailState {
  CourseDetailState({
    this.status = CourseDetailStatus.loading,
    this.moduleList = const <CourseModule>[],
    this.currentModule,
    this.failure,
  });
  final CourseDetailStatus status;
  final List<CourseModule> moduleList;
  final int? currentModule;
  final Failure? failure;

  CourseDetailState copyWith({
    String? courseName,
    CourseDetailStatus? status,
    List<CourseModule>? moduleList,
    int? currentModule,
    Failure? failure,
  }) {
    return CourseDetailState(
      status: status ?? this.status,
      moduleList: moduleList ?? this.moduleList,
      currentModule: currentModule ?? this.currentModule,
      failure: failure ?? this.failure,
    );
  }
}
