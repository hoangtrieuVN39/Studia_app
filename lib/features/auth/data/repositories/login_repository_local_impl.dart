import "package:studia/core/domain/entities/user.dart";
import "package:studia/features/auth/data/datasources/login_datasource_local.dart";
import "package:studia/features/auth/data/models/user_model.dart";
import "package:studia/features/auth/domain/repositories/login_repository_local.dart";

class LoginRepositoryLocalImpl extends LoginRepositoryLocal {
  final LoginDatasourceLocal loginDatasourceLocal;

  LoginRepositoryLocalImpl({required this.loginDatasourceLocal});

  @override
  Future<User?> getUser() async {
    final user = await loginDatasourceLocal.getUser();
    return user;
  }

  @override
  Future<void> saveUser(User user) async {
    await loginDatasourceLocal.saveUser(user);
  }
}
