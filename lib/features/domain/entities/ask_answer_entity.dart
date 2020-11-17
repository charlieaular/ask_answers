import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show required;

class AskAnswerEntity extends Equatable {
  final int id;
  final String name;
  final List<AnswerEntity> answers;

  AskAnswerEntity({this.id, @required this.name, @required this.answers});

  @override
  List<Object> get props => [
        this.id,
        this.name,
        this.answers,
      ];

  @override
  bool get stringify => true;
}

class AnswerEntity extends Equatable {
  final int id;
  final String name;
  final int idAsk;
  final bool correct;

  AnswerEntity({this.id, @required this.name, this.idAsk, @required this.correct});

  List<Object> get props => [this.id, this.name, this.idAsk, this.correct];
  @override
  bool get stringify => true;
}
