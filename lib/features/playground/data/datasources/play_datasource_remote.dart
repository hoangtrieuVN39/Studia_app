import 'dart:convert';

import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/features/playground/data/models/answer_model.dart';
import 'package:studia/features/playground/domain/entities/answer.dart';

class PlayDatasourceRemote {
  final DatasourceRemote datasourceRemote;

  PlayDatasourceRemote({required this.datasourceRemote});

  Future<List<double>> sendAnswers(List<Answer> answers) async {
    final encodedAnswers =
        answers
            .map(
              (e) =>
                  AnswerModel(
                    questionId: e.questionId,
                    choiceNumber: e.choiceNumber,
                    timeTaken: e.timeTaken,
                    isCorrect: e.isCorrect,
                  ).toJson(),
            )
            .toList();
    final data = jsonEncode(encodedAnswers);
    final response = await datasourceRemote.post(
      ApiConstants.questions,
      body: data,
    );
    final List<double> result = [];
    for (var e in response) {
      result.add(e.toDouble());
    }
    return result;
  }
}
