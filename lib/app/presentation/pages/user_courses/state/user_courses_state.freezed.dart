// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_courses_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserCoursesStateTearOff {
  const _$UserCoursesStateTearOff();

  Initial initial() {
    return Initial();
  }

  InitialLoading initialLoading() {
    return InitialLoading();
  }

  Success success({required List<Course> courseList}) {
    return Success(
      courseList: courseList,
    );
  }

  Empty empty() {
    return Empty();
  }

  Failed failed({String? errorTitle, String? errorBody}) {
    return Failed(
      errorTitle: errorTitle,
      errorBody: errorBody,
    );
  }
}

/// @nodoc
const $UserCoursesState = _$UserCoursesStateTearOff();

/// @nodoc
mixin _$UserCoursesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialLoading,
    required TResult Function(List<Course> courseList) success,
    required TResult Function() empty,
    required TResult Function(String? errorTitle, String? errorBody) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialLoading,
    TResult Function(List<Course> courseList)? success,
    TResult Function()? empty,
    TResult Function(String? errorTitle, String? errorBody)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialLoading,
    TResult Function(List<Course> courseList)? success,
    TResult Function()? empty,
    TResult Function(String? errorTitle, String? errorBody)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(InitialLoading value) initialLoading,
    required TResult Function(Success value) success,
    required TResult Function(Empty value) empty,
    required TResult Function(Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(InitialLoading value)? initialLoading,
    TResult Function(Success value)? success,
    TResult Function(Empty value)? empty,
    TResult Function(Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(InitialLoading value)? initialLoading,
    TResult Function(Success value)? success,
    TResult Function(Empty value)? empty,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCoursesStateCopyWith<$Res> {
  factory $UserCoursesStateCopyWith(
          UserCoursesState value, $Res Function(UserCoursesState) then) =
      _$UserCoursesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserCoursesStateCopyWithImpl<$Res>
    implements $UserCoursesStateCopyWith<$Res> {
  _$UserCoursesStateCopyWithImpl(this._value, this._then);

  final UserCoursesState _value;
  // ignore: unused_field
  final $Res Function(UserCoursesState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$UserCoursesStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial implements Initial {
  _$Initial();

  @override
  String toString() {
    return 'UserCoursesState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialLoading,
    required TResult Function(List<Course> courseList) success,
    required TResult Function() empty,
    required TResult Function(String? errorTitle, String? errorBody) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialLoading,
    TResult Function(List<Course> courseList)? success,
    TResult Function()? empty,
    TResult Function(String? errorTitle, String? errorBody)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialLoading,
    TResult Function(List<Course> courseList)? success,
    TResult Function()? empty,
    TResult Function(String? errorTitle, String? errorBody)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(InitialLoading value) initialLoading,
    required TResult Function(Success value) success,
    required TResult Function(Empty value) empty,
    required TResult Function(Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(InitialLoading value)? initialLoading,
    TResult Function(Success value)? success,
    TResult Function(Empty value)? empty,
    TResult Function(Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(InitialLoading value)? initialLoading,
    TResult Function(Success value)? success,
    TResult Function(Empty value)? empty,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements UserCoursesState {
  factory Initial() = _$Initial;
}

/// @nodoc
abstract class $InitialLoadingCopyWith<$Res> {
  factory $InitialLoadingCopyWith(
          InitialLoading value, $Res Function(InitialLoading) then) =
      _$InitialLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialLoadingCopyWithImpl<$Res>
    extends _$UserCoursesStateCopyWithImpl<$Res>
    implements $InitialLoadingCopyWith<$Res> {
  _$InitialLoadingCopyWithImpl(
      InitialLoading _value, $Res Function(InitialLoading) _then)
      : super(_value, (v) => _then(v as InitialLoading));

  @override
  InitialLoading get _value => super._value as InitialLoading;
}

/// @nodoc

class _$InitialLoading implements InitialLoading {
  _$InitialLoading();

  @override
  String toString() {
    return 'UserCoursesState.initialLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialLoading,
    required TResult Function(List<Course> courseList) success,
    required TResult Function() empty,
    required TResult Function(String? errorTitle, String? errorBody) failed,
  }) {
    return initialLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialLoading,
    TResult Function(List<Course> courseList)? success,
    TResult Function()? empty,
    TResult Function(String? errorTitle, String? errorBody)? failed,
  }) {
    return initialLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialLoading,
    TResult Function(List<Course> courseList)? success,
    TResult Function()? empty,
    TResult Function(String? errorTitle, String? errorBody)? failed,
    required TResult orElse(),
  }) {
    if (initialLoading != null) {
      return initialLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(InitialLoading value) initialLoading,
    required TResult Function(Success value) success,
    required TResult Function(Empty value) empty,
    required TResult Function(Failed value) failed,
  }) {
    return initialLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(InitialLoading value)? initialLoading,
    TResult Function(Success value)? success,
    TResult Function(Empty value)? empty,
    TResult Function(Failed value)? failed,
  }) {
    return initialLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(InitialLoading value)? initialLoading,
    TResult Function(Success value)? success,
    TResult Function(Empty value)? empty,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initialLoading != null) {
      return initialLoading(this);
    }
    return orElse();
  }
}

abstract class InitialLoading implements UserCoursesState {
  factory InitialLoading() = _$InitialLoading;
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  $Res call({List<Course> courseList});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> extends _$UserCoursesStateCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object? courseList = freezed,
  }) {
    return _then(Success(
      courseList: courseList == freezed
          ? _value.courseList
          : courseList // ignore: cast_nullable_to_non_nullable
              as List<Course>,
    ));
  }
}

/// @nodoc

class _$Success implements Success {
  _$Success({required this.courseList});

  @override
  final List<Course> courseList;

  @override
  String toString() {
    return 'UserCoursesState.success(courseList: $courseList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Success &&
            const DeepCollectionEquality()
                .equals(other.courseList, courseList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(courseList));

  @JsonKey(ignore: true)
  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialLoading,
    required TResult Function(List<Course> courseList) success,
    required TResult Function() empty,
    required TResult Function(String? errorTitle, String? errorBody) failed,
  }) {
    return success(courseList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialLoading,
    TResult Function(List<Course> courseList)? success,
    TResult Function()? empty,
    TResult Function(String? errorTitle, String? errorBody)? failed,
  }) {
    return success?.call(courseList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialLoading,
    TResult Function(List<Course> courseList)? success,
    TResult Function()? empty,
    TResult Function(String? errorTitle, String? errorBody)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(courseList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(InitialLoading value) initialLoading,
    required TResult Function(Success value) success,
    required TResult Function(Empty value) empty,
    required TResult Function(Failed value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(InitialLoading value)? initialLoading,
    TResult Function(Success value)? success,
    TResult Function(Empty value)? empty,
    TResult Function(Failed value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(InitialLoading value)? initialLoading,
    TResult Function(Success value)? success,
    TResult Function(Empty value)? empty,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements UserCoursesState {
  factory Success({required List<Course> courseList}) = _$Success;

  List<Course> get courseList;
  @JsonKey(ignore: true)
  $SuccessCopyWith<Success> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmptyCopyWith<$Res> {
  factory $EmptyCopyWith(Empty value, $Res Function(Empty) then) =
      _$EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmptyCopyWithImpl<$Res> extends _$UserCoursesStateCopyWithImpl<$Res>
    implements $EmptyCopyWith<$Res> {
  _$EmptyCopyWithImpl(Empty _value, $Res Function(Empty) _then)
      : super(_value, (v) => _then(v as Empty));

  @override
  Empty get _value => super._value as Empty;
}

/// @nodoc

class _$Empty implements Empty {
  _$Empty();

  @override
  String toString() {
    return 'UserCoursesState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialLoading,
    required TResult Function(List<Course> courseList) success,
    required TResult Function() empty,
    required TResult Function(String? errorTitle, String? errorBody) failed,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialLoading,
    TResult Function(List<Course> courseList)? success,
    TResult Function()? empty,
    TResult Function(String? errorTitle, String? errorBody)? failed,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialLoading,
    TResult Function(List<Course> courseList)? success,
    TResult Function()? empty,
    TResult Function(String? errorTitle, String? errorBody)? failed,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(InitialLoading value) initialLoading,
    required TResult Function(Success value) success,
    required TResult Function(Empty value) empty,
    required TResult Function(Failed value) failed,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(InitialLoading value)? initialLoading,
    TResult Function(Success value)? success,
    TResult Function(Empty value)? empty,
    TResult Function(Failed value)? failed,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(InitialLoading value)? initialLoading,
    TResult Function(Success value)? success,
    TResult Function(Empty value)? empty,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty implements UserCoursesState {
  factory Empty() = _$Empty;
}

/// @nodoc
abstract class $FailedCopyWith<$Res> {
  factory $FailedCopyWith(Failed value, $Res Function(Failed) then) =
      _$FailedCopyWithImpl<$Res>;
  $Res call({String? errorTitle, String? errorBody});
}

/// @nodoc
class _$FailedCopyWithImpl<$Res> extends _$UserCoursesStateCopyWithImpl<$Res>
    implements $FailedCopyWith<$Res> {
  _$FailedCopyWithImpl(Failed _value, $Res Function(Failed) _then)
      : super(_value, (v) => _then(v as Failed));

  @override
  Failed get _value => super._value as Failed;

  @override
  $Res call({
    Object? errorTitle = freezed,
    Object? errorBody = freezed,
  }) {
    return _then(Failed(
      errorTitle: errorTitle == freezed
          ? _value.errorTitle
          : errorTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      errorBody: errorBody == freezed
          ? _value.errorBody
          : errorBody // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Failed implements Failed {
  _$Failed({this.errorTitle, this.errorBody});

  @override
  final String? errorTitle;
  @override
  final String? errorBody;

  @override
  String toString() {
    return 'UserCoursesState.failed(errorTitle: $errorTitle, errorBody: $errorBody)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Failed &&
            const DeepCollectionEquality()
                .equals(other.errorTitle, errorTitle) &&
            const DeepCollectionEquality().equals(other.errorBody, errorBody));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(errorTitle),
      const DeepCollectionEquality().hash(errorBody));

  @JsonKey(ignore: true)
  @override
  $FailedCopyWith<Failed> get copyWith =>
      _$FailedCopyWithImpl<Failed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialLoading,
    required TResult Function(List<Course> courseList) success,
    required TResult Function() empty,
    required TResult Function(String? errorTitle, String? errorBody) failed,
  }) {
    return failed(errorTitle, errorBody);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialLoading,
    TResult Function(List<Course> courseList)? success,
    TResult Function()? empty,
    TResult Function(String? errorTitle, String? errorBody)? failed,
  }) {
    return failed?.call(errorTitle, errorBody);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialLoading,
    TResult Function(List<Course> courseList)? success,
    TResult Function()? empty,
    TResult Function(String? errorTitle, String? errorBody)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(errorTitle, errorBody);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(InitialLoading value) initialLoading,
    required TResult Function(Success value) success,
    required TResult Function(Empty value) empty,
    required TResult Function(Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(InitialLoading value)? initialLoading,
    TResult Function(Success value)? success,
    TResult Function(Empty value)? empty,
    TResult Function(Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(InitialLoading value)? initialLoading,
    TResult Function(Success value)? success,
    TResult Function(Empty value)? empty,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class Failed implements UserCoursesState {
  factory Failed({String? errorTitle, String? errorBody}) = _$Failed;

  String? get errorTitle;
  String? get errorBody;
  @JsonKey(ignore: true)
  $FailedCopyWith<Failed> get copyWith => throw _privateConstructorUsedError;
}
