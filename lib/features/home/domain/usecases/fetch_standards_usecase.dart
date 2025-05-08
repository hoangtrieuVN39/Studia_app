import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/home/domain/repositories/home_repository.dart';

class FetchStandardsUsecase {
  final HomeRepository homeRepository;

  FetchStandardsUsecase({required this.homeRepository});

  Future<List<Standards>> call({required int level}) async {
    return await homeRepository.selectStandards(level: level);
  }
}
