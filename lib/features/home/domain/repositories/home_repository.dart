import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';

abstract class HomeRepository {
  Future<List<Standards>> selectStandards({required int level});
  Future<List<Question>> fetchQuestions({required int? standardId});
}
