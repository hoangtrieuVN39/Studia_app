import 'package:studia/features/playground/domain/entities/answer.dart';

abstract class PlayRepository {
  Future<Map<String, dynamic>> sendAnswers(List<Answer> answers);
}
