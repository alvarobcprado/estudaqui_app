// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failure_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FailureTypeTearOff {
  const _$FailureTypeTearOff();

  NormalFailure normal() {
    return const NormalFailure();
  }

  CustomFailure custom(String title, String message) {
    return CustomFailure(
      title,
      message,
    );
  }

  NoConnectionFailure noConnection() {
    return const NoConnectionFailure();
  }
}

/// @nodoc
const $FailureType = _$FailureTypeTearOff();

/// @nodoc
mixin _$FailureType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() normal,
    required TResult Function(String title, String message) custom,
    required TResult Function() noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? normal,
    TResult Function(String title, String message)? custom,
    TResult Function()? noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? normal,
    TResult Function(String title, String message)? custom,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NormalFailure value) normal,
    required TResult Function(CustomFailure value) custom,
    required TResult Function(NoConnectionFailure value) noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NormalFailure value)? normal,
    TResult Function(CustomFailure value)? custom,
    TResult Function(NoConnectionFailure value)? noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NormalFailure value)? normal,
    TResult Function(CustomFailure value)? custom,
    TResult Function(NoConnectionFailure value)? noConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureTypeCopyWith<$Res> {
  factory $FailureTypeCopyWith(
          FailureType value, $Res Function(FailureType) then) =
      _$FailureTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$FailureTypeCopyWithImpl<$Res> implements $FailureTypeCopyWith<$Res> {
  _$FailureTypeCopyWithImpl(this._value, this._then);

  final FailureType _value;
  // ignore: unused_field
  final $Res Function(FailureType) _then;
}

/// @nodoc
abstract class $NormalFailureCopyWith<$Res> {
  factory $NormalFailureCopyWith(
          NormalFailure value, $Res Function(NormalFailure) then) =
      _$NormalFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$NormalFailureCopyWithImpl<$Res> extends _$FailureTypeCopyWithImpl<$Res>
    implements $NormalFailureCopyWith<$Res> {
  _$NormalFailureCopyWithImpl(
      NormalFailure _value, $Res Function(NormalFailure) _then)
      : super(_value, (v) => _then(v as NormalFailure));

  @override
  NormalFailure get _value => super._value as NormalFailure;
}

/// @nodoc

class _$NormalFailure extends NormalFailure {
  const _$NormalFailure() : super._();

  @override
  String toString() {
    return 'FailureType.normal()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NormalFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() normal,
    required TResult Function(String title, String message) custom,
    required TResult Function() noConnection,
  }) {
    return normal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? normal,
    TResult Function(String title, String message)? custom,
    TResult Function()? noConnection,
  }) {
    return normal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? normal,
    TResult Function(String title, String message)? custom,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NormalFailure value) normal,
    required TResult Function(CustomFailure value) custom,
    required TResult Function(NoConnectionFailure value) noConnection,
  }) {
    return normal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NormalFailure value)? normal,
    TResult Function(CustomFailure value)? custom,
    TResult Function(NoConnectionFailure value)? noConnection,
  }) {
    return normal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NormalFailure value)? normal,
    TResult Function(CustomFailure value)? custom,
    TResult Function(NoConnectionFailure value)? noConnection,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(this);
    }
    return orElse();
  }
}

abstract class NormalFailure extends FailureType {
  const factory NormalFailure() = _$NormalFailure;
  const NormalFailure._() : super._();
}

/// @nodoc
abstract class $CustomFailureCopyWith<$Res> {
  factory $CustomFailureCopyWith(
          CustomFailure value, $Res Function(CustomFailure) then) =
      _$CustomFailureCopyWithImpl<$Res>;
  $Res call({String title, String message});
}

/// @nodoc
class _$CustomFailureCopyWithImpl<$Res> extends _$FailureTypeCopyWithImpl<$Res>
    implements $CustomFailureCopyWith<$Res> {
  _$CustomFailureCopyWithImpl(
      CustomFailure _value, $Res Function(CustomFailure) _then)
      : super(_value, (v) => _then(v as CustomFailure));

  @override
  CustomFailure get _value => super._value as CustomFailure;

  @override
  $Res call({
    Object? title = freezed,
    Object? message = freezed,
  }) {
    return _then(CustomFailure(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomFailure extends CustomFailure {
  const _$CustomFailure(this.title, this.message) : super._();

  @override
  final String title;
  @override
  final String message;

  @override
  String toString() {
    return 'FailureType.custom(title: $title, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomFailure &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $CustomFailureCopyWith<CustomFailure> get copyWith =>
      _$CustomFailureCopyWithImpl<CustomFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() normal,
    required TResult Function(String title, String message) custom,
    required TResult Function() noConnection,
  }) {
    return custom(title, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? normal,
    TResult Function(String title, String message)? custom,
    TResult Function()? noConnection,
  }) {
    return custom?.call(title, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? normal,
    TResult Function(String title, String message)? custom,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(title, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NormalFailure value) normal,
    required TResult Function(CustomFailure value) custom,
    required TResult Function(NoConnectionFailure value) noConnection,
  }) {
    return custom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NormalFailure value)? normal,
    TResult Function(CustomFailure value)? custom,
    TResult Function(NoConnectionFailure value)? noConnection,
  }) {
    return custom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NormalFailure value)? normal,
    TResult Function(CustomFailure value)? custom,
    TResult Function(NoConnectionFailure value)? noConnection,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(this);
    }
    return orElse();
  }
}

abstract class CustomFailure extends FailureType {
  const factory CustomFailure(String title, String message) = _$CustomFailure;
  const CustomFailure._() : super._();

  String get title;
  String get message;
  @JsonKey(ignore: true)
  $CustomFailureCopyWith<CustomFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoConnectionFailureCopyWith<$Res> {
  factory $NoConnectionFailureCopyWith(
          NoConnectionFailure value, $Res Function(NoConnectionFailure) then) =
      _$NoConnectionFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoConnectionFailureCopyWithImpl<$Res>
    extends _$FailureTypeCopyWithImpl<$Res>
    implements $NoConnectionFailureCopyWith<$Res> {
  _$NoConnectionFailureCopyWithImpl(
      NoConnectionFailure _value, $Res Function(NoConnectionFailure) _then)
      : super(_value, (v) => _then(v as NoConnectionFailure));

  @override
  NoConnectionFailure get _value => super._value as NoConnectionFailure;
}

/// @nodoc

class _$NoConnectionFailure extends NoConnectionFailure {
  const _$NoConnectionFailure() : super._();

  @override
  String toString() {
    return 'FailureType.noConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NoConnectionFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() normal,
    required TResult Function(String title, String message) custom,
    required TResult Function() noConnection,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? normal,
    TResult Function(String title, String message)? custom,
    TResult Function()? noConnection,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? normal,
    TResult Function(String title, String message)? custom,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NormalFailure value) normal,
    required TResult Function(CustomFailure value) custom,
    required TResult Function(NoConnectionFailure value) noConnection,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NormalFailure value)? normal,
    TResult Function(CustomFailure value)? custom,
    TResult Function(NoConnectionFailure value)? noConnection,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NormalFailure value)? normal,
    TResult Function(CustomFailure value)? custom,
    TResult Function(NoConnectionFailure value)? noConnection,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnectionFailure extends FailureType {
  const factory NoConnectionFailure() = _$NoConnectionFailure;
  const NoConnectionFailure._() : super._();
}
