import "package:studia/features/auth/data/datasources/login_datasource_local.dart";
import "package:studia/features/auth/domain/repositories/login_repository_local.dart";

class LoginRepositoryLocalImpl extends LoginRepositoryLocal {
  final LoginDatasourceLocal loginDatasourceLocal;

  LoginRepositoryLocalImpl({required this.loginDatasourceLocal});

  @override
  Future<Map<String, dynamic>> getUser() async {
    final user = await loginDatasourceLocal.getUser();
    return user;
  }

  @override
  Future<void> saveUser(String id, String email, bool isNewUser) async {
    await loginDatasourceLocal.saveUser(id, email, isNewUser);
  }

  @override
  Future<void> removeUser() async {
    await loginDatasourceLocal.removeUser();
  }
}
