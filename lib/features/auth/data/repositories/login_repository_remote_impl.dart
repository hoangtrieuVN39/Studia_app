import "package:studia/core/data/datasources/local/drift/database.dart";
import "package:studia/core/domain/entities/user.dart";
import "package:studia/features/auth/data/datasources/login_datasource_remote.dart";
import "package:studia/features/auth/domain/repositories/login_repository_remote.dart";

class LoginRepositoryRemoteImpl extends LoginRepositoryRemote {
  final LoginRemoteDataSource loginDatasourceRemote;
  final AppDatabase appDatabase;

  LoginRepositoryRemoteImpl({
    required this.loginDatasourceRemote,
    required this.appDatabase,
  });

  @override
  Future<User?> getUser(String userId) async {
    final user = await loginDatasourceRemote.getUser(userId);
    if (user != null) {
      final level = await appDatabase.selectLevels(id: user.parseLevelId);
      return user.copyWithResolvedLevel(level.first);
    }
    return null;
  }

  @override
  Future<bool> register(Map<String, dynamic> data) async {
    return await loginDatasourceRemote.register(data);
  }
}
