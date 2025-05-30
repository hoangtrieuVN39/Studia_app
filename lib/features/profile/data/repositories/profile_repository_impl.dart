import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/auth/data/models/user_model.dart';
import 'package:studia/features/profile/data/datasources/profile_datasource_remote.dart';
import 'package:studia/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDatasourceRemote profileDatasourceRemote;
  final AppDatabase appDatabase;
  final UserProvider userProvider;

  ProfileRepositoryImpl({
    required this.profileDatasourceRemote,
    required this.appDatabase,
    required this.userProvider,
  });

  @override
  Future<Map<Skills, DateTime>> getSkillsTime(List<Skills> skills) async {
    final skillsTime = await profileDatasourceRemote.getSkillsTime(skills);
    Map<Skills, DateTime> skillsTimeMap = {};
    for (var skill in skills) {
      skillsTimeMap[skill] =
          skillsTime[skill.skill_id] ?? DateTime.fromMillisecondsSinceEpoch(0);
    }
    return skillsTimeMap;
  }

  @override
  Future<void> updateProfile(User user) async {
    final updatedUser = await profileDatasourceRemote.updateProfile(
      UserModel.fromUser(user),
    );
    final level = await appDatabase.selectLevels(id: updatedUser.parseLevelId);
    final userWithLevel = updatedUser.copyWithResolvedLevel(level.first);
    userProvider.setUser(userWithLevel);
  }
}
