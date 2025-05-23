import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';

class HomeDatasourceLocal {
  final AppDatabase appDatabase;
  
  HomeDatasourceLocal({required this.appDatabase});

  Future<List<Standards>> selectStandards({required int level}) async {
    return await appDatabase.selectStandards(level: level);
  }
}

