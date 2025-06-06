import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/features/playground/data/models/question_model.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';

class HomeDatasourceRemote {
  final DatasourceRemote datasourceRemote;

  HomeDatasourceRemote({required this.datasourceRemote});

  Future<List<Question>> fetchQuestions(int? standard, int language) async {
    final data = {'language_id': language};
    if (standard != null) {
      data['standard_id'] = standard;
    }
    final response = await datasourceRemote.get(
      '${ApiConstants.questions}',
      body: data,
    );
    List<Question> questions = [];
    for (var question in response) {
      questions.add(QuestionModel.fromJson(question));
    }
    return questions;
  }

  Future<List<int>> fetchValidActions() async {
    final response = await datasourceRemote.get(
      ApiConstants.courses + ApiConstants.validActions,
    );
    final List<int> result = [];
    for (var action in response) {
      result.add(action);
    }
    print('result: $result');
    return result;
  }

  Future<int> fetchRecommendActions() async {
    final response = await datasourceRemote.get(
      ApiConstants.courses + ApiConstants.recommendActions,
    );
    return response;
  }
}
