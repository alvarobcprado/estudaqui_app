// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  Authenticated authenticated({required AuthMethod method}) {
    return Authenticated(
      method: method,
    );
  }

  Unauthenticated unauthenticated() {
    return Unauthenticated();
  }

  Authenticating authenticating() {
    return Authenticating();
  }

  FailedAuthentication failedAuthentication(
      {String? errorTitle, String? errorBody}) {
    return FailedAuthentication(
      errorTitle: errorTitle,
      errorBody: errorBody,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthMethod method) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(String? errorTitle, String? errorBody)
        failedAuthentication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthMethod method)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String? errorTitle, String? errorBody)?
        failedAuthentication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthMethod method)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String? errorTitle, String? errorBody)?
        failedAuthentication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticating value) authenticating,
    required TResult Function(FailedAuthentication value) failedAuthentication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(FailedAuthentication value)? failedAuthentication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(FailedAuthentication value)? failedAuthentication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class $AuthenticatedCopyWith<$Res> {
  factory $AuthenticatedCopyWith(
          Authenticated value, $Res Function(Authenticated) then) =
      _$AuthenticatedCopyWithImpl<$Res>;
  $Res call({AuthMethod method});
}

/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(
      Authenticated _value, $Res Function(Authenticated) _then)
      : super(_value, (v) => _then(v as Authenticated));

  @override
  Authenticated get _value => super._value as Authenticated;

  @override
  $Res call({
    Object? method = freezed,
  }) {
    return _then(Authenticated(
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as AuthMethod,
    ));
  }
}

/// @nodoc

class _$Authenticated implements Authenticated {
  _$Authenticated({required this.method});

  @override
  final AuthMethod method;

  @override
  String toString() {
    return 'AuthState.authenticated(method: $method)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Authenticated &&
            const DeepCollectionEquality().equals(other.method, method));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(method));

  @JsonKey(ignore: true)
  @override
  $AuthenticatedCopyWith<Authenticated> get copyWith =>
      _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthMethod method) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(String? errorTitle, String? errorBody)
        failedAuthentication,
  }) {
    return authenticated(method);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthMethod method)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String? errorTitle, String? errorBody)?
        failedAuthentication,
  }) {
    return authenticated?.call(method);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthMethod method)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String? errorTitle, String? errorBody)?
        failedAuthentication,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(method);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticating value) authenticating,
    required TResult Function(FailedAuthentication value) failedAuthentication,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(FailedAuthentication value)? failedAuthentication,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(FailedAuthentication value)? failedAuthentication,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthState {
  factory Authenticated({required AuthMethod method}) = _$Authenticated;

  AuthMethod get method;
  @JsonKey(ignore: true)
  $AuthenticatedCopyWith<Authenticated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnauthenticatedCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(
          Unauthenticated value, $Res Function(Unauthenticated) then) =
      _$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnauthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(
      Unauthenticated _value, $Res Function(Unauthenticated) _then)
      : super(_value, (v) => _then(v as Unauthenticated));

  @override
  Unauthenticated get _value => super._value as Unauthenticated;
}

/// @nodoc

class _$Unauthenticated implements Unauthenticated {
  _$Unauthenticated();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthMethod method) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(String? errorTitle, String? errorBody)
        failedAuthentication,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthMethod method)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String? errorTitle, String? errorBody)?
        failedAuthentication,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthMethod method)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String? errorTitle, String? errorBody)?
        failedAuthentication,
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
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticating value) authenticating,
    required TResult Function(FailedAuthentication value) failedAuthentication,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(FailedAuthentication value)? failedAuthentication,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(FailedAuthentication value)? failedAuthentication,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthState {
  factory Unauthenticated() = _$Unauthenticated;
}

