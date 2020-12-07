import 'package:ask_answers/core/errors/failures.dart';
import 'package:ask_answers/features/data/datasources/ask_local_datasource.dart';
import 'package:ask_answers/features/domain/entities/ask_answer_entity.dart';
import 'package:ask_answers/features/domain/repositories/ask_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart' show required;

class AskRepositoryImpl extends AskRepository {
  final AskLocalDataSource askLocalDataSource;

  AskRepositoryImpl({@required this.askLocalDataSource});
  @override
  Future<Either<Failure, List<AskAnswerEntity>>> getAsks() async {
    try {
      List<AskAnswerEntity> asks = await askLocalDataSource.getAsks();
      return Right(asks);
    } on CacheFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, int>> getButtonCounter() async {
    try {
      final int counter = await askLocalDataSource.getButtonCounter();
      return Right(counter);
    } on CacheFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> upButtonCounter() async {
    try {
      final bool upped = await askLocalDataSource.upButtonCounter();
      return Right(upped);
    } on CacheFailure catch (e) {
      return Left(e);
    }
  }
}
