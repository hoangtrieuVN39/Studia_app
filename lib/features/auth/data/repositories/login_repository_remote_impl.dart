import "package:studia/core/domain/entities/user.dart";
import "package:studia/features/auth/data/datasources/login_datasource_remote.dart";
import "package:studia/features/auth/domain/repositories/login_repository_remote.dart";

class LoginRepositoryRemoteImpl extends LoginRepositoryRemote {
  final LoginDatasourceRemote loginDatasourceRemote;

  LoginRepositoryRemoteImpl({required this.loginDatasourceRemote});

  @override
  Future<User?> getUser(String userId) async {
    final user = await loginDatasourceRemote.getUser(userId);
    return user;
  }

  @override
  Future<void> register(Map<String, dynamic> data) async {
    await loginDatasourceRemote.register(data);
  }
}
