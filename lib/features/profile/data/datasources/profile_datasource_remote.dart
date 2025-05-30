import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/features/auth/data/models/user_model.dart';

class ProfileDatasourceRemote {
  final DatasourceRemote datasourceRemote;

  ProfileDatasourceRemote(this.datasourceRemote);

  Future<Map<int, DateTime>> getSkillsTime() async {
    final response = await datasourceRemote.get('/skills');
    return response.data.map(
      (key, value) => MapEntry(int.parse(key), DateTime.parse(value)),
    );
  }

  Future<void> updateProfile(UserModel user) async {
    await datasourceRemote.put('/profile', body: user.toJson());
  }
}
