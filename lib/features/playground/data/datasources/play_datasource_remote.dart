import 'package:dio/dio.dart';
import 'package:studia/features/playground/domain/entities/answer.dart';

class PlayDatasourceRemote {
  final Dio dio;

  PlayDatasourceRemote({required this.dio});

  Future<Map<String, dynamic>> sendAnswers(List<Answer> answers) async {
    final response = await dio.post(
      'https://api.studia.com/playground/answers',
      data: answers,
    );
    return response.data;
  }
}
