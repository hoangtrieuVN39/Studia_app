import 'package:studia/features/playground/data/models/choice_model.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';

class QuestionModel extends Question {
  QuestionModel({
    required super.id,
    required super.question,
    required super.language_id,
    required super.standard_id,
    required super.solution,
    required super.choices,
    required super.answer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['question_id'] as int,
      question: json['question'] as String,
      language_id: json['language_id'] as int,
      standard_id: json['standard_id'] as int,
      solution: json['solution'] as String,
      choices:
          (json['choices'] as List<dynamic>)
              .map((e) => ChoiceModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      answer: json['answer'] as int,
    );
  }
}
