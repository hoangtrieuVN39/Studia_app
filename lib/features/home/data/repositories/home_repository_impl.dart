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
  Future<List<Question>> fetchQuestions({int? standard}) async {
    return await remoteDataSource.fetchQuestions(standard: standard);
  }
}
