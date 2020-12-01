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
  AnswerEntity radioValue;
  AskAnswerModel get currentItem => list[currentIndex ?? 0];

  int getIndex() => currentItem.answers.indexOf(radioValue);

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

  nextPage() {
    if (getIndex() == null || getIndex() < 0) {
      Get.defaultDialog(
          title: 'Campo Obligatorio',
          content: Text('Seleccione una respuesta para continuar'),
          textConfirm: 'Esta bien',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    } else {
      bool current = currentItem.answers[getIndex()].correct;
      if (!current) {
        Get.defaultDialog(
            title: 'Respuesta Incorrecta',
            content: Icon(
              Icons.cancel_rounded,
              color: Colors.red,
              size: 150.0,
            ),
            textConfirm: 'OK!',
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
              // list.removeAt(currentIndex);
              // randomIndex();
            });
      } else {
        Get.defaultDialog(
            barrierDismissible: false,
            title: 'Respuesta Correcta',
            content: Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 150.0,
            ),
            textConfirm: 'OK!',
            confirmTextColor: Colors.white,
            onConfirm: () {
              radioValue = null;

              Get.back();
              list.removeAt(currentIndex);
              randomIndex();
            });
      }
    }
  }

  randomIndex() {
    int max = list.length;
    Random rnd = Random();
    currentIndex = rnd.nextInt(max);
    update(['asks']);
  }

  void setRadio(AnswerEntity e) {
    radioValue = e;

    update(['asks']);
  }
}
