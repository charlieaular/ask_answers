import 'dart:convert';
import 'dart:developer';

import 'package:ask_answers/core/errors/failures.dart';
import 'package:ask_answers/features/data/models/ask_answer_model.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart' show required;

abstract class AskLocalDataSource {
  Future<List<AskAnswerModel>> getAsks();
  Future<bool> upButtonCounter();
  Future<int> getButtonCounter();
}

class AskLocalDataSourceImpl extends AskLocalDataSource {
  final SharedPreferences sharedPreferences;

  AskLocalDataSourceImpl({@required this.sharedPreferences});

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

  @override
  Future<int> getButtonCounter() async {
    try {
      return sharedPreferences.getInt('buttonCounter');
    } catch (e) {
      throw new CacheFailure(message: 'Error obteniendo la lista de preguntas');
    }
  }

  @override
  Future<bool> upButtonCounter() async {
    try {
      int counter = await getButtonCounter();
      counter = counter != null ? counter + 1 : 1;
      await sharedPreferences.setInt('buttonCounter', counter);
      return true;
    } catch (e) {
      throw new CacheFailure(message: 'Error obteniendo la lista de preguntas');
    }
  }
}
