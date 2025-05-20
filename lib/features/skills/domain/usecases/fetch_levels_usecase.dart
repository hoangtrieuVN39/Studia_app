import 'package:studia/core/data/datasources/local/drift/database.dart';

class FetchLevelsUsecase {
  final AppDatabase appDatabase;

  FetchLevelsUsecase(this.appDatabase);

  Future<List<Levels>> call() async {
    return appDatabase.selectLevels();
  }
}
