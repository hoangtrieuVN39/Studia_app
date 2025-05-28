class Answer {
  final int questionId;
  final int choiceNumber;
  final int timeTaken;
  final bool isCorrect;

  Answer({
    required this.questionId,
    required this.choiceNumber,
    required this.timeTaken,
    required this.isCorrect,
  });
}
