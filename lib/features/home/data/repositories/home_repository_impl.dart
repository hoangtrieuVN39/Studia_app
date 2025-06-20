import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/home/data/datasources/home_datasource_local.dart';
import 'package:studia/features/home/data/datasources/home_datasource_remote.dart';
import 'package:studia/features/home/domain/repositories/home_repository.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDatasourceRemote remoteDataSource;
  final HomeDatasourceLocal localDataSource;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Standards>> selectStandards({required int level}) async {
    return await localDataSource.selectStandards(level: level);
  }

  @override
  Future<List<Question>> fetchQuestions(
      {required int? standardId, required int languageId}) async {
    return await remoteDataSource.fetchQuestions(standardId, languageId);
  }

  @override
  Future<List<int>> fetchValidActions() async {
    return await remoteDataSource.fetchValidActions();
  }

  @override
  Future<int> fetchRecommendActions() async {
    return await remoteDataSource.fetchRecommendActions();
  }
}
