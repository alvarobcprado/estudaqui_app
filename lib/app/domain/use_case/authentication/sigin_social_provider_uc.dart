import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:estudaqui/app/domain/data_repository/auth_data_repository.dart';
import 'package:estudaqui/app/domain/entity/auth/social_auth_providers.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignSocialProviderUC extends UseCase<SignSocialProviderUCParams, User> {
  SignSocialProviderUC({
    required AuthDataRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthDataRepository _authRepository;

  @override
  Future<Either<Failure, User>> call({
    required SignSocialProviderUCParams params,
  }) async {
    return _authRepository.signInWithSocialProvider(
      provider: params.provider,
    );
  }
}

class SignSocialProviderUCParams extends Equatable {
  const SignSocialProviderUCParams({
    required this.provider,
  });
  final SocialAuthProviders provider;
  @override
  List<Object?> get props => [provider];
}
