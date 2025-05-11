import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/home/data/datasources/home_datasource_remote.dart';
import 'package:studia/features/home/domain/repositories/home_repository.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';

class HomeRepositoryImpl extends HomeRepository {
  final AppDatabase appDatabase;
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({
    required this.appDatabase,
    required this.remoteDataSource,
  });

  @override
  Future<List<Standards>> selectStandards({required int level}) async {
    return await appDatabase.selectStandards(level: level);
  }

  @override
  Future<Map<String, dynamic>> fetchPerformance({
    required String userId,
  }) async {
    return await remoteDataSource.fetchPerformance(userId: userId);
  }

  @override
  Future<List<Question>> selectQuestions({required int standard}) async {
    return await remoteDataSource.selectQuestions(standard: standard);
  }
}
