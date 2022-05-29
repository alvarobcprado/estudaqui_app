// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'course_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourseFormModel _$CourseFormModelFromJson(Map<String, dynamic> json) {
  return _CourseFormModel.fromJson(json);
}

/// @nodoc
class _$CourseFormModelTearOff {
  const _$CourseFormModelTearOff();

  _CourseFormModel call(
      {required String courseName,
      required String courseDescription,
      required String courseSubject,
      String courseId = '',
      String courseImage = '',
      String projectId = '',
      String creatorId = '',
      String creatorName = '',
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return _CourseFormModel(
      courseName: courseName,
      courseDescription: courseDescription,
      courseSubject: courseSubject,
      courseId: courseId,
      courseImage: courseImage,
      projectId: projectId,
      creatorId: creatorId,
      creatorName: creatorName,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  CourseFormModel fromJson(Map<String, Object?> json) {
    return CourseFormModel.fromJson(json);
  }
}

/// @nodoc
const $CourseFormModel = _$CourseFormModelTearOff();

/// @nodoc
mixin _$CourseFormModel {
  String get courseName => throw _privateConstructorUsedError;
  String get courseDescription => throw _privateConstructorUsedError;
  String get courseSubject => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  String get courseImage => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  String get creatorName => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseFormModelCopyWith<CourseFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseFormModelCopyWith<$Res> {
  factory $CourseFormModelCopyWith(
          CourseFormModel value, $Res Function(CourseFormModel) then) =
      _$CourseFormModelCopyWithImpl<$Res>;
  $Res call(
      {String courseName,
      String courseDescription,
      String courseSubject,
      String courseId,
      String courseImage,
      String projectId,
      String creatorId,
      String creatorName,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CourseFormModelCopyWithImpl<$Res>
    implements $CourseFormModelCopyWith<$Res> {
  _$CourseFormModelCopyWithImpl(this._value, this._then);

  final CourseFormModel _value;
  // ignore: unused_field
  final $Res Function(CourseFormModel) _then;

  @override
  $Res call({
    Object? courseName = freezed,
    Object? courseDescription = freezed,
    Object? courseSubject = freezed,
    Object? courseId = freezed,
    Object? courseImage = freezed,
    Object? projectId = freezed,
    Object? creatorId = freezed,
    Object? creatorName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      courseName: courseName == freezed
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String,
      courseDescription: courseDescription == freezed
          ? _value.courseDescription
          : courseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      courseSubject: courseSubject == freezed
          ? _value.courseSubject
          : courseSubject // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      courseImage: courseImage == freezed
          ? _value.courseImage
          : courseImage // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: creatorName == freezed
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$CourseFormModelCopyWith<$Res>
    implements $CourseFormModelCopyWith<$Res> {
  factory _$CourseFormModelCopyWith(
          _CourseFormModel value, $Res Function(_CourseFormModel) then) =
      __$CourseFormModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String courseName,
      String courseDescription,
      String courseSubject,
      String courseId,
      String courseImage,
      String projectId,
      String creatorId,
      String creatorName,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$CourseFormModelCopyWithImpl<$Res>
    extends _$CourseFormModelCopyWithImpl<$Res>
    implements _$CourseFormModelCopyWith<$Res> {
  __$CourseFormModelCopyWithImpl(
      _CourseFormModel _value, $Res Function(_CourseFormModel) _then)
      : super(_value, (v) => _then(v as _CourseFormModel));

  @override
  _CourseFormModel get _value => super._value as _CourseFormModel;

  @override
  $Res call({
    Object? courseName = freezed,
    Object? courseDescription = freezed,
    Object? courseSubject = freezed,
    Object? courseId = freezed,
    Object? courseImage = freezed,
    Object? projectId = freezed,
    Object? creatorId = freezed,
    Object? creatorName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_CourseFormModel(
      courseName: courseName == freezed
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String,
      courseDescription: courseDescription == freezed
          ? _value.courseDescription
          : courseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      courseSubject: courseSubject == freezed
          ? _value.courseSubject
          : courseSubject // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      courseImage: courseImage == freezed
          ? _value.courseImage
          : courseImage // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: creatorName == freezed
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourseFormModel implements _CourseFormModel {
  _$_CourseFormModel(
      {required this.courseName,
      required this.courseDescription,
      required this.courseSubject,
      this.courseId = '',
      this.courseImage = '',
      this.projectId = '',
      this.creatorId = '',
      this.creatorName = '',
      this.createdAt,
      this.updatedAt});

  factory _$_CourseFormModel.fromJson(Map<String, dynamic> json) =>
      _$$_CourseFormModelFromJson(json);

  @override
  final String courseName;
  @override
  final String courseDescription;
  @override
  final String courseSubject;
  @JsonKey()
  @override
  final String courseId;
  @JsonKey()
  @override
  final String courseImage;
  @JsonKey()
  @override
  final String projectId;
  @JsonKey()
  @override
  final String creatorId;
  @JsonKey()
  @override
  final String creatorName;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CourseFormModel(courseName: $courseName, courseDescription: $courseDescription, courseSubject: $courseSubject, courseId: $courseId, courseImage: $courseImage, projectId: $projectId, creatorId: $creatorId, creatorName: $creatorName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseFormModel &&
            const DeepCollectionEquality()
                .equals(other.courseName, courseName) &&
            const DeepCollectionEquality()
                .equals(other.courseDescription, courseDescription) &&
            const DeepCollectionEquality()
                .equals(other.courseSubject, courseSubject) &&
            const DeepCollectionEquality().equals(other.courseId, courseId) &&
            const DeepCollectionEquality()
                .equals(other.courseImage, courseImage) &&
            const DeepCollectionEquality().equals(other.projectId, projectId) &&
            const DeepCollectionEquality().equals(other.creatorId, creatorId) &&
            const DeepCollectionEquality()
                .equals(other.creatorName, creatorName) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(courseName),
      const DeepCollectionEquality().hash(courseDescription),
      const DeepCollectionEquality().hash(courseSubject),
      const DeepCollectionEquality().hash(courseId),
      const DeepCollectionEquality().hash(courseImage),
      const DeepCollectionEquality().hash(projectId),
      const DeepCollectionEquality().hash(creatorId),
      const DeepCollectionEquality().hash(creatorName),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$CourseFormModelCopyWith<_CourseFormModel> get copyWith =>
      __$CourseFormModelCopyWithImpl<_CourseFormModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseFormModelToJson(this);
  }
}

abstract class _CourseFormModel implements CourseFormModel {
  factory _CourseFormModel(
      {required String courseName,
      required String courseDescription,
      required String courseSubject,
      String courseId,
      String courseImage,
      String projectId,
      String creatorId,
      String creatorName,
      DateTime? createdAt,
      DateTime? updatedAt}) = _$_CourseFormModel;

  factory _CourseFormModel.fromJson(Map<String, dynamic> json) =
      _$_CourseFormModel.fromJson;

  @override
  String get courseName;
  @override
  String get courseDescription;
  @override
  String get courseSubject;
  @override
  String get courseId;
  @override
  String get courseImage;
  @override
  String get projectId;
  @override
  String get creatorId;
  @override
  String get creatorName;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$CourseFormModelCopyWith<_CourseFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}
