import 'package:studia/core/data/datasources/local/drift/database.dart';

class FetchSkillsUsecase {
  final AppDatabase appDatabase;

  FetchSkillsUsecase(this.appDatabase);

  Future<List<Skills>> call() async {
    final skills = await appDatabase.selectSkills();
    return skills;
  }
}
