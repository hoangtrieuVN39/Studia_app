import 'package:studia/features/playground/domain/entities/answer.dart';

class AnswerModel extends Answer {
  final int questionId;
  final int choiceNumber;
  final int timeTaken;
  final DateTime timeCreated;
  final bool isCorrect;

  AnswerModel({
    required this.questionId,
    required this.choiceNumber,
    required this.timeTaken,
    required this.isCorrect,
    required this.timeCreated,
  }) : super(
         questionId: 0,
         choiceNumber: 0,
         timeTaken: 0,
         timeCreated: DateTime.now(),
         isCorrect: false,
       );

  Map<String, dynamic> toJson() {
    return {
      'question_id': questionId,
      'choice_number': choiceNumber,
      'time_taken': timeTaken,
      'is_correct': isCorrect,
      'time_created': timeCreated.toIso8601String(),
    };
  }

  static AnswerModel fromAnswer(Answer answer) {
    return AnswerModel(
      questionId: answer.questionId,
      choiceNumber: answer.choiceNumber,
      timeTaken: answer.timeTaken,
      isCorrect: answer.isCorrect,
      timeCreated: answer.timeCreated,
    );
  }
}
