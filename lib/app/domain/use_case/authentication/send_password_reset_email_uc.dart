import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:estudaqui/app/domain/data_repository/auth_data_repository.dart';
import 'package:estudaqui/app/domain/use_case/use_case.dart';
import 'package:estudaqui/core/error/failure.dart';

class SendPasswordResetEmailUC
    extends UseCase<SendPasswordResetEmailUCParams, void> {
  SendPasswordResetEmailUC({
    required AuthDataRepository authDataRepository,
  }) : _authDataRepository = authDataRepository;

  final AuthDataRepository _authDataRepository;

  @override
  Future<Either<Failure, void>> call({required params}) async {
    return _authDataRepository.sendPasswordResetEmail(params.email);
  }
}

class SendPasswordResetEmailUCParams extends Equatable {
  const SendPasswordResetEmailUCParams({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [email];
}
