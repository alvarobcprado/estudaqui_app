import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:faeng_courses/core/error/failures.dart';

abstract class UseCase<P, T> {
  Future<Either<Failure, T>> call({required P params});
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
