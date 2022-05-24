import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:estudaqui/core/error/failure.dart';

abstract class UseCase<P, T> {
  Future<Either<Failure, T>> call({required P params});
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
