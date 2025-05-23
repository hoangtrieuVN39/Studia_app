import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/features/playground/domain/entities/choice.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';

class HomeDatasourceRemote {
  final DatasourceRemote datasourceRemote;

  HomeDatasourceRemote({required this.datasourceRemote});

  Future<List<Question>> selectQuestions({required int standard}) async {
    // final response = await dio.get(
    //   'https://api.studia.com/questions/$standard',
    // );
    // return response.data.map((e) => QuestionModel.fromJson(e)).toList();
    return [
      Question(
        question: 'What is the capital of France?',
        language_id: 1,
        solution: 'Paris',
        answer: 1,
        choices: [
          Choice(choice_number: 0, choice_text: 'Paris'),
          Choice(choice_number: 1, choice_text: 'London'),
          Choice(choice_number: 2, choice_text: 'Berlin'),
          Choice(choice_number: 3, choice_text: 'Madrid'),
        ],
        standard_id: standard,
      ),
    ];
  }
}
