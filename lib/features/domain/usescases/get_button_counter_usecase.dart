import 'package:ask_answers/core/errors/failures.dart';
import 'package:ask_answers/core/usecases/usecase.dart';
import 'package:ask_answers/features/domain/repositories/ask_repository.dart';
import 'package:dartz/dartz.dart';

class GetButtonCounterUseCase implements UseCase<int, NoParams> {
  final AskRepository askRepository;

  GetButtonCounterUseCase(this.askRepository);

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return await askRepository.getButtonCounter();
  }
}
