import 'dart:math';

import 'package:ask_answers/core/errors/failures.dart';
import 'package:ask_answers/core/usecases/usecase.dart';
import 'package:ask_answers/features/data/models/ask_answer_model.dart';
import 'package:ask_answers/features/domain/entities/ask_answer_entity.dart';
import 'package:ask_answers/features/domain/usescases/get_asks_usecase.dart';
import 'package:ask_answers/features/domain/usescases/get_button_counter_usecase.dart';
import 'package:ask_answers/features/domain/usescases/up_button_counter_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;

class AskController extends GetxController {
  final GetAsksUseCase _getAsksUseCase;
  final UpButtonCounterUseCase _upButtonCounterUseCase;
  final GetButtonCounterUseCase _getButtonCounterUseCase;

  AskController({
    @required GetAsksUseCase getAsksUseCase,
    @required UpButtonCounterUseCase upButtonCounterUseCase,
    @required GetButtonCounterUseCase getButtonCounterUseCase,
  })  : assert(getAsksUseCase != null),
        assert(upButtonCounterUseCase != null),
        assert(getButtonCounterUseCase != null),
        _upButtonCounterUseCase = upButtonCounterUseCase,
        _getButtonCounterUseCase = getButtonCounterUseCase,
        _getAsksUseCase = getAsksUseCase;

  List<AskAnswerModel> list = List<AskAnswerModel>();
  bool loading = false;
  AnswerEntity radioValue;
  AskAnswerModel get currentItem => list[currentIndex ?? 0];

  int getIndex() => currentItem.answers.indexOf(radioValue);

  int currentIndex;
  int buttonCounter;
  Future<void> getAsks() async {
    loading = true;
    update(['asks']);
    final task = await _getAsksUseCase(NoParams());
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

  Future<void> upButtonCounter() async {
    final res = await _upButtonCounterUseCase(NoParams());
    res.fold((l) => null, (r) => null);
  }

  Future<void> getButtonCounter() async {
    final res = await _getButtonCounterUseCase(NoParams());
    res.fold((l) => null, (r) => buttonCounter = r);
    update(['counterButton']);
  }
}
