import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show required;

class AskAnswerEntity extends Equatable {
  final int id;
  final String name;
  final List<AnswerEntity> answers;

  AskAnswerEntity(
      {@required this.id, @required this.name, @required this.answers});

  @override
  List<Object> get props => [
        this.id,
        this.name,
        this.answers,
      ];
}

class AnswerEntity extends Equatable {
  final int id;
  final String name;
  final int idAsk;
  final bool correct;

  AnswerEntity(
      {@required this.id,
      @required this.name,
      @required this.idAsk,
      @required this.correct});

  @override
  List<Object> get props => [this.id, this.name, this.idAsk, this.correct];
}
