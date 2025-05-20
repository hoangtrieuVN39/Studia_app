import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/profile/data/datasources/profile_datasource_remote.dart';
import 'package:studia/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDatasourceRemote profileDatasourceRemote;

  ProfileRepositoryImpl({required this.profileDatasourceRemote});

  @override
  Future<Map<Skills, DateTime>> getSkillsTime(List<Skills> skills) async {
    final skillsTime = await profileDatasourceRemote.getSkillsTime(skills);
    return skillsTime;
  }

  @override
  Future<void> updateProfile(User user) async {
    await profileDatasourceRemote.updateProfile(user);
  }
}
