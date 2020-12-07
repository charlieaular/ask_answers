import 'package:ask_answers/core/errors/failures.dart';
import 'package:ask_answers/core/usecases/usecase.dart';
import 'package:ask_answers/features/domain/repositories/ask_repository.dart';
import 'package:dartz/dartz.dart';

class UpButtonCounterUseCase implements UseCase<bool, NoParams> {
  final AskRepository askRepository;

  UpButtonCounterUseCase(this.askRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await askRepository.upButtonCounter();
  }
}
