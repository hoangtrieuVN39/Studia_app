import 'package:studia/core/data/datasources/local/drift/database.dart';

abstract class HomeRepository {
  Future<List<Standards>> selectStandards({required int level});
  Future<Map<String, dynamic>> fetchPerformance({required String userId});
}
