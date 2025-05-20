import 'package:dio/dio.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';

class ProfileDatasourceRemote {
  final Dio dio;

  ProfileDatasourceRemote(this.dio);

  Future<Map<Skills, DateTime>> getSkillsTime(List<Skills> skills) async {
    // final response = await dio.get('/skills/time');
    return {
      for (var skill in skills) skill: DateTime.now(),
    };
  }

  Future<void> updateProfile(User user) async {
    // final response = await dio.put('/profile', data: user.toJson());
  }
}

