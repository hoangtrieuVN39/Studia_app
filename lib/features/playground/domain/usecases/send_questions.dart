import 'package:studia/features/playground/domain/entities/answer.dart';
import 'package:studia/features/playground/domain/repositories/play_repository.dart';

class SendAnswersUsecase {
  final PlayRepository playRepository;

  SendAnswersUsecase({required this.playRepository});

  Future<Map<String, dynamic>> call(List<Answer> answers) async {
    print(answers);
    // await playRepository.sendAnswers(answers);
    return {
      'status': 'success',
      'message': 'Answers sent successfully',
    };
  }
}
