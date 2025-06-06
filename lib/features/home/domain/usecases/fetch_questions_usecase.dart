import 'package:studia/features/home/domain/repositories/home_repository.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';

class FetchQuestionsUsecase {
  final HomeRepository homeRepository;

  FetchQuestionsUsecase({required this.homeRepository});

  Future<List<Question>> call(
      {required int? standardId, required int languageId}) async {
    return await homeRepository.fetchQuestions(
      standardId: standardId,
      languageId: languageId,
    );
  }
}
