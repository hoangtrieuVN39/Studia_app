import 'package:studia/core/data/datasources/local/drift/database.dart';

class FetchDomainsUsecase {
  final AppDatabase appDatabase;

  FetchDomainsUsecase(this.appDatabase);

  Future<List<DomainDetails>> call(
    List<double> userPerformance,
    Levels level,
  ) async {
    List<Standards> standards = await appDatabase.selectStandards(
      level: level.level_id,
    );
    List<Domains> domains = await appDatabase.selectDomains();

    List<DomainDetails> domainsDetails = [];

    for (Domains domain in domains) {
      List<Standards> filteredStandards =
          standards
              .where((standard) => standard.domain == domain.domain_id)
              .toList();
      if (filteredStandards.isNotEmpty) {
        domainsDetails.add(
          DomainDetails(
            domain: domain,
            progress: getProgress(userPerformance, filteredStandards),
          ),
        );
      }
    }

    return domainsDetails;
  }

  double getProgress(List<double> userPerformance, List<Standards> standards) {
    double progress = 0;
    for (Standards standard in standards) {
      progress += userPerformance[standard.standard_id];
    }
    return progress / standards.length;
  }
}

class DomainDetails {
  Domains? domain;
  double? progress;

  DomainDetails({this.domain, this.progress});
}