/// @nodoc
abstract class $AuthenticatingCopyWith<$Res> {
  factory $AuthenticatingCopyWith(
          Authenticating value, $Res Function(Authenticating) then) =
      _$AuthenticatingCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticatingCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthenticatingCopyWith<$Res> {
  _$AuthenticatingCopyWithImpl(
      Authenticating _value, $Res Function(Authenticating) _then)
      : super(_value, (v) => _then(v as Authenticating));

  @override
  Authenticating get _value => super._value as Authenticating;
}

/// @nodoc

class _$Authenticating implements Authenticating {
  _$Authenticating();

  @override
  String toString() {
    return 'AuthState.authenticating()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Authenticating);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthMethod method) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(String? errorTitle, String? errorBody)
        failedAuthentication,
  }) {
    return authenticating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthMethod method)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String? errorTitle, String? errorBody)?
        failedAuthentication,
  }) {
    return authenticating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthMethod method)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String? errorTitle, String? errorBody)?
        failedAuthentication,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticating value) authenticating,
    required TResult Function(FailedAuthentication value) failedAuthentication,
  }) {
    return authenticating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(FailedAuthentication value)? failedAuthentication,
  }) {
    return authenticating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(FailedAuthentication value)? failedAuthentication,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating(this);
    }
    return orElse();
  }
}

abstract class Authenticating implements AuthState {
  factory Authenticating() = _$Authenticating;
}

/// @nodoc
abstract class $FailedAuthenticationCopyWith<$Res> {
  factory $FailedAuthenticationCopyWith(FailedAuthentication value,
          $Res Function(FailedAuthentication) then) =
      _$FailedAuthenticationCopyWithImpl<$Res>;
  $Res call({String? errorTitle, String? errorBody});
}

/// @nodoc
class _$FailedAuthenticationCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $FailedAuthenticationCopyWith<$Res> {
  _$FailedAuthenticationCopyWithImpl(
      FailedAuthentication _value, $Res Function(FailedAuthentication) _then)
      : super(_value, (v) => _then(v as FailedAuthentication));

  @override
  FailedAuthentication get _value => super._value as FailedAuthentication;

  @override
  $Res call({
    Object? errorTitle = freezed,
    Object? errorBody = freezed,
  }) {
    return _then(FailedAuthentication(
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

class _$FailedAuthentication implements FailedAuthentication {
  _$FailedAuthentication({this.errorTitle, this.errorBody});

  @override
  final String? errorTitle;
  @override
  final String? errorBody;

  @override
  String toString() {
    return 'AuthState.failedAuthentication(errorTitle: $errorTitle, errorBody: $errorBody)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FailedAuthentication &&
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
  $FailedAuthenticationCopyWith<FailedAuthentication> get copyWith =>
      _$FailedAuthenticationCopyWithImpl<FailedAuthentication>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthMethod method) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(String? errorTitle, String? errorBody)
        failedAuthentication,
  }) {
    return failedAuthentication(errorTitle, errorBody);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthMethod method)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String? errorTitle, String? errorBody)?
        failedAuthentication,
  }) {
    return failedAuthentication?.call(errorTitle, errorBody);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthMethod method)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String? errorTitle, String? errorBody)?
        failedAuthentication,
    required TResult orElse(),
  }) {
    if (failedAuthentication != null) {
      return failedAuthentication(errorTitle, errorBody);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticating value) authenticating,
    required TResult Function(FailedAuthentication value) failedAuthentication,
  }) {
    return failedAuthentication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(FailedAuthentication value)? failedAuthentication,
  }) {
    return failedAuthentication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(FailedAuthentication value)? failedAuthentication,
    required TResult orElse(),
  }) {
    if (failedAuthentication != null) {
      return failedAuthentication(this);
    }
    return orElse();
  }
}

abstract class FailedAuthentication implements AuthState {
  factory FailedAuthentication({String? errorTitle, String? errorBody}) =
      _$FailedAuthentication;

  String? get errorTitle;
  String? get errorBody;
  @JsonKey(ignore: true)
  $FailedAuthenticationCopyWith<FailedAuthentication> get copyWith =>
      throw _privateConstructorUsedError;
}
