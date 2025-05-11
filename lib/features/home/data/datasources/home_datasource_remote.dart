import 'dart:math';

import 'package:dio/dio.dart';
import 'package:studia/features/home/data/models/question_model.dart';
import 'package:studia/features/playground/domain/entities/choice.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';

class HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSource({required this.dio});

  Future<Map<String, dynamic>> fetchPerformance({
    required String userId,
  }) async {
    // final response = await dio.get(
    //   'https://api.studia.com/performance/$userId',
    // );
    // return response.data;

    return {
      for (var i = 0; i < 300; i++)
        '$i': {
          'performance': Random().nextDouble(),
          'prerequisite':
              Random().nextInt(300) - 150 < 0 ? 0 : Random().nextInt(300) - 150,
        },
    };
  }

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
