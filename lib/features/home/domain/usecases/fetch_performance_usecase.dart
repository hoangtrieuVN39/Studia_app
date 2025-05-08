import 'package:studia/features/home/domain/repositories/home_repository.dart';

class FetchPerformanceUsecase {
  final HomeRepository homeRepository;

  FetchPerformanceUsecase({required this.homeRepository});

  Future<Map<String, dynamic>> call({required String userId}) async {
    return await homeRepository.fetchPerformance(userId: userId);
  }
}
