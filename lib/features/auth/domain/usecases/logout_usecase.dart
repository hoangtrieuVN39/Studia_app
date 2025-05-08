import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/auth/domain/repositories/login_repository_local.dart';

class LogoutUsecase {
  final LoginRepositoryLocal loginRepositoryLocal;

  LogoutUsecase(AppDatabase appDatabase, {required this.loginRepositoryLocal});

  Future<void> call() async {
    await loginRepositoryLocal.removeUser();
  }
}
