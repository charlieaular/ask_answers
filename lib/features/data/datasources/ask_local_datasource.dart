import 'dart:convert';

import 'package:ask_answers/core/errors/failures.dart';
import 'package:ask_answers/features/data/models/ask_answer_model.dart';
import 'package:flutter/services.dart';

abstract class AskLocalDataSource {
  Future<List<AskAnswerModel>> getAsks();
}

class AskLocalDataSourceImpl extends AskLocalDataSource {
  Future<List<AskAnswerModel>> getAsks() async {
    try {
      final json = await rootBundle.loadString('assets/data/questions.json');
      Map<String, dynamic> mapped = jsonDecode(json);
      List<AskAnswerModel> lista = [];
      mapped['questions'].forEach((el) {
        var temp = AskAnswerModel.fromJson(el);
        lista.add(temp);
      });
      return lista;
    } catch (e) {
      throw new CacheFailure(message: 'Error obteniendo la lista de preguntas');
    }
  }
}
