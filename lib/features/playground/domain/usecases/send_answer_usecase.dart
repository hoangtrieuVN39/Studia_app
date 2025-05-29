import 'package:studia/features/playground/domain/entities/answer.dart';
import 'package:studia/features/playground/domain/repositories/play_repository.dart';

class SendAnswersUsecase {
  final PlayRepository playRepository;

  SendAnswersUsecase({required this.playRepository});

  Future<List<double>> call(List<Answer> answers) async {
    print(answers);
    final result = await playRepository.sendAnswers(answers);
    return result;
  }
}
