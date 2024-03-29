// Mocks generated by Mockito 5.1.0 from annotations
// in estudaqui/test/app/domain/use_case/authentication/signin_with_email_and_password_uc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i2;
import 'package:estudaqui/app/domain/data_repository/auth_data_repository.dart'
    as _i4;
import 'package:estudaqui/app/domain/entity/auth/social_auth_providers.dart'
    as _i7;
import 'package:estudaqui/core/error/failure.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart'
    as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeUserMetadata_1 extends _i1.Fake implements _i3.UserMetadata {}

class _FakeIdTokenResult_2 extends _i1.Fake implements _i3.IdTokenResult {}

class _FakeUserCredential_3 extends _i1.Fake implements _i3.UserCredential {}

class _FakeConfirmationResult_4 extends _i1.Fake
    implements _i3.ConfirmationResult {}

class _FakeUser_5 extends _i1.Fake implements _i3.User {}

/// A class which mocks [AuthDataRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthDataRepository extends _i1.Mock
    implements _i4.AuthDataRepository {
  MockAuthDataRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Stream<_i3.User?> get authStateChanges =>
      (super.noSuchMethod(Invocation.getter(#authStateChanges),
          returnValue: Stream<_i3.User?>.empty()) as _i5.Stream<_i3.User?>);
  @override
  _i5.Stream<_i3.User?> get userStateChanges =>
      (super.noSuchMethod(Invocation.getter(#userStateChanges),
          returnValue: Stream<_i3.User?>.empty()) as _i5.Stream<_i3.User?>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i3.User>> getCurrentUser() =>
      (super.noSuchMethod(Invocation.method(#getCurrentUser, []),
              returnValue: Future<_i2.Either<_i6.Failure, _i3.User>>.value(
                  _FakeEither_0<_i6.Failure, _i3.User>()))
          as _i5.Future<_i2.Either<_i6.Failure, _i3.User>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i3.User>> signInAnonmously() =>
      (super.noSuchMethod(Invocation.method(#signInAnonmously, []),
              returnValue: Future<_i2.Either<_i6.Failure, _i3.User>>.value(
                  _FakeEither_0<_i6.Failure, _i3.User>()))
          as _i5.Future<_i2.Either<_i6.Failure, _i3.User>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, void>> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
              returnValue: Future<_i2.Either<_i6.Failure, void>>.value(
                  _FakeEither_0<_i6.Failure, void>()))
          as _i5.Future<_i2.Either<_i6.Failure, void>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, void>> sendPasswordResetEmail(
          String? email) =>
      (super.noSuchMethod(Invocation.method(#sendPasswordResetEmail, [email]),
              returnValue: Future<_i2.Either<_i6.Failure, void>>.value(
                  _FakeEither_0<_i6.Failure, void>()))
          as _i5.Future<_i2.Either<_i6.Failure, void>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i3.User>> signInWithSocialProvider(
          {_i7.SocialAuthProviders? provider}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #signInWithSocialProvider, [], {#provider: provider}),
              returnValue: Future<_i2.Either<_i6.Failure, _i3.User>>.value(
                  _FakeEither_0<_i6.Failure, _i3.User>()))
          as _i5.Future<_i2.Either<_i6.Failure, _i3.User>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i3.User>> signInWithEmailAndPassword(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithEmailAndPassword, [],
                  {#email: email, #password: password}),
              returnValue: Future<_i2.Either<_i6.Failure, _i3.User>>.value(
                  _FakeEither_0<_i6.Failure, _i3.User>()))
          as _i5.Future<_i2.Either<_i6.Failure, _i3.User>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i3.User>> signUpWithEmailAndPassword(
          {String? name, String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signUpWithEmailAndPassword, [],
                  {#name: name, #email: email, #password: password}),
              returnValue: Future<_i2.Either<_i6.Failure, _i3.User>>.value(
                  _FakeEither_0<_i6.Failure, _i3.User>()))
          as _i5.Future<_i2.Either<_i6.Failure, _i3.User>>);
}

/// A class which mocks [User].
///
/// See the documentation for Mockito's code generation for more information.
class MockUser extends _i1.Mock implements _i3.User {
  MockUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get emailVerified =>
      (super.noSuchMethod(Invocation.getter(#emailVerified), returnValue: false)
          as bool);
  @override
  bool get isAnonymous =>
      (super.noSuchMethod(Invocation.getter(#isAnonymous), returnValue: false)
          as bool);
  @override
  _i3.UserMetadata get metadata =>
      (super.noSuchMethod(Invocation.getter(#metadata),
          returnValue: _FakeUserMetadata_1()) as _i3.UserMetadata);
  @override
  List<_i3.UserInfo> get providerData =>
      (super.noSuchMethod(Invocation.getter(#providerData),
          returnValue: <_i3.UserInfo>[]) as List<_i3.UserInfo>);
  @override
  String get uid =>
      (super.noSuchMethod(Invocation.getter(#uid), returnValue: '') as String);
  @override
  _i5.Future<void> delete() =>
      (super.noSuchMethod(Invocation.method(#delete, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<String> getIdToken([bool? forceRefresh = false]) =>
      (super.noSuchMethod(Invocation.method(#getIdToken, [forceRefresh]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i3.IdTokenResult> getIdTokenResult(
          [bool? forceRefresh = false]) =>
      (super.noSuchMethod(Invocation.method(#getIdTokenResult, [forceRefresh]),
              returnValue:
                  Future<_i3.IdTokenResult>.value(_FakeIdTokenResult_2()))
          as _i5.Future<_i3.IdTokenResult>);
  @override
  _i5.Future<_i3.UserCredential> linkWithCredential(
          _i3.AuthCredential? credential) =>
      (super.noSuchMethod(Invocation.method(#linkWithCredential, [credential]),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_3()))
          as _i5.Future<_i3.UserCredential>);
  @override
  _i5.Future<_i3.UserCredential> linkWithPopup(_i8.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#linkWithPopup, [provider]),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_3()))
          as _i5.Future<_i3.UserCredential>);
  @override
  _i5.Future<_i3.ConfirmationResult> linkWithPhoneNumber(String? phoneNumber,
          [_i3.RecaptchaVerifier? verifier]) =>
      (super.noSuchMethod(
              Invocation.method(#linkWithPhoneNumber, [phoneNumber, verifier]),
              returnValue: Future<_i3.ConfirmationResult>.value(
                  _FakeConfirmationResult_4()))
          as _i5.Future<_i3.ConfirmationResult>);
  @override
  _i5.Future<_i3.UserCredential> reauthenticateWithCredential(
          _i3.AuthCredential? credential) =>
      (super.noSuchMethod(
              Invocation.method(#reauthenticateWithCredential, [credential]),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_3()))
          as _i5.Future<_i3.UserCredential>);
  @override
  _i5.Future<void> reload() =>
      (super.noSuchMethod(Invocation.method(#reload, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> sendEmailVerification(
          [_i3.ActionCodeSettings? actionCodeSettings]) =>
      (super.noSuchMethod(
          Invocation.method(#sendEmailVerification, [actionCodeSettings]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<_i3.User> unlink(String? providerId) =>
      (super.noSuchMethod(Invocation.method(#unlink, [providerId]),
              returnValue: Future<_i3.User>.value(_FakeUser_5()))
          as _i5.Future<_i3.User>);
  @override
  _i5.Future<void> updateEmail(String? newEmail) =>
      (super.noSuchMethod(Invocation.method(#updateEmail, [newEmail]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> updatePassword(String? newPassword) =>
      (super.noSuchMethod(Invocation.method(#updatePassword, [newPassword]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> updatePhoneNumber(
          _i3.PhoneAuthCredential? phoneCredential) =>
      (super.noSuchMethod(
          Invocation.method(#updatePhoneNumber, [phoneCredential]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> updateDisplayName(String? displayName) =>
      (super.noSuchMethod(Invocation.method(#updateDisplayName, [displayName]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> updatePhotoURL(String? photoURL) =>
      (super.noSuchMethod(Invocation.method(#updatePhotoURL, [photoURL]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> updateProfile({String? displayName, String? photoURL}) =>
      (super.noSuchMethod(
          Invocation.method(#updateProfile, [],
              {#displayName: displayName, #photoURL: photoURL}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> verifyBeforeUpdateEmail(String? newEmail,
          [_i3.ActionCodeSettings? actionCodeSettings]) =>
      (super.noSuchMethod(
          Invocation.method(
              #verifyBeforeUpdateEmail, [newEmail, actionCodeSettings]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
}
