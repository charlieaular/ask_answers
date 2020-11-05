import 'package:ask_answers/core/errors/failures.dart';
import 'package:ask_answers/core/usecases/usecase.dart';
import 'package:ask_answers/features/domain/usescases/get_asks_usecase.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;

class AskController extends GetxController {
  final GetAsksUseCase getAsksUseCase;

  AskController({@required useCase})
      : assert(useCase != null),
        getAsksUseCase = useCase;

  Future<void> getAsks() async {
    print("asd");
    final task = await getAsksUseCase(NoParams());
    task.fold((failure) {
      print(failure);
    }, (asks) {
      print(asks);
    });
  }
}
