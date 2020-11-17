import 'dart:math';

import 'package:ask_answers/core/errors/failures.dart';
import 'package:ask_answers/core/usecases/usecase.dart';
import 'package:ask_answers/features/data/models/ask_answer_model.dart';
import 'package:ask_answers/features/domain/entities/ask_answer_entity.dart';
import 'package:ask_answers/features/domain/usescases/get_asks_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;

class AskController extends GetxController {
  final GetAsksUseCase getAsksUseCase;

  AskController({@required GetAsksUseCase useCase})
      : assert(useCase != null),
        getAsksUseCase = useCase;

  List<AskAnswerModel> list = List<AskAnswerModel>();
  bool loading = false;

  AskAnswerModel get currentItem => list[currentIndex ?? 0];

  int currentIndex;

  Future<void> getAsks() async {
    loading = true;
    update(['asks']);
    final task = await getAsksUseCase(NoParams());
    task.fold((failure) {
      print(failure);
    }, (asks) {
      list = asks;
      randomIndex();
    });
    loading = false;
    update(['asks']);
  }

  nextPage(int answerIndex) {
    bool current = currentItem.answers[answerIndex].correct;
    if (!current) {
      AnswerEntity correct = currentItem.answers.firstWhere((el) => el.correct);
      Get.defaultDialog(
          title: 'Respuesta equivocada',
          content: Text('La respuesta correcta es: \n${correct.name}'),
          textConfirm: 'Esta bien',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
            list.removeAt(currentIndex);
            randomIndex();
          });
    } else {
      list.removeAt(currentIndex);
      randomIndex();
    }
  }

  randomIndex() {
    int max = list.length;
    Random rnd = Random();
    currentIndex = rnd.nextInt(max);
    update(['asks']);
  }
}
