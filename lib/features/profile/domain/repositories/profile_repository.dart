import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';

abstract class ProfileRepository {
  Future<Map<Skills, DateTime>> getSkillsTime(List<Skills> skills);
  Future<void> updateProfile(User user);
}

