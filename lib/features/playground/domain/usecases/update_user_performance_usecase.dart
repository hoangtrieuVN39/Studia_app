import 'package:studia/core/core.dart';

class UpdateUserPerformanceUseCase {
  final UserProvider userProvider;

  UpdateUserPerformanceUseCase({required this.userProvider});

  Future<void> call(List<double> performance) async {
    userProvider.setUser(userProvider.user!.copyWith(performance: performance));
  }
}
