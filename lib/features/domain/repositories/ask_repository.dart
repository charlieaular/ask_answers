import 'package:ask_answers/core/errors/failures.dart';
import 'package:ask_answers/features/domain/entities/ask_answer_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AskRepository {
  Future<Either<Failure, List<AskAnswerEntity>>> getAsks();
}
