import 'package:equatable/equatable.dart';
import 'package:faeng_courses/core/error/failure_type.dart';

class Failure extends Equatable {
  final String title;
  final String message;

  const Failure({
    required this.title,
    required this.message,
  });

  static Failure fromType({required FailureType type}) {
    return type.when(
      normal: () => const Failure(
        title: 'Algo deu errado',
        message:
            'Poxa, parece que deu algum problema x.x. Tente novamente daqui a pouco!',
      ),
      noConnection: () => const Failure(
        title: 'Sem internet',
        message: 'Poxa, parece que você está com problemas em sua conexão x.x',
      ),
      custom: (title, message) => Failure(title: title, message: message),
    );
  }

  @override
  List<Object?> get props => [title, message];
}
