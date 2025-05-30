import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/auth/data/models/user_model.dart';

class ProfileDatasourceRemote {
  final DatasourceRemote datasourceRemote;

  ProfileDatasourceRemote(this.datasourceRemote);

  Future<Map<int, DateTime>> getSkillsTime(List<Skills> skills) async {
    // final response = await datasourceRemote.get('/skills');
    // return response.data.map(
    //   (key, value) => MapEntry(int.parse(key), DateTime.parse(value)),
    // );
    return {for (var skill in skills) skill.skill_id: DateTime.now()};
  }

  Future<UserModel> updateProfile(UserModel user) async {
    final response = await datasourceRemote.put(
      ApiConstants.account,
      body: user.toUpdateJson(),
    );
    return UserModel.fromJson(response);
  }
}
