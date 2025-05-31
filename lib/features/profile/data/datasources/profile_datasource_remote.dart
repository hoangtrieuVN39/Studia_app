import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/auth/data/models/user_model.dart';
import 'package:studia/features/profile/data/models/user_model.dart';

class ProfileDatasourceRemote {
  final DatasourceRemote datasourceRemote;

  ProfileDatasourceRemote(this.datasourceRemote);

  Future<Map<int, DateTime>> getSkillsTime(List<Skills> skills) async {
    final data = {'skills_id': skills.map((skill) => skill.skill_id).toList()};
    final response = await datasourceRemote.post('/skills', body: data);
    Map<int, DateTime> skillsTime = {};
    for (var skill in skills) {
      skillsTime[skill.skill_id] =
          response[skill.skill_id] == null
              ? DateTime.fromMicrosecondsSinceEpoch(0)
              : DateTime.parse(response[skill.skill_id]);
    }
    return skillsTime;
  }

  Future<UserUpdateModel> updateProfile(UserUpdateModel user) async {
    final response = await datasourceRemote.put(
      ApiConstants.account,
      body: user.toUpdateJson(),
    );
    return UserUpdateModel.fromJson(response);
  }
}
