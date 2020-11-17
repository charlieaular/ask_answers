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
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
