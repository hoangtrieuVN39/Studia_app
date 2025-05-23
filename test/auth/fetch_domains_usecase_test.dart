import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/auth/domain/usecases/fetch_domains_usecase.dart';

@GenerateNiceMocks([MockSpec<AppDatabase>()])
import 'fetch_domains_usecase_test.mocks.dart';

void main() {
  late FetchDomainsUsecase usecase;
  late MockAppDatabase mockAppDatabase;

  setUp(() {
    mockAppDatabase = MockAppDatabase();
    usecase = FetchDomainsUsecase(mockAppDatabase);
  });

  test('should fetch domains from database', () async {
    // arrange
    final domains = [
      Domains(domain_id: 1, domain_name: 'Domain 1'),
      Domains(domain_id: 2, domain_name: 'Domain 2'),
    ];
    when(mockAppDatabase.selectDomains()).thenAnswer((_) async => domains);

    // act
    final result = await usecase();

    // assert
    verify(mockAppDatabase.selectDomains());
    expect(result, domains);
  });
}
