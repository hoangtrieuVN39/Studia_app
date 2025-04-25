import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/auth/data/models/user_model.dart';

abstract class LoginDatasourceRemote {
  Future<User> getUser(String userId);
}

class LoginDatasourceRemoteImpl implements LoginDatasourceRemote {
  final DatasourceRemote datasourceRemote;

  LoginDatasourceRemoteImpl({required this.datasourceRemote});

  @override
  Future<User> getUser(String userId) async {
    final response = await datasourceRemote.get('/users/$userId');
    return UserModel.fromJson(response.data);
  }
}
