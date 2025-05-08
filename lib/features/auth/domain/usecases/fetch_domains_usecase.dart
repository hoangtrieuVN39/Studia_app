import 'package:studia/core/data/datasources/local/drift/database.dart';

class FetchDomainsUsecase {
  final AppDatabase appDatabase;

  FetchDomainsUsecase(this.appDatabase);

  Future<List<Domains>> call() async {
    final domains = await appDatabase.selectDomains();
    return domains;
  }
}
