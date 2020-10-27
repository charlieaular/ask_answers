import 'package:ask_answers/core/errors/failures.dart';
import 'package:ask_answers/core/usecases/usecase.dart';
import 'package:ask_answers/features/domain/entities/ask_answer_model.dart';
import 'package:ask_answers/features/domain/repositories/ask_repository.dart';
import 'package:dartz/dartz.dart';

class GetAsksUseCase extends UseCase<List<AskAnswerEntity>, NoParams> {
  AskRepository askRepository;
  GetAsksUseCase(this.askRepository);

  @override
  Future<Either<Failure, List<AskAnswerEntity>>> call(NoParams) async {
    return await askRepository.getAsks();
  }
}
