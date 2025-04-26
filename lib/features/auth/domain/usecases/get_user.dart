import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_remote.dart';

class GetUserUsecase {
  final LoginRepositoryRemote loginRepositoryRemote;

  GetUserUsecase({required this.loginRepositoryRemote});

  Future<User?> call(String userId) async {
    final user = await loginRepositoryRemote.getUser(userId);
    return user;
  }
}
