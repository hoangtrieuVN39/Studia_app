import 'package:studia/features/playground/domain/entities/answer.dart';

abstract class PlayRepository {
  Future<List<double>> sendAnswers(List<Answer> answers);
}
