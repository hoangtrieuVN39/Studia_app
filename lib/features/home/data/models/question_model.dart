import 'package:studia/features/playground/domain/entities/questions.dart';

class QuestionModel extends Question {
  QuestionModel({
    required super.question,
    required super.language_id,
    required super.standard_id,
    required super.solution,
    required super.choices,
    required super.answer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'],
      language_id: json['language_id'],
      standard_id: json['standard_id'],
      solution: json['solution'],
      choices: json['choices'],
      answer: json['answer'],
    );
  }
}
