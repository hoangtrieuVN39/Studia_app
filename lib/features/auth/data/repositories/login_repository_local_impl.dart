import "package:studia/core/constants/language_constants.dart";
import "package:studia/features/auth/data/datasources/login_datasource_local.dart";
import "package:studia/features/auth/domain/repositories/login_repository_local.dart";

class LoginRepositoryLocalImpl extends LoginRepositoryLocal {
  final LoginDatasourceLocal loginDatasourceLocal;

  LoginRepositoryLocalImpl(this.loginDatasourceLocal);

  @override
  Future<Map<String, dynamic>> getUser() async {
    final user = await loginDatasourceLocal.getUser();
    return user;
  }

  @override
  Future<void> saveUser(String id, String email) async {
    await loginDatasourceLocal.saveUser(id, email);
  }

  @override
  Future<void> removeUser() async {
    await loginDatasourceLocal.removeUser();
  }

  @override
  Future<Language> getLanguage() async {
    return await loginDatasourceLocal.getLanguage();
  }
}
