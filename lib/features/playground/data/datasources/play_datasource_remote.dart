import 'package:dio/dio.dart';
import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/features/playground/domain/entities/answer.dart';

class PlayDatasourceRemote {
  final DatasourceRemote datasourceRemote;

  PlayDatasourceRemote({required this.datasourceRemote});

  Future<Map<String, dynamic>> sendAnswers(List<Answer> answers) async {
    final response = await datasourceRemote.post(
      'https://api.studia.com/playground/answers',
      body: answers,
    );
    return response.data;
  }
}
