import 'package:dartz/dartz.dart';
import 'package:estudaqui/app/data/mapper/remote_to_domain.dart';
import 'package:estudaqui/app/domain/data_repository/auth_data_repository.dart';
import 'package:estudaqui/app/domain/entity/auth/social_auth_data.dart';
import 'package:estudaqui/app/domain/entity/auth/social_auth_providers.dart';
import 'package:estudaqui/core/error/failure.dart';
import 'package:estudaqui/core/error/failure_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthImpRepository implements AuthDataRepository {
  AuthImpRepository({
    required FirebaseAuth authProvider,
    required GoogleSignIn googleAuthProvider,
  })  : _authProvider = authProvider,
        _googleAuthProvider = googleAuthProvider;

  final FirebaseAuth _authProvider;
  final GoogleSignIn _googleAuthProvider;

  @override
  Stream<User?> get authStateChanges => _authProvider.authStateChanges();

  @override
  Stream<User?> get userStateChanges async* {
    await getCurrentUser();
    yield* _authProvider.userChanges();
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    final user = _authProvider.currentUser;
    if (user != null) {
      return Right(user);
    } else {
      await signInAnonmously();
      final newUser = _authProvider.currentUser;
      if (newUser != null) {
        return Right(newUser);
      }
    }
    return Left(
      Failure.fromType(
        type: const CustomFailure(
          'Usuário não disponível',
          'Houve um problema ao tentar pegar as informações do usuário',
        ),
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signInAnonmously() async {
    try {
      final userCredential = await _authProvider.signInAnonymously();

      if (userCredential.user != null && userCredential.user!.isAnonymous) {
        return Right(userCredential.user!);
      } else {
        throw Exception();
      }
    } catch (e) {
      return Left(
        Failure.fromType(
          type: const CustomFailure(
            'Usuário anônimo',
            'Houve um problema ao entrar como usuário anônimo',
          ),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final userCredential = await _authProvider.signInAnonymously();

      if (userCredential.user != null && userCredential.user!.isAnonymous) {
        return const Right(null);
      } else {
        throw Exception();
      }
    } on FirebaseAuthException {
      return Left(
        Failure.fromType(
          type: const CustomFailure(
            'Opção desativada',
            'Login anônimo desativado no firebase',
          ),
        ),
      );
    } catch (e) {
      return Left(
        Failure.fromType(
          type: const CustomFailure(
            'Erro ao deslogar',
            'Houve um problema ao deslogar da conta',
          ),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(String email) async {
    try {
      await _authProvider.sendPasswordResetEmail(email: email);
      return const Right(null);
    } catch (e) {
      return Left(
        Failure.fromType(
          type: const CustomFailure(
            'Erro ao enviar email',
            'Houve um problema ao enviar o email de recuperação de senha',
          ),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _authProvider.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email' || e.code == 'wrong-password') {
        return Left(
          Failure.fromType(
            type: const CustomFailure(
              'Erro ao logar',
              'E-mail ou senha inválidos',
            ),
          ),
        );
      } else if (e.code == 'user-disabled' || e.code == 'user-not-found') {
        return Left(
          Failure.fromType(
            type: const CustomFailure(
              'Erro ao logar',
              'Usuário inválido ou não encontrado',
            ),
          ),
        );
      } else {
        throw Exception();
      }
    } catch (e) {
      return Left(
        Failure.fromType(
          type: const NormalFailure(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      if (_authProvider.currentUser == null ||
          _authProvider.currentUser!.isAnonymous) {
        final userCredential =
            await _authProvider.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        final user = userCredential.user;
        await user!.updateDisplayName(name);
        await user.reload();

        return Right(user);
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use' || e.code == 'email-invalid') {
        return Left(
          Failure.fromType(
            type: const CustomFailure(
              'Erro ao registrar',
              'E-mail em uso ou inválido',
            ),
          ),
        );
      } else {
        throw Exception();
      }
    } catch (e) {
      return Left(
        Failure.fromType(
          type: const NormalFailure(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, User>> signInWithSocialProvider({
    required SocialAuthProviders provider,
  }) async {
    switch (provider) {
      case SocialAuthProviders.google:
        final signinResult = await _signInWithGoogle();
        final authResult = await _authenticateUserWithProvider(
          signinResult,
          providerId: 'google.com',
          signinMethod: 'google.com',
        );

        return authResult;

      default:
        return Left(
          Failure.fromType(
            type: const FailureType.normal(),
          ),
        );
    }
  }

  Future<Either<Failure, User>> _authenticateUserWithProvider(
    Either<Failure, SocialAuthData> signinResult, {
    required String providerId,
    required String signinMethod,
  }) async {
    return signinResult.fold(
      (l) => Left(l),
      (r) async {
        try {
          final userResult = await _authProvider.signInWithCredential(
            OAuthCredential(
              providerId: providerId,
              signInMethod: signinMethod,
              accessToken: r.accessToken,
              idToken: r.tokenId,
            ),
          );
          if (userResult.user != null) {
            return Right(userResult.user!);
          } else {
            throw Exception();
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            return Left(
              Failure.fromType(
                type: const CustomFailure(
                  'Erro ao logar',
                  'Já existe uma conta associada a este e-mail',
                ),
              ),
            );
          } else {
            throw Exception();
          }
        } catch (e) {
          return Left(
            Failure.fromType(
              type: const NormalFailure(),
            ),
          );
        }
      },
    );
  }

  Future<Either<Failure, SocialAuthData>> _signInWithGoogle() async {
    try {
      await _googleAuthProvider.signOut();
      final signInResult = await _googleAuthProvider.signIn();
      if (signInResult != null) {
        final authResult = await signInResult.toDM();
        return Right(authResult);
      } else {
        return Left(
          Failure.fromType(
            type: const FailureType.authCancel(),
          ),
        );
      }
    } catch (e) {
      return Left(
        Failure.fromType(
          type: const FailureType.normal(),
        ),
      );
    }
  }
}
