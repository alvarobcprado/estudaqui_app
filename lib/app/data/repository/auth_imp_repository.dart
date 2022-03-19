import 'package:dartz/dartz.dart';
import 'package:faeng_courses/core/error/failure.dart';
import 'package:faeng_courses/core/error/failure_type.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:faeng_courses/app/domain/data_repository/auth_data_repository.dart';

class AuthImpRepository implements AuthDataRepository {
  AuthImpRepository({
    required FirebaseAuth authProvider,
  }) : _authProvider = authProvider;

  final FirebaseAuth _authProvider;

  @override
  Stream<User?> get authStateChanges => _authProvider.authStateChanges();

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    final user = _authProvider.currentUser;
    if (user != null) {
      return Right(user);
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
      await _authProvider.signOut();
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
    required String email,
    required String password,
  }) async {
    try {
      if (_authProvider.currentUser != null &&
          !_authProvider.currentUser!.isAnonymous) {
        final userCredential =
            await _authProvider.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        return Right(userCredential.user!);
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
}
