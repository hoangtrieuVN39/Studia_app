class AnswerModel {
  final int questionId;
  final int choiceNumber;
  final int timeTaken;
  final bool isCorrect;

  AnswerModel({
    required this.questionId,
    required this.choiceNumber,
    required this.timeTaken,
    required this.isCorrect,
  });

  Map<String, dynamic> toJson() {
    return {
      'question_id': questionId,
      'choice_number': choiceNumber,
      'time': timeTaken,
      'is_correct': isCorrect,
    };
  }
}
