import 'package:equatable/equatable.dart';
import 'package:estudaqui/core/error/failure_type.dart';

class Failure extends Equatable {
  final String title;
  final String message;
  final FailureType? type;

  const Failure({
    required this.title,
    required this.message,
    this.type,
  });

  static Failure fromType({required FailureType type}) {
    return type.maybeWhen(
      orElse: () => Failure(
        title: 'Algo deu errado',
        message:
            'Poxa, parece que deu algum problema x.x. Tente novamente daqui a pouco!',
        type: type,
      ),
      noConnection: () => Failure(
        title: 'Sem internet',
        message: 'Poxa, parece que você está com problemas em sua conexão x.x',
        type: type,
      ),
      custom: (title, message) => Failure(
        title: title,
        message: message,
        type: type,
      ),
    );
  }

  @override
  List<Object?> get props => [title, message];
}
