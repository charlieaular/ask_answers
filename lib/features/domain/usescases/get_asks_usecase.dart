import 'package:ask_answers/core/errors/failures.dart';
import 'package:ask_answers/core/usecases/usecase.dart';
import 'package:ask_answers/features/domain/entities/ask_answer_entity.dart';
import 'package:ask_answers/features/domain/repositories/ask_repository.dart';
import 'package:dartz/dartz.dart';

class GetAsksUseCase extends UseCase<List<AskAnswerEntity>, NoParams> {
  AskRepository askRepository;
  GetAsksUseCase(this.askRepository);

  @override
  Future<Either<Failure, List<AskAnswerEntity>>> call(NoParams noParams) async {
    return await askRepository.getAsks();
  }
}
