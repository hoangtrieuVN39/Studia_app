import 'package:studia/features/home/domain/repositories/home_repository.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';

class FetchQuestionsUsecase {
  final HomeRepository homeRepository;

  FetchQuestionsUsecase({required this.homeRepository});

  Future<List<Question>> call({int? standardId}) async {
    return await homeRepository.fetchQuestions(standardId: standardId);
  }
}
