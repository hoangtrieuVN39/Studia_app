import 'package:studia/core/data/datasources/local/drift/database.dart';

class FetchLevelsUsecase {
  final AppDatabase appDatabase;

  FetchLevelsUsecase(this.appDatabase);

  Future<List<Levels>> call() async {
    final levels = await appDatabase.selectLevels();
    return levels;
  }
}
