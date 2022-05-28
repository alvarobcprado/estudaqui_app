// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_drawer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MyDrawerStateTearOff {
  const _$MyDrawerStateTearOff();

  _Unauthenticated unauthenticated() {
    return _Unauthenticated();
  }

  _Logged logged({required String email, String? username}) {
    return _Logged(
      email: email,
      username: username,
    );
  }
}

/// @nodoc
const $MyDrawerState = _$MyDrawerStateTearOff();

/// @nodoc
mixin _$MyDrawerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String email, String? username) logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String email, String? username)? logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String email, String? username)? logged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Logged value) logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Logged value)? logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Logged value)? logged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyDrawerStateCopyWith<$Res> {
  factory $MyDrawerStateCopyWith(
          MyDrawerState value, $Res Function(MyDrawerState) then) =
      _$MyDrawerStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MyDrawerStateCopyWithImpl<$Res>
    implements $MyDrawerStateCopyWith<$Res> {
  _$MyDrawerStateCopyWithImpl(this._value, this._then);

  final MyDrawerState _value;
  // ignore: unused_field
  final $Res Function(MyDrawerState) _then;
}

/// @nodoc
abstract class _$UnauthenticatedCopyWith<$Res> {
  factory _$UnauthenticatedCopyWith(
          _Unauthenticated value, $Res Function(_Unauthenticated) then) =
      __$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnauthenticatedCopyWithImpl<$Res>
    extends _$MyDrawerStateCopyWithImpl<$Res>
    implements _$UnauthenticatedCopyWith<$Res> {
  __$UnauthenticatedCopyWithImpl(
      _Unauthenticated _value, $Res Function(_Unauthenticated) _then)
      : super(_value, (v) => _then(v as _Unauthenticated));

  @override
  _Unauthenticated get _value => super._value as _Unauthenticated;
}

/// @nodoc

class _$_Unauthenticated implements _Unauthenticated {
  _$_Unauthenticated();

  @override
  String toString() {
    return 'MyDrawerState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String email, String? username) logged,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String email, String? username)? logged,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String email, String? username)? logged,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Logged value) logged,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Logged value)? logged,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Logged value)? logged,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements MyDrawerState {
  factory _Unauthenticated() = _$_Unauthenticated;
}

/// @nodoc
abstract class _$LoggedCopyWith<$Res> {
  factory _$LoggedCopyWith(_Logged value, $Res Function(_Logged) then) =
      __$LoggedCopyWithImpl<$Res>;
  $Res call({String email, String? username});
}

/// @nodoc
class __$LoggedCopyWithImpl<$Res> extends _$MyDrawerStateCopyWithImpl<$Res>
    implements _$LoggedCopyWith<$Res> {
  __$LoggedCopyWithImpl(_Logged _value, $Res Function(_Logged) _then)
      : super(_value, (v) => _then(v as _Logged));

  @override
  _Logged get _value => super._value as _Logged;

  @override
  $Res call({
    Object? email = freezed,
    Object? username = freezed,
  }) {
    return _then(_Logged(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Logged implements _Logged {
  _$_Logged({required this.email, this.username});

  @override
  final String email;
  @override
  final String? username;

  @override
  String toString() {
    return 'MyDrawerState.logged(email: $email, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Logged &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(username));

  @JsonKey(ignore: true)
  @override
  _$LoggedCopyWith<_Logged> get copyWith =>
      __$LoggedCopyWithImpl<_Logged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String email, String? username) logged,
  }) {
    return logged(email, username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String email, String? username)? logged,
  }) {
    return logged?.call(email, username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String email, String? username)? logged,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged(email, username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Logged value) logged,
  }) {
    return logged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Logged value)? logged,
  }) {
    return logged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Logged value)? logged,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged(this);
    }
    return orElse();
  }
}

abstract class _Logged implements MyDrawerState {
  factory _Logged({required String email, String? username}) = _$_Logged;

  String get email;
  String? get username;
  @JsonKey(ignore: true)
  _$LoggedCopyWith<_Logged> get copyWith => throw _privateConstructorUsedError;
}
