import 'package:ask_answers/features/data/models/ask_answer_model.dart';
import 'package:flutter/services.dart';

abstract class AskLocalDataSource {
  Future<List<AskAnswerModel>> getAsks();
}

class AskLocalDataSourceImpl extends AskLocalDataSource {
  Future<List<AskAnswerModel>> getAsks() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final json = await rootBundle.loadString('assets/data/questions.json');
      print('---------------------------');
      print(json);
      final lista = AskAnswerModel.fromJson(json);
      print(lista);
    } catch (e) {
      print('asdasdasdasdasdasdasdasdasdasdasdasdasdasdasd');
    }
    /*List<AnswerModel> answers1 = [
      AnswerModel(correct: true, id: 1, idAsk: 1, name: "respuesta1"),
      AnswerModel(correct: false, id: 2, idAsk: 1, name: "respuesta2"),
      AnswerModel(correct: false, id: 3, idAsk: 1, name: "respuesta3"),
      AnswerModel(correct: false, id: 4, idAsk: 1, name: "respuesta4"),
    ];

    List<AnswerModel> answers2 = [
      AnswerModel(correct: false, id: 1, idAsk: 2, name: "respuesta2.1"),
      AnswerModel(correct: false, id: 2, idAsk: 2, name: "respuesta2.2"),
      AnswerModel(correct: true, id: 3, idAsk: 2, name: "respuesta2.3"),
      AnswerModel(correct: false, id: 4, idAsk: 2, name: "respuesta2.4"),
    ];
    List<AskAnswerModel> models = [
      AskAnswerModel(answers: answers1, id: 1, name: "pregunta 1"),
      AskAnswerModel(answers: answers2, id: 2, name: "pregunta 2"),
    ];
    return models;*/
  }
}
