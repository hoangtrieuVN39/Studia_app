import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/features/home/data/models/question_model.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';

class HomeDatasourceRemote {
  final DatasourceRemote datasourceRemote;

  HomeDatasourceRemote({required this.datasourceRemote});

  Future<List<Question>> fetchQuestions({int? standard}) async {
    final data = {'standard_id': standard};
    final response = await datasourceRemote.get(
      '${ApiConstants.questions}',
      data,
    );
    return response.map((e) => QuestionModel.fromJson(e)).toList();
  }
}
