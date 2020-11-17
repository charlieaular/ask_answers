import 'package:ask_answers/features/data/repositories/ask_repository_impl.dart';
import 'package:ask_answers/features/domain/repositories/ask_repository.dart';
import 'package:ask_answers/features/domain/usescases/get_asks_usecase.dart';
import 'package:get_it/get_it.dart';

import 'features/data/datasources/ask_local_datasource.dart';
// import 'features/presentation/controllers/ask_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // sl.registerFactory(() => AskController(useCase: sl()));

  //use case
  sl.registerLazySingleton(() => GetAsksUseCase(sl()));

  //repositories
  sl.registerLazySingleton<AskRepository>(() => AskRepositoryImpl(askLocalDataSource: sl()));

  //datasources
  sl.registerLazySingleton<AskLocalDataSource>(() => AskLocalDataSourceImpl());
}
