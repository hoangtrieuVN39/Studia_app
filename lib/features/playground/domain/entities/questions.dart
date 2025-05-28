import 'package:studia/features/playground/domain/entities/choice.dart';

class Question {
  final int id;
  final String question;
  final int language_id;
  final int standard_id;
  final String solution;
  final int answer;
  final List<Choice> choices;

  Question({
    required this.id,
    required this.question,
    required this.language_id,
    required this.standard_id,
    required this.solution,
    required this.answer,
    required this.choices,
  });
}
