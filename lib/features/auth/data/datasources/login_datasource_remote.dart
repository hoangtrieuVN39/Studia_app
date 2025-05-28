import 'dart:math';

import 'package:studia/core/constants.dart';
import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/core/error/exceptions.dart';
import 'package:studia/features/auth/data/models/user_model.dart';

abstract class LoginRemoteDataSource {
  Future<UserModel?> getUser(String userId);
  Future<bool> register(Map<String, dynamic> data);
}

class LoginDatasourceRemoteImpl implements LoginRemoteDataSource {
  final DatasourceRemote datasourceRemote;

  LoginDatasourceRemoteImpl({required this.datasourceRemote});

  Future<UserModel?> getUser(String userId) async {
    try {
      final data = {'user_id': userId};
      final jsonData = await datasourceRemote.post(
        ApiConstants.login,
        body: data,
      );
      return UserModel.fromJson(jsonData);
    } catch (e) {
      if (e is NetworkException) {
        print('Network error details: ${e.message}');
        rethrow;
      }
      if (e is ServerException) {
        print('Server error details: ${e.message}');
        rethrow;
      }
      print('Error details: $e');
      return null;
    }
  }

  Future<bool> register(Map<String, dynamic> data) async {
    try {
      print('Register data: $data');

      await datasourceRemote.post(ApiConstants.register, body: data);
      return true;
    } catch (e) {
      print('Registration error: $e');
      if (e is NetworkException || e is ServerException) {
        print('Network error details: $e');
        rethrow;
      }
      print('Server error details: $e');
      throw Exception('Failed to register user: $e');
    }
  }
}

UserModel getUserMock() {
  return UserModel.fromJson({
    'id': '1',
    'email': 'test@test.com',
    'firstName': 'Test',
    'lastName': 'Test',
    'gender': 'male',
    'avatar': '',
    'birthYear': 1990,
    'performance': [for (var i = 0; i < 484; i++) Random().nextDouble()],
    'levelId': 0,
  });
}
