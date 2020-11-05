import 'package:ask_answers/features/domain/entities/ask_answer_model.dart';
import 'package:meta/meta.dart' show required;

class AskAnswerModel extends AskAnswerEntity {
  AskAnswerModel(
      {int id, @required String name, @required List<AnswerModel> answers})
      : super(answers: answers, id: id, name: name);

  factory AskAnswerModel.fromJson(json) {
    List<AnswerModel> answers = List<AnswerModel>();
    if (json["answers"] != null) {
      answers.addAll(json["answers"]);
    }

    return AskAnswerModel(id: json["id"], answers: answers, name: json["name"]);
  }
}

class AnswerModel extends AnswerEntity {
  AnswerModel(
      {int id, @required String name, int idAsk, @required bool correct})
      : super(id: id, name: name, idAsk: idAsk, correct: correct);

  factory AnswerModel.fromJson(json) {
    return AnswerModel(
        id: json["id"],
        name: json["name"],
        idAsk: json["id_ask"],
        correct: json["correct"]);
  }
}
