import 'package:ask_answers/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}