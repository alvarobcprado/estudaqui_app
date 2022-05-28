// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'course_module_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourseModuleFormModel _$CourseModuleFormModelFromJson(
    Map<String, dynamic> json) {
  return _CourseModuleFormModel.fromJson(json);
}

/// @nodoc
class _$CourseModuleFormModelTearOff {
  const _$CourseModuleFormModelTearOff();

  _CourseModuleFormModel call(
      {int index = 0,
      String moduleId = '',
      String courseId = '',
      String moduleName = 'Módulo 1',
      required String courseContent}) {
    return _CourseModuleFormModel(
      index: index,
      moduleId: moduleId,
      courseId: courseId,
      moduleName: moduleName,
      courseContent: courseContent,
    );
  }

  CourseModuleFormModel fromJson(Map<String, Object?> json) {
    return CourseModuleFormModel.fromJson(json);
  }
}

/// @nodoc
const $CourseModuleFormModel = _$CourseModuleFormModelTearOff();

/// @nodoc
mixin _$CourseModuleFormModel {
  int get index => throw _privateConstructorUsedError;
  String get moduleId => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  String get moduleName => throw _privateConstructorUsedError;
  String get courseContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseModuleFormModelCopyWith<CourseModuleFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseModuleFormModelCopyWith<$Res> {
  factory $CourseModuleFormModelCopyWith(CourseModuleFormModel value,
          $Res Function(CourseModuleFormModel) then) =
      _$CourseModuleFormModelCopyWithImpl<$Res>;
  $Res call(
      {int index,
      String moduleId,
      String courseId,
      String moduleName,
      String courseContent});
}

/// @nodoc
class _$CourseModuleFormModelCopyWithImpl<$Res>
    implements $CourseModuleFormModelCopyWith<$Res> {
  _$CourseModuleFormModelCopyWithImpl(this._value, this._then);

  final CourseModuleFormModel _value;
  // ignore: unused_field
  final $Res Function(CourseModuleFormModel) _then;

  @override
  $Res call({
    Object? index = freezed,
    Object? moduleId = freezed,
    Object? courseId = freezed,
    Object? moduleName = freezed,
    Object? courseContent = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      moduleId: moduleId == freezed
          ? _value.moduleId
          : moduleId // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      moduleName: moduleName == freezed
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String,
      courseContent: courseContent == freezed
          ? _value.courseContent
          : courseContent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CourseModuleFormModelCopyWith<$Res>
    implements $CourseModuleFormModelCopyWith<$Res> {
  factory _$CourseModuleFormModelCopyWith(_CourseModuleFormModel value,
          $Res Function(_CourseModuleFormModel) then) =
      __$CourseModuleFormModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int index,
      String moduleId,
      String courseId,
      String moduleName,
      String courseContent});
}

/// @nodoc
class __$CourseModuleFormModelCopyWithImpl<$Res>
    extends _$CourseModuleFormModelCopyWithImpl<$Res>
    implements _$CourseModuleFormModelCopyWith<$Res> {
  __$CourseModuleFormModelCopyWithImpl(_CourseModuleFormModel _value,
      $Res Function(_CourseModuleFormModel) _then)
      : super(_value, (v) => _then(v as _CourseModuleFormModel));

  @override
  _CourseModuleFormModel get _value => super._value as _CourseModuleFormModel;

  @override
  $Res call({
    Object? index = freezed,
    Object? moduleId = freezed,
    Object? courseId = freezed,
    Object? moduleName = freezed,
    Object? courseContent = freezed,
  }) {
    return _then(_CourseModuleFormModel(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      moduleId: moduleId == freezed
          ? _value.moduleId
          : moduleId // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      moduleName: moduleName == freezed
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String,
      courseContent: courseContent == freezed
          ? _value.courseContent
          : courseContent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourseModuleFormModel implements _CourseModuleFormModel {
  _$_CourseModuleFormModel(
      {this.index = 0,
      this.moduleId = '',
      this.courseId = '',
      this.moduleName = 'Módulo 1',
      required this.courseContent});

  factory _$_CourseModuleFormModel.fromJson(Map<String, dynamic> json) =>
      _$$_CourseModuleFormModelFromJson(json);

  @JsonKey()
  @override
  final int index;
  @JsonKey()
  @override
  final String moduleId;
  @JsonKey()
  @override
  final String courseId;
  @JsonKey()
  @override
  final String moduleName;
  @override
  final String courseContent;

  @override
  String toString() {
    return 'CourseModuleFormModel(index: $index, moduleId: $moduleId, courseId: $courseId, moduleName: $moduleName, courseContent: $courseContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseModuleFormModel &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.moduleId, moduleId) &&
            const DeepCollectionEquality().equals(other.courseId, courseId) &&
            const DeepCollectionEquality()
                .equals(other.moduleName, moduleName) &&
            const DeepCollectionEquality()
                .equals(other.courseContent, courseContent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(moduleId),
      const DeepCollectionEquality().hash(courseId),
      const DeepCollectionEquality().hash(moduleName),
      const DeepCollectionEquality().hash(courseContent));

  @JsonKey(ignore: true)
  @override
  _$CourseModuleFormModelCopyWith<_CourseModuleFormModel> get copyWith =>
      __$CourseModuleFormModelCopyWithImpl<_CourseModuleFormModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseModuleFormModelToJson(this);
  }
}

abstract class _CourseModuleFormModel implements CourseModuleFormModel {
  factory _CourseModuleFormModel(
      {int index,
      String moduleId,
      String courseId,
      String moduleName,
      required String courseContent}) = _$_CourseModuleFormModel;

  factory _CourseModuleFormModel.fromJson(Map<String, dynamic> json) =
      _$_CourseModuleFormModel.fromJson;

  @override
  int get index;
  @override
  String get moduleId;
  @override
  String get courseId;
  @override
  String get moduleName;
  @override
  String get courseContent;
  @override
  @JsonKey(ignore: true)
  _$CourseModuleFormModelCopyWith<_CourseModuleFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}
