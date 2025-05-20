import 'package:studia/features/auth/domain/repositories/login_repository_local.dart';

class LogoutUsecase {
  final LoginRepositoryLocal loginRepositoryLocal;

  LogoutUsecase({required this.loginRepositoryLocal});

  Future<void> call() async {
    await loginRepositoryLocal.removeUser();
  }
}
