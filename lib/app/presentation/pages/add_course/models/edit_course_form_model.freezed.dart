// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_course_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EditCourseFormModel _$EditCourseFormModelFromJson(Map<String, dynamic> json) {
  return _EditCourseFormModel.fromJson(json);
}

/// @nodoc
class _$EditCourseFormModelTearOff {
  const _$EditCourseFormModelTearOff();

  _EditCourseFormModel call(
      {required CourseFormModel courseToAdd,
      required CourseModuleFormModel courseModuleToAdd}) {
    return _EditCourseFormModel(
      courseToAdd: courseToAdd,
      courseModuleToAdd: courseModuleToAdd,
    );
  }

  EditCourseFormModel fromJson(Map<String, Object?> json) {
    return EditCourseFormModel.fromJson(json);
  }
}

/// @nodoc
const $EditCourseFormModel = _$EditCourseFormModelTearOff();

/// @nodoc
mixin _$EditCourseFormModel {
  CourseFormModel get courseToAdd => throw _privateConstructorUsedError;
  CourseModuleFormModel get courseModuleToAdd =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditCourseFormModelCopyWith<EditCourseFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditCourseFormModelCopyWith<$Res> {
  factory $EditCourseFormModelCopyWith(
          EditCourseFormModel value, $Res Function(EditCourseFormModel) then) =
      _$EditCourseFormModelCopyWithImpl<$Res>;
  $Res call(
      {CourseFormModel courseToAdd, CourseModuleFormModel courseModuleToAdd});

  $CourseFormModelCopyWith<$Res> get courseToAdd;
  $CourseModuleFormModelCopyWith<$Res> get courseModuleToAdd;
}

/// @nodoc
class _$EditCourseFormModelCopyWithImpl<$Res>
    implements $EditCourseFormModelCopyWith<$Res> {
  _$EditCourseFormModelCopyWithImpl(this._value, this._then);

  final EditCourseFormModel _value;
  // ignore: unused_field
  final $Res Function(EditCourseFormModel) _then;

  @override
  $Res call({
    Object? courseToAdd = freezed,
    Object? courseModuleToAdd = freezed,
  }) {
    return _then(_value.copyWith(
      courseToAdd: courseToAdd == freezed
          ? _value.courseToAdd
          : courseToAdd // ignore: cast_nullable_to_non_nullable
              as CourseFormModel,
      courseModuleToAdd: courseModuleToAdd == freezed
          ? _value.courseModuleToAdd
          : courseModuleToAdd // ignore: cast_nullable_to_non_nullable
              as CourseModuleFormModel,
    ));
  }

  @override
  $CourseFormModelCopyWith<$Res> get courseToAdd {
    return $CourseFormModelCopyWith<$Res>(_value.courseToAdd, (value) {
      return _then(_value.copyWith(courseToAdd: value));
    });
  }

  @override
  $CourseModuleFormModelCopyWith<$Res> get courseModuleToAdd {
    return $CourseModuleFormModelCopyWith<$Res>(_value.courseModuleToAdd,
        (value) {
      return _then(_value.copyWith(courseModuleToAdd: value));
    });
  }
}

/// @nodoc
abstract class _$EditCourseFormModelCopyWith<$Res>
    implements $EditCourseFormModelCopyWith<$Res> {
  factory _$EditCourseFormModelCopyWith(_EditCourseFormModel value,
          $Res Function(_EditCourseFormModel) then) =
      __$EditCourseFormModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {CourseFormModel courseToAdd, CourseModuleFormModel courseModuleToAdd});

  @override
  $CourseFormModelCopyWith<$Res> get courseToAdd;
  @override
  $CourseModuleFormModelCopyWith<$Res> get courseModuleToAdd;
}

/// @nodoc
class __$EditCourseFormModelCopyWithImpl<$Res>
    extends _$EditCourseFormModelCopyWithImpl<$Res>
    implements _$EditCourseFormModelCopyWith<$Res> {
  __$EditCourseFormModelCopyWithImpl(
      _EditCourseFormModel _value, $Res Function(_EditCourseFormModel) _then)
      : super(_value, (v) => _then(v as _EditCourseFormModel));

  @override
  _EditCourseFormModel get _value => super._value as _EditCourseFormModel;

  @override
  $Res call({
    Object? courseToAdd = freezed,
    Object? courseModuleToAdd = freezed,
  }) {
    return _then(_EditCourseFormModel(
      courseToAdd: courseToAdd == freezed
          ? _value.courseToAdd
          : courseToAdd // ignore: cast_nullable_to_non_nullable
              as CourseFormModel,
      courseModuleToAdd: courseModuleToAdd == freezed
          ? _value.courseModuleToAdd
          : courseModuleToAdd // ignore: cast_nullable_to_non_nullable
              as CourseModuleFormModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EditCourseFormModel implements _EditCourseFormModel {
  _$_EditCourseFormModel(
      {required this.courseToAdd, required this.courseModuleToAdd});

  factory _$_EditCourseFormModel.fromJson(Map<String, dynamic> json) =>
      _$$_EditCourseFormModelFromJson(json);

  @override
  final CourseFormModel courseToAdd;
  @override
  final CourseModuleFormModel courseModuleToAdd;

  @override
  String toString() {
    return 'EditCourseFormModel(courseToAdd: $courseToAdd, courseModuleToAdd: $courseModuleToAdd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EditCourseFormModel &&
            const DeepCollectionEquality()
                .equals(other.courseToAdd, courseToAdd) &&
            const DeepCollectionEquality()
                .equals(other.courseModuleToAdd, courseModuleToAdd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(courseToAdd),
      const DeepCollectionEquality().hash(courseModuleToAdd));

  @JsonKey(ignore: true)
  @override
  _$EditCourseFormModelCopyWith<_EditCourseFormModel> get copyWith =>
      __$EditCourseFormModelCopyWithImpl<_EditCourseFormModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EditCourseFormModelToJson(this);
  }
}

abstract class _EditCourseFormModel implements EditCourseFormModel {
  factory _EditCourseFormModel(
          {required CourseFormModel courseToAdd,
          required CourseModuleFormModel courseModuleToAdd}) =
      _$_EditCourseFormModel;

  factory _EditCourseFormModel.fromJson(Map<String, dynamic> json) =
      _$_EditCourseFormModel.fromJson;

  @override
  CourseFormModel get courseToAdd;
  @override
  CourseModuleFormModel get courseModuleToAdd;
  @override
  @JsonKey(ignore: true)
  _$EditCourseFormModelCopyWith<_EditCourseFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}
